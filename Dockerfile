FROM docker-registry.eyeosbcn.com/alpine6-node-base:latest

COPY alpine-*.list /var/service/

RUN /scripts-base/buildDependencies.sh --production --install && \
    npm install -g \
        bower \
        coffee-script \
        grunt \
        grunt-cli \
        i18next-conv \
        iconv \
        nan \
        node-gyp \
    && \
    npm cache clean && \
    mkdir /root && \
    git config --global user.email "jenkins@eyeos.com" && \
    git config --global user.name "Jenkins" && \
    /scripts-base/buildDependencies.sh --production --purgue && \
    rm -r \
        /etc/ssl \
        /var/cache/apk/*

