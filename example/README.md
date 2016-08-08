Example packetbeat client/server in k8s
=======================================
This assumes you already have a libbeat server setup at `logs.default:5044`. Change the `LOGSTASH_HOSTS` parameter on both `server.yaml` and `client.yaml` if you named your endpoint something else.


Create the server:
```
$ kubectl create -f server.yaml
```

Create the client:
```
$ kubectl create -f client.yaml
```

Get a console on the client:
```
$ kubectl exec -ti debugclient -c alpine /bin/sh
```

Now you can execute some commands in the container to test the functionality:
```
# apk add --update curl
```

This should already trigger several events at your loghost as `apk` pulls in requirements over HTTP. In order to get to the mirror several DNS requests are made as well
```
# curl -v debugserver
```

Verify you can see logs from both pods. Now start playing with the config options. Have fun :whale:
