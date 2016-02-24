# AWS Workstation

This is configuratoin that I use to provision my Fedora 23 workstation at AWS. I've got an EC2 launch configuration and auto scale group configured which is usually set to desired=0 instances (ie: don't run any instances). When I'm doing a few hours of development work, I'll set it to desired=1 which will build an m2.small instance and run the init.sh script in this repo during the build process. After I'm done, setting desired=0 destroys the instances again.
