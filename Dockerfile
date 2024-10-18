FROM hackinglab/theia:3.2
LABEL maintainer="Ivan Buetler <ivan.buetler@hacking-lab.com>"

User root

# Add the files
ADD root /

RUN chown -R 2000:2000 /home/theia
RUN chown -R 2000:2000 /opt/www

# Add s6-overlay
ENV S6_OVERLAY_VERSION=v3.1.2.1 \
    GO_DNSMASQ_VERSION=1.0.7

RUN apk add --update --no-cache bind-tools curl libcap bash net-tools openssl pwgen xz && \ 
	apk upgrade --available && \
	curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz | tar -Jxpf - -C /  && \
	curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-i686.tar.xz | tar -Jxpf - -C /  && \
	rm -rf /var/cache/apk/*


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
ENV HOME=/home/theia
WORKDIR /home/theia
ENV SHELL=/bin/bash
ENV USE_LOCAL_GIT=true
USER root

EXPOSE 80
ENTRYPOINT ["/init"]
CMD []
