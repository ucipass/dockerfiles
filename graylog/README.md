## Usage
docker run --name graylog --link mongo --link elasticsearch     -p 9000:9000 -p 12201:12201 -p 1514:1514     -e GRAYLOG_HTTP_EXTERNAL_URI="http://127.0.0.1:9000/"      graylog/graylog:3.3

