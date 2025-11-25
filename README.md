cka
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.0/standard-install.yaml

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.15.2/config/manifests/metallb-native.yaml


metallb working


kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.15.2/config/manifests/metallb-native.yaml

192.168.140.102-192.168.140.105
thiru@DNB227N:/mnt/c/Users/thiru/Documents/cka/metallb$ kubectl get svc
NAME           TYPE           CLUSTER-IP       EXTERNAL-IP       PORT(S)        AGE
hello-server   LoadBalancer   10.98.149.133    192.168.140.102   80:31064/TCP   29m
kubernetes     ClusterIP      10.96.0.1        <none>            443/TCP        6d23h
my-nginx       LoadBalancer   10.101.191.191   192.168.140.103   80:31299/TCP   95m

https://akyriako.medium.com/load-balancing-with-metallb-in-bare-metal-kubernetes-271aab751fb8

 kubectl api-resources --api-group=gateway.networking.k8s.io