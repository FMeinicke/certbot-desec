FROM certbot/certbot

ENV REFREHED_AT "2021-05-09"

# sepcify with `docker build --build-arg'
ARG DEDYN_TOKEN
ARG DEDYN_NAME

RUN apk add --no-cache bash curl \
    && wget https://raw.githubusercontent.com/desec-io/desec-certbot-hook/master/hook.sh \
    && chmod +x hook.sh \
    && wget https://raw.githubusercontent.com/desec-io/desec-certbot-hook/master/.dedynauth \
    && sed -i "s/\(DEDYN_TOKEN=\)\(.*\)/\1$DEDYN_TOKEN/" .dedynauth \
    && sed -i "s/\(DEDYN_NAME=\)\(.*\)/\1$DEDYN_NAME/" .dedynauth

ENTRYPOINT [ "certbot", "--manual-auth-hook", "./hook.sh", "--manual-cleanup-hook", "./hook.sh" ]
