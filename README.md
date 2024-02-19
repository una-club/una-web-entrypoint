# Introduction

Launch container with

```
docker run --name una-entrypoint-cont -p 80:80 -p 443:443 --network "worknet" --hostname "entrypoint" -d una-entrypoint
```

Launch full stack with

```
docker compose up -d
```
