# ayevdi
Note: These instructions are based on Ubuntu 18.04 LTS which is supported until April 2023. Support of other distros, including future Ubuntu releases, is pertinent to resource availability.

## Setup front-end
Note: TBD - OST needed

### Install packages
```
wget https://github.com/ayeai/ayevdi/releases/download/v0.1-alpha/shellinabox_2.21_amd64.deb && sudo dpkg -r shellinabox && sudo dpkg -i ./shellinabox_2.21_amd64.deb
```
### Generate passphrase
```
export passfile=$(tempfile) && curl https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-passkey-gen > ${passfile} && source ${passfile} && export passfile=$(date +%s)
```
### Test RR scheduler
Note:Replace port number in example below
```
export ayeport=4203 && curl https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-pool-${ayeport} 2>/dev/null | uudecode | uudecode | gpg --batch --passphrase $(curl https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-passkey 2>/dev/null | bash - ) 2>/dev/null -d | awk -vstrobefile=${HOME}/.ayevdi/ayestrobe_${ayeport} "$(curl https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-sched-rr.awk 2>/dev/null)"
```
### Test RR load balancer
```
export ayeport=4203 && shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p 4202 -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'wget https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-sched-rr.awk -O ${HOME}/.ayevdi/ayevdi-sched-rr.awk >/dev/null 2>&1 && curl https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-pool-${ayeport} 2>/dev/null | uudecode | uudecode | gpg --batch --passphrase $(curl https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-passkey 2>/dev/null | bash - ) 2>/dev/null -d | awk -vstrobefile=${HOME}/.ayevdi/ayestrobe_${ayeport} -f ${HOME}/.ayevdi/ayevdi-sched-rr.awk'" --disable-ssl
```

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

### Host - Test with GUI in container
```
shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p 4202 -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'echo AyeVDI by https://ayeai.xyz && (curl https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-ephemeral | bash - ) 2>&1 | tee >(tail -2) >/dev/null >(awk -f /usr/share/ayevdi/ayerun.awk ) && bash -i'" --disable-ssl
```
### Host - Test with Shell in container
```
shellinaboxd --css /etc/shellinabox/options-enabled/00_White\ On\ Black.css -p 4202 -s "/:$(id -u):$(id -g):${PWD}:/bin/bash -c 'echo AyeVDI by https://ayeai.xyz && (curl https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-ephemeral-shell | bash - ) 2>&1 | tee >(tail -2) >/dev/null >(awk -f /usr/share/ayevdi/ayerun.awk ) && bash -i'" --disable-ssl
```

### Container - Test Shell directly on container
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-ayeuser-shell | bash -
```
