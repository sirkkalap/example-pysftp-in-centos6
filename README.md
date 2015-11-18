# example-pysftp-in-centos6
Sometimes things are crazy and you need some legacy implementations for old platforms. Let's try to overcome old CentOS/RHEL6 limitations in Python sftp-usage.

# Requirements

Docker-machine running and configured

# Running example

````bash
./start-sftp-server
docker build -t example-pysftp .
docker run -i -t --name example \
    -v $PWD/example-app:/example-app \
    --link sftp_server:sftp_server \
    example-pysftp
python /example-app/example.py
exit
````

Cleanup
`docker stop example sftp_server && docker rm example sftp_server`

# Debugging

````bash
#...
docker run -i -t --name example -v $PWD/example-app:/example-app example-pysftp
yum -y install ipython
ipython
In [1]: run -d /example-app/example.py
#...
````
