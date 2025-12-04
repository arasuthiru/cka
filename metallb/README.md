kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.15.2/config/manifests/metallb-native.yaml

after apply this

check metalb pod crested 
kubectl get all -n metallb-system 

Outputs:
 kubectl get all -n metallb-system
NAME                             READY   STATUS    RESTARTS      AGE
pod/controller-78fb49f59-8l5qb   1/1     Running   3 (53m ago)   66m
pod/speaker-xtqmp                1/1     Running   0             66m
pod/speaker-zkp8m                1/1     Running   0             66m

NAME                              TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
service/metallb-webhook-service   ClusterIP   10.108.184.7   <none>        443/TCP   66m

NAME                     DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
daemonset.apps/speaker   2         2         2       2            2           kubernetes.io/os=linux   66m

NAME                         READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/controller   1/1     1            1           66m

NAME                                   DESIRED   CURRENT   READY   AGE
replicaset.apps/controller-78fb49f59   1         1         1       66m

#then apply ipaddrssspool and then l2advertisement yaml files
check kubectl get svc 
thiru@thiru-master1:~$ kubectl get svc
NAME                              TYPE           CLUSTER-IP       EXTERNAL-IP       PORT(S)                        AGE
jboss-hello-service               LoadBalancer   10.100.92.84     192.168.150.111   80:32723/TCP                   21m
kubernetes                        ClusterIP      10.96.0.1        <none>            443/TCP                        16d
my-nginx                          ClusterIP      10.100.122.153   <none>            80/TCP                         9d
nginx-test                        NodePort       10.98.98.117     <none>            80:31372/TCP                   16d
web-gateway-istio-gateway-class   LoadBalancer   10.107.210.216   192.168.150.110   15021:31652/TCP,80:32473/TCP   8d
thiru@thiru-master1:~$
