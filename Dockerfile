FROM ubuntu:trusty
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
COPY entrypoint.sh /entrypoint.sh
RUN apt-get update && apt-get -y dist-upgrade && \
	apt-get -y install git authbind build-essential g++ gfortran git libevent-dev liblapack-dev libmysqlclient-dev libxml2-dev libxslt-dev make php5-cli php5-dev python-beautifulsoup python-chardet python-dev python-gevent python-lxml python-openssl python-pip python-requests python-setuptools python-sqlalchemy python2.7 python2.7-dev && \
	useradd -d /home/glastopf -s /bin/bash -m -U glastopf && \
	cd /opt && \
	git clone https://github.com/mushorg/BFR.git && \
	cd BFR && \
	phpize && \
	./configure --enable-bfr && \
	make && \
	make install && \
	echo "zend_extension = "$(find /usr -name bfr.so) >> /etc/php5/cli/php.ini && \
	cd /opt && \
	git clone https://github.com/mushorg/glastopf glastopf-src && \
	cd glastopf-src && \
	python setup.py install && \
	chown -R glastopf:glastopf /opt/glastopf-src && \
	mkdir /opt/glastopf && \
	chown -R glastopf:glastopf /opt/glastopf && \
	touch /etc/authbind/byport/80 && \
	chown glastopf /etc/authbind/byport/80 && \
	chmod 500 /etc/authbind/byport/80 && \
	chmod +x /entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
