#!/bin/bash

# Exit on any error
set -e

echo "Starting Kubernetes cluster setup script for Ubuntu..."

# --- 1. Prepare the environment ---
echo "Disabling swap..."
sudo swapoff -a
# Permanently disable swap by commenting out the swap line in /etc/fstab
#sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo sed -i.bak '/swap\.img/ s|^\s*|# |' /etc/fstab

echo "Enabling kernel modules and sysctl parameters for Kubernetes networking..."
sudo tee /etc/modules-load.d/k8s.conf <<EOF
overlay
br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter

# Sysctl params as per Kubernetes docs
sudo tee /etc/sysctl.d/k8s.conf <<EOF
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
sudo sysctl --system

# --- 2. Install Containerd runtime ---
echo "Installing containerd..."
# Add Docker's official GPG key and repository
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install containerd
sudo apt update
sudo apt install -y containerd.io

# Configure containerd and restart
# Use systemd cgroup driver
sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml > /dev/null
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl enable containerd

# --- 3. Install Kubeadm, Kubelet, and Kubectl ---
echo "Installing kubeadm, kubelet, and kubectl..."
sudo apt update
#curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/kubernetes-archive-keyring.gpg
#echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.33/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null


sudo apt update
sudo apt install -y kubelet kubeadm kubectl
# Hold packages to prevent automatic updates
sudo apt-mark hold kubelet kubeadm kubectl

# --- 4. Initialize the Control Plane ---
echo "Initializing the Kubernetes cluster with kubeadm init..."
# Use a common Pod network CIDR (Calico uses 192.168.0.0/16 by default)
#sudo kubeadm init --pod-network-cidr=192.168.0.0/16
#The --pod-network-cidr enables inter-pod networking which we will install using Cilium and the cidr range for cilium is 10.1.1.0/24
#sudo kubeadm init --skip-phases=addon/kube-proxy --pod-network-cidr=10.1.1.0/24
#sudo kubeadm init --skip-phases=addon/kube-proxy --pod-network-cidr=10.1.1.0/24
sudo kubeadm init --skip-phases=addon/kube-proxy   i used this command to skip kube-proxy installation because cilium will be used as the CNI and it has its own kube-proxy replacement called cilium-kube-proxy which will be installed along with cilium


# --- 5. Configure Kubectl access for regular user ---
echo "Configuring kubectl access..."
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# --- 6. Deploy CNI (Calico) ---
echo "Deploying Calico network plugin..."
# Apply the Calico manifest
kubectl apply -f https://tigera.io

echo "Kubernetes control plane initialized successfully!"
echo "Run 'kubectl get nodes' to check status. Node status will be 'Ready' once Calico is fully running."
echo "Save the join command printed above for adding worker nodes."
