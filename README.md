# docker-glastopf

This is Docker image for honeypot Glastopf (https://github.com/mushorg/glastopf).

Build docker image
    
    $ https://github.com/GovCERT-CZ/docker-glastopf
    $ cd docker-glastopf
    $ docker build -t <repository>/<name> .
    
Run docker container
    
    make directory for honeypot data and download files to this directory
    $ wget https://raw.githubusercontent.com/mushorg/glastopf/master/glastopf/glastopf.cfg.dist -O glastopf.cfg
    update glastopf.cfg file with your settings
    $ docker run [--name <container name>] [-d] -p 80:80  [-v <host path>:/opt/glastopf] <repository>/<name>

