#Note - For this manifest to work correctly, the Docker repo must be available locally, and the Docker & Puppet root directories must be in the /opt/biocloud/ directory

include docker::setup

#Spin up the container
exec { 'run-container':
        command=>'/opt/biocloud/docker/horizon/containerup',
        before=>Exec['attach-container']
}

Class['docker::setup'] -> Exec['run-container']
