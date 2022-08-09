FROM alpine
RUN apk --no-cache --update add libc6-compat
COPY ./server-linux /home/server-linux
COPY ./database.db3 /home/database.db3
COPY ./reports/report.pdf /home/reports/report.pdf
EXPOSE 5000
ENTRYPOINT /home/server-linux