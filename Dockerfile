FROM python:slim as common-base
ENV DJANGO_SETTINGS_MODULE leaderplus.settings
RUN apt update \
&& apt install -y build-essential \
&& pip install -U pip setuptools \
&& pip install uvicorn[standard] \
&& apt remove -y build-essential \
&& apt autoremove -y

FROM common-base as djanog-builder
RUN mkdir -p /app 
WORKDIR /app
COPY ./requirement.txt .
RUN pip install -r requirement.txt
