YARN-ec2-p3p3-s18
========

Setup YARN on a set of EC2 instances in a single highly-automated step for 
submission of 15-719 P3.3.

http://www.cs.cmu.edu/~15719/

[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](LICENSE)

## USAGE

```
Usage: ./cluster_tool.sh [options] <action> <cluster_name>

<action> can be: launch, destroy, login, get-master, stop, start

Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit
  -s SLAVES, --slaves=SLAVES
                        Number of slaves to launch (default: 4)
  -p PROFILE, --profile=PROFILE
                        If you have multiple profiles (AWS or boto config),
                        you can configure additional, named profiles by using
                        this option (default: none)
  -t INSTANCE_TYPE, --instance-type=INSTANCE_TYPE
                        Type of instance to launch (default: c4.4xlarge).
                        WARNING: must be 64-bit; small instances won't work in
                        production
  -m MASTER_INSTANCE_TYPE, --master-instance-type=MASTER_INSTANCE_TYPE
                        Master instance type (leave empty for same as
                        instance-type)
  -r REGION, --region=REGION
                        EC2 region used to launch instances in, or to find
                        them in (default: us-east-1)
  -z ZONE, --zone=ZONE  Availability zone to launch instances in, or 'all' to
                        spread slaves across multiple (an additional $0.01/Gb
                        for bandwidthbetween zones applies) (default: us-east-
                        1a)
  -a AMI, --ami=AMI     Amazon Machine Image ID to use
  -D [ADDRESS:]PORT     Use SSH dynamic port forwarding to create a SOCKS
                        proxy at the given local address (for use with login)
  --resume              Resume installation on a previously launched cluster
                        (for debugging)
  --ebs-vol-size=SIZE   Size (in GB) of each EBS volume.
  --ebs-vol-type=EBS_VOL_TYPE
                        EBS volume type (e.g. 'gp2', 'standard').
  --ebs-vol-num=EBS_VOL_NUM
                        Number of EBS volumes to attach to each node as
                        /vol[x]. The volumes will be deleted when the
                        instances terminate. Only possible on EBS-backed AMIs.
                        EBS volumes are only attached if --ebs-vol-size > 0.
                        Only support up to 8 EBS volumes.
  --placement-group=PLACEMENT_GROUP
                        Which placement group to try and launch instances
                        into. Assumes placement group is already created.
  --spot-price=PRICE    If specified, launch slaves as spot instances with the
                        given maximum price (in dollars) (default: 1.0)
  --delete-groups       When destroying a cluster, delete the security groups
                        that were created
  --use-existing-master
                        Launch fresh slaves, but use an existing stopped
                        master if possible
  --user-data=USER_DATA
                        Path to a user-data file (most AMIs interpret this as
                        an initialization script)
  --authorized-address=AUTHORIZED_ADDRESS
                        Address to authorize on created security groups
                        (default: 0.0.0.0/0)
  --additional-security-group=ADDITIONAL_SECURITY_GROUP
                        Additional security group to place the machines in
  --additional-tags=ADDITIONAL_TAGS
                        Additional tags to set on the machines; tags are
                        comma-separated, while name and value are colon
                        separated; ex: "Course:advcc,Project:yarn"
  --subnet-id=SUBNET_ID
                        VPC subnet to launch instances in
  --vpc-id=VPC_ID       VPC to launch instances in
  --secondary-ips=SECONDARY_IPS
                        Num of secondary private ip addresses to assign for
                        each cluster node
  --private-ips         Use private IPs for instances rather than public if
                        VPC/subnet requires that.
  --instance-initiated-shutdown-behavior=INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR
                        Whether instances should terminate when shut down or
                        just stop
  --instance-profile-name=INSTANCE_PROFILE_NAME
                        IAM profile name to launch instances under
```
