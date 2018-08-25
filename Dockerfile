FROM alpine:edge
MAINTAINER Sascha Wander <sascha.wander@gmail.com>

RUN apk --no-cache add tor

EXPOSE 9050

COPY torrc.default /etc/tor/torrc.default

RUN chown -R tor /etc/tor

USER tor

ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]

# vim:fenc=utf-8:ft=dockerfile:ts=2:sts=0:sw=2:et:
