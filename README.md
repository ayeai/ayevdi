# ayevdi

## AyeVDI in container
Note: Does not run inside a container
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-docker | bash -
```

## AyeVDI in container with ephemeral user
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-ephemeral | bash -
```


## AyeVDI on host

1. To setup execute
Note: This is the original native ayevdi. Please see the updated docker based version.
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-setup-basic | bash -
```

2. To start VDI execute
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-init | bash -
```

## Create docker image for AyeVDI
 
1. Execute the following command to generate AyeVDI image.
Note: This script requires user interaction. Push will only work with account auth
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-gen-image | bash -
```
## Load testing AyeVDI ephemeral mode with 200 simultaneous GUI users
```
(for n in {1..10}; do sudo apt update -y && curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-ephemeral | bash -; done) 2>/dev/null | grep vnc_auto > terms.txt
cat terms.txt
(for n in {1..190}; do sudo apt update -y && curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-ephemeral | bash -; done) 2>/dev/null | grep vnc_auto > terms.txt
```

## Building

### Shellinabox
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-build-siab | bash -
```

## Testing
```
shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p 4202 -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'echo AyeVDI by https://ayeai.xyz && (curl https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-ephemeral | bash - ) 2>&1 | tee >(tail -2) >/dev/null >(awk -f /usr/share/ayevdi/ayerun.awk ) && bash -i'" --disable-ssl
```
