FROM python:3.7-alpine
MAINTAINER Silvatech

ENV PYTONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt


RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user

#CMD python manage.py runserver 0.0.0.0:8000
CMD exec gunicorn app.wsgi:application --bind 0.0.0.0:8000 --workers 3

EXPOSE 8000
