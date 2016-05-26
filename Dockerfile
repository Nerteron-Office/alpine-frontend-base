FROM docker-registry.eyeosbcn.com/alpine6-node-base:latest

RUN apk update && \
    apk add libpng-dev libpng ruby-dev python\
            make autoconf automake gcc g++ bzip2 git ruby && \
    apk add --update libffi-dev && \
    npm install -g nan && \
    npm -g install node-gyp && \
    npm -g install iconv \
    && npm install -g coffee-script grunt grunt-cli i18next-conv bower\
    && npm -g cache clean \
    && npm cache clean && \
    gem update --no-document --system \
    && gem install --no-document json_pure compass \
    && gem cleanup \
    && gem sources -c && \
    apk del make autoconf automake gcc g++ ruby ruby-dev && \
    rm -r /etc/ssl /var/cache/apk/*


RUN mkdir /root && \
    git config --global user.email "jenkins@eyeos.com" \
    && git config --global user.name "Jenkins"
