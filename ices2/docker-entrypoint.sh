#!/bin/sh

if [ -n "$ICES_PASSWORD" ]; then
    sed -i "s/<password>[^<]*<\/password>/<password>$ICES_PASSWORD<\/password>/g" /etc/ices2/ices-playlist.xml
fi
if [ -n "$ICES_HOSTNAME" ]; then
    sed -i "s/<hostname>[^<]*<\/hostname>/<hostname>$ICES_HOSTNAME<\/hostname>/g" /etc/ices2/ices-playlist.xml
fi
if [ -n "$ICES_PORT" ]; then
    sed -i "s/<port>[^<]*<\/port>/<port>$ICES_PORT<\/port>/g" /etc/ices2/ices-playlist.xml
fi
if [ -n "$ICES_MOUNT" ]; then
    sed -i "s/<mount>[^<]*<\/mount>/<mount>$ICES_MOUNT<\/mount>/g" /etc/ices2/ices-playlist.xml
fi

# procura os arquivos de audio .ogg dentro da pasta music para gerar a playlist
find /etc/ices2/music -iname *.ogg > /etc/ices2/playlist.txt

exec "$@"
