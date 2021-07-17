FROM nerteronoffice/alpine6-node-base:latest

RUN apk update && apk add curl make gcc g++ git python3 dnsmasq
RUN npm install -g \
        bower \
        coffee-script \
        grunt \
        grunt-cli \
        i18next-conv \
        iconv \
        nan \
        node-gyp \
RUN npm cache clean --force
RUN mkdir /root
RUN git config --global user.email "jenkins@eyeos.com"
RUN git config --global user.name "Jenkins"
RUN apk update && apk del curl make gcc g++ git python3
RUN rm -r \
    /etc/ssl \
    /var/cache/apk/*

