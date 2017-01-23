#znc-alpine

ZNC on alpine linux

Modified from https://github.com/jimeh/docker-znc

Default username and pass is admin:admin

start with:
```
git clone https://github.com/usezfsyo/znc-alpine.git && cd znc-alpine
docker build -t znc-alpine:local .
docker run -d --name znc-alpine -p 20405:20405 -v $(pwd)/znc:/znc-data znc-alpine:local
```

If you have an existing ZNC setup, add the relevant files to config/.
