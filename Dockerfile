FROM alpine:latest
MAINTAINER playniuniu@gmail.com

ENV URL https://www.duckduckgo.com

RUN printf "@edge http://nl.alpinelinux.org/alpine/edge/main\n@testing http://nl.alpinelinux.org/alpine/edge/testing\n" >> /etc/apk/repositories \
    && apk --no-cache --update add musl@edge zlib@edge mesa-gl mesa-dri-swrast adwaita-icon-theme@edge dbus-x11 ttf-ubuntu-font-family firefox@testing \
    && adduser -S normaluser \
    && echo "normaluser:normaluser" | chpasswd

USER normaluser

CMD firefox --new-instance ${URL}
