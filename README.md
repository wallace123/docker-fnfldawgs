# docker-fnfldawgs
Docker Buildfile for fnfldawgs test environment

# To build
docker build -t wallace123/docker-fnfldawgs .

# To push
docker login
docker push wallace123/docker-fnfldawgs

# To run
docker run -it --name fnfldawgs -v /path/to/fnfldawgs:/fnfldawgs -p 8000:8000 -p 5432:5432 wallace123/docker-fnfldawgs /bin/bash

# For first time use, run
./setup.sh

# For all uses after first time
./start.sh
