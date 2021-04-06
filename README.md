# 1. Introduction
A minimal docker-compose setup with Nginx which is dynamically configured using Confd and etcd for it's key value store.

[etcd](https://etcd.io/),  [bitnami/etcd](https://hub.docker.com/r/bitnami/etcd/)

[confd](https://github.com/kelseyhightower/confd)



![confd-etcd](confd-etcd.png)

# 2. Quick Start Guide
```
docker container prune -f;docker image prune -f;docker-compose up --build 
```

### 2.1 Log into the etcd server
```
docker exec -it etcd-server /bin/bash
```

### 2.2 Log into the confd-nginx server
```
docker exec -it nginx-server sh
```

##### Set confd to either onetime update, polling or watch

```
confd -interval=5 -backend etcdv3 -node http://10.5.0.100:2379 & polling on time
```

*If using **-onetime**, you need to set the etcd value in your key store first (see step 2.3)*

```
confd -onetime -log-level "debug" -backend etcdv3 -node http://10.5.0.100:2379
```

##### Look at the server_name value (should be the initial value 'hostname')
```
cat /etc/nginx/conf.d/default.conf
...
server_name localhost;
```

### 2.3 Go back into the etcd server and 
```
etcdctl put /nginx/domain 'telushealth.com'
```

Look at the NGINX config and the **server_name** value should be: 

```
cat /etc/nginx/conf.d/default.conf
...
server_name telushealth.com;
```

## 3. Managing Configurations Using an ETCD Client and Cluster

curl http://10.5.0.100:2379/v3/keys/message -XGET -d value="SERVER_NAME"
