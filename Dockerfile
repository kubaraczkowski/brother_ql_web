FROM alpine:latest

RUN apk add --update --no-cache --virtual .build-deps  \
    git

RUN apk add --update --no-cache \
    fontconfig \
    py3-pillow \
    py3-future \
    py3-jinja2 \
    py3-bottle \
    python3 \
    py3-pip \
    ttf-dejavu

RUN ln -s /usr/bin/python3 /usr/bin/python
COPY . ./brother_ql_web
WORKDIR ./brother_ql_web
RUN rm -r .git
RUN /usr/bin/pip3 install --no-cache-dir -r requirements.txt

RUN apk del .build-deps

EXPOSE 8013

CMD [ "./brother_ql_web.py" ]