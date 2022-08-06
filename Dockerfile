FROM alpine
RUN apk --no-cache --update add libc6-compat
COPY ./bin/server-linux /home/server-linux
COPY ./report.pdf /home/report.pdf
EXPOSE 5000
ENTRYPOINT /home/server-linux