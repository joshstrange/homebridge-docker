FROM alpine:3.7

##################################################
# Install tools                                  #
##################################################

RUN apk update && apk add \
	nodejs \
	yarn \
	git \
	avahi-dev \
	make \
	g++ \
	ffmpeg \
	&& rm -rf /var/cache/apk/*

##################################################
# Install homebridge                             #
##################################################

RUN yarn global add homebridge

##################################################
# Start                                          #
##################################################

USER root

RUN mkdir -p /var/run/dbus

EXPOSE 5353 51826

ADD run.sh /root/run.sh

VOLUME ["/root/.homebridge"]
CMD ["/root/run.sh"]
