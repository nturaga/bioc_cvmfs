# Install CVMFS from pkg file

CernVM-FS is actively used by small and large HEP collaborations. In
many cases, it replaces package managers and shared software areas on
cluster file systems as means to distribute the software used to
process experiment data. For the experiments at the LHC, CernVM-FS
hosts several hundred million files and directories that are
distribute to the order of hundred thousand client computers.

## Mac binary

Install this on client machine

https://ecsft.cern.ch/dist/cvmfs/cvmfs-2.6.0/cvmfs-2.6.0.pkg

More installation https://cernvm.cern.ch/portal/filesystem/downloads

## Configure a client

* In /etc/cvmfs/default.local

		CVMFS_REPOSITORIES="data.galaxyproject.org"
		CVMFS_HTTP_PROXY="DIRECT"
		CVMFS_QUOTA_LIMIT="4000"
		CVMFS_CACHE_BASE="/srv/cvmfs/cache"
		CVMFS_USE_GEOAPI=yes`
		
	This tells cvmfs to mount the Galaxy reference data repository and
	use a specific location for the cache which is limited to 4GB in size
	and to use the instance’s geo-location to choose the best CVMFS repo
	server to connect to.

* Create /etc/cvmfs/domain.d/galaxyproject.org.conf (stratum1 servers,
  if one fails, it switches to another mirror)

		CVMFS_SERVER_URL="http://cvmfs1-tacc0.galaxyproject.org/cvmfs/@fqrn@;http://cvmfs1-iu0.galaxyproject.org/cvmfs/@fqrn@;http://cvmfs1-psu0.galaxyproject.org/cvmfs/@fqrn@;http://galaxy.jrc.ec.europa.eu:8008/cvmfs/@fqrn@;http://cvmfs1-mel0.gvl.org.au/cvmfs/@fqrn@;http://cvmfs1-ufr0.galaxyproject.eu/cvmfs/@fqrn@"

List of servers the client can connect to.

* Public key, under /etc/cvmfs/keys/data.galaxyproject.org.pub

```
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5LHQuKWzcX5iBbCGsXGt
6CRi9+a9cKZG4UlX/lJukEJ+3dSxVDWJs88PSdLk+E25494oU56hB8YeVq+W8AQE
3LWx2K2ruRjEAI2o8sRgs/IbafjZ7cBuERzqj3Tn5qUIBFoKUMWMSIiWTQe2Sfnj
GzfDoswr5TTk7aH/FIXUjLnLGGCOzPtUC244IhHARzu86bWYxQJUw0/kZl5wVGcH
maSgr39h1xPst0Vx1keJ95AH0wqxPbCcyBGtF1L6HQlLidmoIDqcCQpLsGJJEoOs
NVNhhcb66OJHah5ppI1N3cZehdaKyr1XcF9eedwLFTvuiwTn6qMmttT/tHX7rcxT
owIDAQAB
-----END PUBLIC KEY-----
```

* The mount,

		mount -t cvmfs data.galaxyproject.org /cvmfs/data.galaxyproject.org/
