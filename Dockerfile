FROM alpine
RUN apk --no-cache --update add libc6-compat
COPY ./bin/server-linux /home/server-linux
EXPOSE 5000
ENTRYPOINT /home/server-linux