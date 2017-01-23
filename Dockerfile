FROM alpine:latest

# ZNC version 1.6.4
ENV ZNC_VER 1.6.4

RUN apk add --update g++ make openssl-dev icu-dev su-exec && \
	cd /root && \
	wget "http://znc.in/releases/znc-${ZNC_VER}.tar.gz" && \
	tar -zxf znc-*.tar.gz && rm znc-*.tar.gz && cd "znc-${ZNC_VER}" && \
	./configure && make && make install && \
	cd ../ && rm -r "znc-${ZNC_VER}" && \
	adduser -D znc && \
	rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

ADD docker-entrypoint.sh /entrypoint.sh
ADD znc.conf.default /znc.conf.default
RUN chmod 644 /znc.conf.default

VOLUME /znc-data

EXPOSE 20405
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
