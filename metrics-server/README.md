Manually modify manifest file
curl -sSL -o metrics-server-components.yaml https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

Set --secure-port to 4443 Add --kubelet-insecure-tls to skip verifying Kubelet CA certificates.

spec:
      containers:
      - args:
        - --cert-dir=/tmp
        - --secure-port=4443
        - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
        - --kubelet-use-node-status-port
        - --metric-resolution=15s
        - --kubelet-insecure-tls
Change container listening port from 10250 to 4443:

ports:
        - containerPort: 4443
Find nodeSelector and add hostNetwork: true just before it.

hostNetwork: true
nodeSelector:
    kubernetes.io/os: linux
Apply the manifest to create the resources.

kubectl apply -f metrics-server-components.yaml
