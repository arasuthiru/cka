controlplane ~ ➜  k get all -A
NAMESPACE       NAME                                       READY   STATUS    RESTARTS   AGE
default         pod/app                                    1/1     Running   0          39m
default         pod/fluent-ui                              1/1     Running   0          39m
elastic-stack   pod/app                                    2/2     Running   0          39m
elastic-stack   pod/elastic-search                         1/1     Running   0          39m
elastic-stack   pod/kibana                                 1/1     Running   0          39m
kube-flannel    pod/kube-flannel-ds-hxlcl                  1/1     Running   0          4h8m
kube-flannel    pod/kube-flannel-ds-vq4sk                  1/1     Running   0          4h8m
kube-system     pod/coredns-7484cd47db-pkwh6               1/1     Running   0          4h8m
kube-system     pod/coredns-7484cd47db-v2b92               1/1     Running   0          4h8m
kube-system     pod/etcd-controlplane                      1/1     Running   0          4h8m
kube-system     pod/kube-apiserver-controlplane            1/1     Running   0          4h8m
kube-system     pod/kube-controller-manager-controlplane   1/1     Running   0          4h8m
kube-system     pod/kube-proxy-dfdg4                       1/1     Running   0          4h8m
kube-system     pod/kube-proxy-vxmbl                       1/1     Running   0          4h8m
kube-system     pod/kube-scheduler-controlplane            1/1     Running   0          4h8m

NAMESPACE       NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                         AGE
default         service/fluent-ui-service   NodePort    172.20.61.231   <none>        80:30080/TCP,24224:30224/TCP    39m
default         service/kubernetes          ClusterIP   172.20.0.1      <none>        443/TCP                         4h8m
elastic-stack   service/elasticsearch       NodePort    172.20.9.87     <none>        9200:30200/TCP,9300:30300/TCP   39m
elastic-stack   service/kibana              NodePort    172.20.71.59    <none>        5601:30601/TCP                  39m
kube-system     service/kube-dns            ClusterIP   172.20.0.10     <none>        53/UDP,53/TCP,9153/TCP          4h8m

NAMESPACE      NAME                             DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
kube-flannel   daemonset.apps/kube-flannel-ds   2         2         2       2            2           <none>                   4h8m
kube-system    daemonset.apps/kube-proxy        2         2         2       2            2           kubernetes.io/os=linux   4h8m

NAMESPACE     NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
kube-system   deployment.apps/coredns   2/2     2            2           4h8m

NAMESPACE     NAME                                 DESIRED   CURRENT   READY   AGE
kube-system   replicaset.apps/coredns-668d6bf9bc   0         0         0       4h8m
kube-system   replicaset.apps/coredns-7484cd47db   2         2         2       4h8m

controlplane ~ ➜  