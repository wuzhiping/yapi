FROM node:8.11.4

RUN npm  config set strict-ssl  false
RUN npm install -g pm2 --loglevel verbose
# --registry=http://registry.npm.taobao.org

RUN apt-get update
RUN apt-get install vim git -y
RUN apt-get install build-essential software-properties-common -y

RUN mkdir /yapi
WORKDIR /yapi
RUN git clone https://github.com/YMFE/yapi.git vendors
RUN cp vendors/config_example.json ./config.json
WORKDIR /yapi/vendors
RUN rm -rf node_modules
RUN npm cache clean --force
RUN rm package-lock.json
RUN npm install --production  --loglevel verbose

#npm run install-server
#node server/app.js
EXPOSE 3000
