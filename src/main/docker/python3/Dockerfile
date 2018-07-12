FROM openjdk:8-jdk-slim

ENV APT_FLAGS="--no-install-recommends -y"
ADD resources/* /tmp/

RUN apt update
RUN apt upgrade -y
RUN apt install ${APT_FLAGS} python3
RUN apt install ${APT_FLAGS} python3-pip
RUN apt install ${APT_FLAGS} python3-dev
RUN apt install ${APT_FLAGS} python3-setuptools

#Set Python3 as default
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip

RUN pip install --upgrade pip
RUN pip install tensorflow
RUN pip install pandas
RUN pip install numpy
RUN pip install keras

RUN python /tmp/test.py