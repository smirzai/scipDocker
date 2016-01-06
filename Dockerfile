FROM ubuntu
MAINTAINER Saeid Mirzaei <smirzai@gmail.com>
RUN apt-get -y update && apt-get install -y build-essential
RUN apt-get install -y libgmp3-dev libreadline6 libreadline6-dev  zlib1g-dev libncurses5-dev bison flex
RUN mkdir /home/scip
COPY scipoptsuite-3.2.0.tgz /home/scip

RUN cd /home/scip && tar  -zxvf scipoptsuite-3.2.0.tgz
WORKDIR /home/scip/scipoptsuite-3.2.0
RUN make scipoptlib
ENV PATH /home/scip/scipoptsuite-3.2.0/scip-3.2.0/bin:$PATH
