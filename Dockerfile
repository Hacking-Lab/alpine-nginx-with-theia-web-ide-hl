FROM hackinglab/theia:latest
MAINTAINER Ivan Buetler <ivan.buetler@compass-security.com>

User root

# Add the files
ADD root /

RUN chown -R 2000:2000 /home/theia

# Add s6-overlay
ENV S6_OVERLAY_VERSION=v1.22.1.0 \
    GO_DNSMASQ_VERSION=1.0.7

RUN apk add --update --no-cache bind-tools curl libcap bash net-tools shadow sudo && \ 
	apk upgrade --available && \
	curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar xfz - -C /  && \
	curl -sSL https://github.com/janeczku/go-dnsmasq/releases/download/${GO_DNSMASQ_VERSION}/go-dnsmasq-min_linux-amd64 -o /bin/go-dnsmasq && \
	chmod +x /bin/go-dnsmasq && \
	addgroup go-dnsmasq && \
	adduser -D -g "" -s /bin/sh -G go-dnsmasq go-dnsmasq && \
	setcap CAP_NET_BIND_SERVICE=+eip /bin/go-dnsmasq 

RUN apk add --no-cache --update nginx \
        vim \
        curl \
        nginx \
        expect \
        openssl \
        shadow \
        php7-common \
        php7 \
        php7-fileinfo \
        php7-fpm \
        php7-json \
        php7-mbstring \
        php7-openssl \
        php7-session \
        php7-simplexml \
        php7-xml \
        php7-xmlwriter \
        php7-zlib \
        php7-ldap \
        php7-zip && \
	rm -rf /var/cache/apk/* && \
	chown -R nginx:www-data /var/lib/nginx && \
	chown -R 2000:2000 /opt/www



# Expose the ports for nginx
ENV HOME /home/theia
WORKDIR /home/theia
ENV SHELL /bin/bash
ENV USE_LOCAL_GIT true
USER theia

EXPOSE 80
ENTRYPOINT ["/init"]
CMD []
