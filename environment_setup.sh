#!/bin/bash

if [ ! -f /root/.ssh/mykey.pem ] ; then
   echo "Copy the SSH Public Key which is used in AWS instance provisioning as mykey.pem in /root/.ssh of this machine"
   exit 1
fi

TOWER_GUID=532a
OSP_GUID=fdf7
OPENTLC_LOGIN=hgunasin-au1.ibm.com
OPENTLC_PASSWORD=xxx
GITHUB_REPO=https://github.com/hgunasin/ansible_advance_homework
JQ_REPO_BASE=http://www.opentlc.com/download/ansible_bootcamp
REGION=us-east-1
RH_MAIL_ID=hgunasin@au1.ibm.com

ansible-playbook main_playbook.yml --private-key=/root/.ssh/mykey.pem -u ${OPENTLC_LOGIN} -e tower_GUID=${TOWER_GUID} -e osp_GUID=${OSP_GUID} -e opentlc_login=${OPENTLC_LOGIN} -e path_to_opentlc_key=/root/.ssh/openstack.pem -e param_repo_base=${JQ_REPO_BASE} -e opentlc_password=${OPENTLC_PASSWORD} -e REGION_NAME=${REGION} -e EMAIL=${RH_MAIL_ID} -e github_repo=${GITHUB_REPO} -vv
