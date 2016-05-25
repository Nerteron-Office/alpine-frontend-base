FROM docker-registry.eyeosbcn.com/alpine6-node-base:latest

RUN apk update && \
    apk add libpng-dev libpng ruby-dev python\
            make autoconf automake gcc g++ bzip2 git ruby lsof php php-cli && \
    apk add --update build-base libffi-dev && \
    rm -r /etc/ssl /var/cache/apk/*

RUN npm install -g nan && \
    sed -i -e 's/v8::String::REPLACE_INVALID_UTF8/0/g' /usr/lib/node_modules/nan/nan.h && \
    head -n 321 /usr/lib/node_modules/nan/nan.h | tail -n 13 && \
    npm -g install node-gyp && \
    npm -g install iconv \
    && npm install -g coffee-script i18next-conv \
    && npm -g cache clean \
    && npm cache clean

RUN gem update --no-document --system \
    && gem install --no-document json_pure compass \
    && gem cleanup \
    && gem sources -c

RUN mkdir /root && \
    git config --global user.email "jenkins@eyeos.com" \
    && git config --global user.name "Jenkins"
