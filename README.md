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
