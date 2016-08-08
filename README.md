docker-packetbeat
=================

[![Docker Repository on Quay](https://quay.io/repository/plange/packetbeat/status "Docker Repository on Quay")](https://quay.io/repository/plange/packetbeat)

Docker container for [packetbeat](https://www.elastic.co/products/beats/packetbeat). Image tags reflect packetbeat upstream versions unless otherwise stated.

Why? What? Where?
-----------------
I wanted a minimal container (alpine) for running packetbeat anywhere (but mainly, as part of a debugging feature on kubernetes pods). I also didn't want to do too much work, so i am pulling in glibc and the packetbeat binary from the official source.
The configuration file added by default has most configuration options enabled with sane defaults, but only supports one type of output (libbeat/lumberjack/logstash) `$LOGSTASH_HOSTS`. It also only sends in plaintext. I'll probably fix this later :whale:.

Configuration options
---------------------
See `packetbeat.yml`.

### Running in kubernetes
Add the following to your PodSpec. Be sure to have a working lumberjack listener on the other end of `$LOGSTASH_HOSTS`. Debugging packetbeat itself is easily done by tuning `$LOG_LEVEL` up to `debug`. Beware that this is very noisy!
```
<..snip..>
      containers:
      - image: quay.io/plange/packetbeat:1.2.3
        imagePullPolicy: Always
        name: packetbeat
        securityContext:
          privileged: true
        env:
        - name: LOGSTASH_HOSTS
          value: <YOUR LOGSTASH/GRAYLOG LISTENER>
```

TODO
----
  * Add TLS support to shippers
  * Add support for shipping directly to ES

Happy logging!
