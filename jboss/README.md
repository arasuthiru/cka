kubectl create configmap jboss-standalone-config --from-file=/path/to/your/standalone.xml
kubectl create configmap jboss-standalone-config --from-file=standalone-full-ha.xml

     apiVersion: v1
    kind: Pod
    metadata:
      name: jboss-eap-app
    spec:
      containers:
      - name: jboss-eap-container
        image: your-jboss-eap-image:latest
        volumeMounts:
        - name: jboss-config-volume
          mountPath: /opt/jboss/eap/standalone/configuration/standalone.xml # Adjust path as needed
          subPath: standalone.xml # Specifies to mount only the standalone.xml key from the ConfigMap
      volumes:
      - name: jboss-config-volume
        configMap:
          name: jboss-standalone-config


#####
spec:
      securityContext:
          fsGroup: 1100
          runAsGroup: 1100
          runAsUser: 1100

chmod -R g+rw /mnt/data
   76  ls -l /mnt/
   77  ls -l /mnt/data/
   78  chown -R 1100:1100 /mnt/data
   79  ls -l /mnt/data/

root@thiru-worker-node1:/mnt/data# ls -l /mnt/data/
total 360
-rw-rw-r-- 1 1100 1100 362042 Dec 12 23:39 counter.war
-rw-r--r-- 1 1100 1100     11 Dec 12 23:39 counter.war.deployed
-rw-rw-r-- 1 1100 1100      0 Dec 12 23:14 thiru
root@thiru-worker-node1:/mnt/data#

after change permission war file deployed.