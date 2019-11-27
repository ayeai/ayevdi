# ayevdi

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

## AyeVDI in container
```
docker pull ayeai/ayevdi
```

## Create docker image for AyeVDI
 
1. Execute the following command to generate AyeVDI image.
Note: This script requires user interaction. Push will only work with account auth
```
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/ayeai/ayevdi/master/ayevdi-gen-image | bash -
```
