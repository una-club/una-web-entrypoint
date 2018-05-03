FROM nginx

COPY src/sources.list.d /etc/apt/sources.list.d


RUN apt-get update
RUN apt-get upgrade -y
RUN adduser www-data sudo

RUN apt-get install -y python-certbot-nginx -t stretch-backports

RUN apt-get install -y git

RUN mkdir -p /var/www/regataiades

COPY src/config/nginx.conf /etc/nginx/nginx.conf
COPY src/config/sites-enabled /etc/nginx/sites-enabled

COPY src/www /var/www


COPY src/run.sh /root/

RUN chmod a+x /root/run.sh

RUN git clone https://github.com/una-club/regataiades-website-2018-edition-static.git /var/www/regataiades

RUN git clone https://github.com/mishgunn/regataiades-registration-gui.git /var/www/regataiades/live

CMD ["/root/run.sh"]
