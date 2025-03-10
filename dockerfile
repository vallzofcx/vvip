FROM        node:19-bullseye-slim

LABEL       author="Server VallzOffc" maintainer="vallzofc@gmail.com"

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool iputils-ping imagemagick ffmpeg speedtest-cli neofetch \
            && useradd -m -d /home/container container

RUN         npm install pm2 -g
# Menginstal neofetch untuk menampilan informasi sistem
RUN apt-get update && apt-get install -y neofetch

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]