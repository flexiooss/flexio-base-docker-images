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
RUN pip install virtualenv
RUN pip install tensorflow
RUN pip install keras

RUN apt install ${APT_FLAGS} r-base
RUN apt install ${APT_FLAGS} r-base-dev
RUN apt install ${APT_FLAGS} r-base-html
RUN apt install ${APT_FLAGS} libssl-dev
RUN apt install ${APT_FLAGS} libcurl4-openssl-dev
RUN apt install ${APT_FLAGS} libxml2-dev


RUN R --slave -f /tmp/install.r
RUN R --slave -e "devtools::install_github('flexiooss/flexioR')"
RUN R --slave -e "keras::install_keras()"
RUN R --slave -f /tmp/test.r