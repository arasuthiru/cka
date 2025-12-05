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

#5/12/25
tested nfs mountpth using nfs server direct nfs mount to pod
also test pv and pvc nfs stoage to crated and pvc claim on pod. 

#6/12/25
tmr session
configmap jboss standlon file 
example lin for confgmap mountpath
https://stackoverflow.com/questions/43544370/kubernetes-how-to-set-volumemount-user-group-and-file-permissions

