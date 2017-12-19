FROM ubuntu
MAINTAINER zcw

# ADD XX-Net-3.3.1.zip /data/xx-net.zip

RUN apt-get update && \
	apt-get install -y wget && \
	apt-get install -y unzip && \
	mkdir /data && \
	wget https://codeload.github.com/XX-net/XX-Net/zip/3.8.5 -O /data/xx-net.zip && \
	unzip /data/xx-net.zip -d /data/ && \
    mv /data/XX-Net-3.8.5/ /data/xx-net && \
	apt-get install -y python-openssl && \
	apt-get install -y libffi-dev && \
	apt-get install -y python-gtk2 && \
	apt-get install -y python-appindicator && \
	apt-get install -y libnss3-tools

ADD run.sh /data/xx-net/
RUN chmod a+x /data/xx-net/run.sh
VOLUME /data/xx-net/data
EXPOSE 8085 8086 8087 1080
CMD /bin/bash /data/xx-net/run.sh