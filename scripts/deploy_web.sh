#!/bin/bash

set -e

echo "Deploy static site to http://scvsoft/challenge-accepted"

sudo rm -rf /var/www/scvweb/challenge-accepted
sudo mkdir -p /var/www/scvweb/challenge-accepted

sudo cp -r ../html/* /var/www/scvweb/challenge-accepted

echo "Done.""
