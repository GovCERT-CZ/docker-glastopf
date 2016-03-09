#!/bin/bash
set -e

chown -R glastopf:glastopf /opt/glastopf

cd /opt/glastopf

su -c 'authbind --deep glastopf-runner > /opt/glastopf/log/glastopf.out 2> /opt/glastopf/log/glastopf.err' glastopf

