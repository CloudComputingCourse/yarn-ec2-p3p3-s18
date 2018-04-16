#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install python python-pip
pip2 install -r requirements.txt
YARN_EC2_DIR="$(cd `dirname "$0"` && pwd -P)"
export YARN_EC2_DIR

${YARN_EC2_DIR}/bin/yarn_ec2_p3p3 "$@"
