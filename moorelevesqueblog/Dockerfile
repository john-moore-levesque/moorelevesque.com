###########
# BUILDER #
FROM python:3.8.5-alpine

WORKDIR /usr/src/app

RUN apk --update add libxml2-dev libxslt-dev libffi-dev gcc musl-dev libgcc openssl-dev curl
RUN apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev mariadb-connector-c-dev

COPY . .

RUN pip install --no-cache-dir -r requirement.txt

RUN export ALLOWED_HOSTS="" && export SECRET="foo" && python manage.py collectstatic --noinput


