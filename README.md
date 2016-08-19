# ownCloud Docker container

This repository contains an ownCloud Docker container. ownCloud is a 
self-hosted file sync and share server. 

This repository also contains a Docker Compose project that instanciates the 
ownCloud container along with a MySQL container and connects them in a private
network.

## Profiles

Before starting your ownCloud server, you must create a profile. The profile
contains per-server settings, such as passwords, domain names and SSL 
certificates.

A profile is a directory with the following files:

myprofile/profile.env - Contains passwords and other variables
myprofile/key.pem - SSL private key. Generate using openssl.
myprofile/cert.pem - SSL certificate. Generate using openssl.

See profiles/example/profile.env for an example profile.env.

## Usage

Once your profile is setup, launch the containers:

	$ ./up.sh myprofile/profile.env
	
up.sh is a wrapper script for "docker-compose up" that also ensures
all the necessary environment variables are setup and directories
exist.

Use down.sh to shutdown the containers again:

	$ ./down.sh -v
	
## Profile data

All ownCloud configs and data are stored in the profiles directory. 

* myprofile/owncloud-cfg - ownCloud configuration files. Generated at first boot.
* myprofile/owncloud-data - User files/data.
* myprofile/owncloud-db - MySQL database.
 
If you restart your containers using down.sh and up.sh, all data will be
kept. If you wish to create a fresh ownCloud server instance, add a new
profile or delete the above directories.

