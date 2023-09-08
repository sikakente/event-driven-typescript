FROM node:lts-alpine
WORKDIR /app
COPY ./dist/apps/payments-microservice .
COPY package.json package-lock.json ./
RUN npm install --production
CMD node ./main.js