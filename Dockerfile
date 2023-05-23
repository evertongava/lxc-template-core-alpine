FROM alpine:3.18
LABEL maintainer="Everton Gava <evertongava@mabalus.com>"

#
# User
#	
RUN set -ex \
	&& adduser -u 1000 -g 4 -s /bin/sh -D app

#
# Locale
#
ENV LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_CTYPE=en_US.UTF-8 \
	LC_ALL=en_US.UTF-8
    
#
# Timezone
#
ENV TIMEZONE UTC

RUN	set -ex \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache --update tzdata \
	&& cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
	&& echo "${TIMEZONE}" > /etc/timezone \
	&& apk del tzdata \
	&& rm -rf /var/cache/apk/*

STOPSIGNAL SIGTERM