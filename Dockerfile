FROM alpine:edge

RUN apk --no-cache add tor

EXPOSE 9050

COPY torrc.default /etc/tor/torrc.default

RUN chown -R tor /etc/tor

USER tor

ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]
