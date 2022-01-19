FROM python:3.8-alpine

RUN mkdir /app
ADD . /app/
WORKDIR  /app

RUN apk update && apk add build-base postgresql-dev musl-dev yaml-dev --no-cache
RUN python -m pip install -r requirements.txt

CMD ["/bin/sh","docker-entrypoint.sh"]
