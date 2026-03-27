[root@localhost ~]# podman pull registry.redhat.io/ubi8/ubi-minimal:latest
Trying to pull registry.redhat.io/ubi8/ubi-minimal:latest...
Getting image source signatures
Checking if image destination supports signatures
Copying blob 7e5f40fe90b7 done   |
Copying config 581419439f done   |
Writing manifest to image destination
Storing signatures
581419439fd90a8d6c9383dd66a362055e04c830418ea4ebeca9841dfbbbf1ee
[root@localhost ~]#podman image ls
registry.redhat.io/ubi8/ubi-minimal                                     latest      581419439fd9  30 hours ago    98.2 MB


Dockerfile
On UBI init and UBI standard images, use the dnf command
On UBI minimal images, use the microdnf command

#podman ps -a 
#podman rm EAP7
podman rm -f 

root@localhost jboss74]# podman image ls
REPOSITORY                           TAG         IMAGE ID      CREATED        SIZE
quay.io/dnb_itsupport/jbosseap74m    latest      2d4e4c762278  9 minutes ago  1.24 GB  -- after tag
localhost/jbosseap74ubi8minimal      latest      2d4e4c762278  9 minutes ago  1.24 GB  --- build image


podman tag builjboss74minimal quay.io/dnb_itsupport/jbosseap74m

podman push quay.io/dnb_itsupport/jbosseap74m


[root@localhost jboss74]# podman push quay.io/dnb_itsupport/jbosseap74m
Getting image source signatures
Copying blob a30243ebb975 [--------------------------------------] 8.0b / 252.4MiB | 258.7 KiB/s
Copying blob 99736e621d4d [--------------------------------------] 8.0b / 2.5KiB | 290.4 KiB/s
Copying blob 0d05ceae9d79 [--------------------------------------] 8.0b / 210.2MiB | 263.0 KiB/s
Copying blob e9bc1c61f1db [--------------------------------------] 8.0b / 330.0KiB | 265.7 KiB/s
Copying blob 10cf5e70076d [--------------------------------------] 8.0b / 93.6MiB | 277.0 KiB/s
Copying blob 586983bd0a3f [--------------------------------------] 8.0b / 372.0MiB | 54.7 KiB/s
Copying blob 799fe36cae75 [--------------------------------------] 8.0b / 252.4MiB | 275.1 KiB/s
Error: writing blob: initiating layer upload to /v2/dnb_itsupport/jbosseap74m/blobs/uploads/ in quay.io: unauthorized: access to the requested resource is not authorized
[root@localhost jboss74]# podman login quay.io
Username: dnb_itsupport
Password:
Login Succeeded!
[root@localhost jboss74]#

#

docker build --no-cache -t 