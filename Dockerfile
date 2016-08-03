FROM ubuntu:16.04

#COPY 20proxy /etc/apt/apt.conf
ENV http_proxy www-cache-nrs.si.fr.intraorange:3128
ENV https_proxy www-cache-nrs.si.fr.intraorange:3128
ENV all_proxy www-cache-nrs.si.fr.intraorange:3128
COPY apt.conf /etc/apt/apt.conf

RUN export http_proxy='http://www-cache-nrs.si.fr.intraorange:3128'
RUN export https_proxy='http://www-cache-nrs.si.fr.intraorange:3128'
RUN apt-get -y update
#RUN apt-get install -y wget

#CMD /usr/games/fortune -a

CMD ping www.google.com