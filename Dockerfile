FROM node:14


WORKDIR /app


COPY . .


EXPOSE 7002

RUN apt-get update && \
    apt-get -y install apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get -y install docker-ce

RUN wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash

RUN dapr init

CMD ["dapr", "run", "--app-id", "user-service", "--app-port", "7002", "--dapr-http-port", "7502", "npm", "start"]
