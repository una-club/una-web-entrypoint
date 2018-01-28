#!/bin/sh

# When we get killed, kill all our children
trap "exit" INT TERM
trap "kill 0" EXIT

# Start up nginx, save PID so we can reload config inside of run_certbot.sh
nginx -g "daemon off;" &
export NGINX_PID=$!

# certbot  --nginx -m mickael.a.tardy@gmail.com -d system.hera-mi.com --agree-tos -n
# certbot  --nginx -m mickael.a.tardy@gmail.com -d system.una-club.com --agree-tos -n

wait "$NGINX_PID"
