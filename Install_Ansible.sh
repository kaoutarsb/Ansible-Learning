#-------------------Script to install Ansible on CentOS VM---------------------------------

#Update packages
sudo yum update

#Install EPEL repository, which contains Ansible packages
sudo yum install epel-release

#install Ansible
sudo yum install ansible

#Verify the installation 
ansible --version

#confirm that Ansible is working
ansible localhost -m ping

#The output of the last command will show  "SUCCESS" if everything is installed and working correctly
