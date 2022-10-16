FROM node:12.18.1
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm init -y
RUN npm install --production

COPY . .

RUN groupadd -r user && useradd -r -g user user
USER user

CMD [ "node", "server.js" ]
