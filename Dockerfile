FROM node:14


WORKDIR /app


COPY . .


EXPOSE 7002

RUN sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

RUN wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash

RUN dapr init

CMD ["dapr", "run", "--app-id", "user-service", "--app-port", "7002", "--dapr-http-port", "7502", "npm", "start"]
