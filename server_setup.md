# Server setup

## Infrastructure required fro CVMFS

https://cvmfs.readthedocs.io/en/stable/apx-serverinfra.html

A CernVM-FS server installation depends on the following environment
setup and tools to be in place:

* Appropriate kernel version. You must have ONE of the following:
	
	kernel 4.2.x or later.
	
	RHEL7.3 kernel (for OverlayFS)
	
	Custom kernel compilation with aufs support the kernel (see
    Section Installing the AUFS-enabled Kernel on Scientific Linux 6)

* Backend storage location available through HTTP

* Backend storage accessible at /srv/cvmfs/... (unless stored on S3)

* cvmfs and cvmfs-server packages installed
