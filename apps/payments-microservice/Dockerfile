FROM node:lts-alpine
ARG KAFKA_BROKERS=kafka-service:9092
ENV KAFKA_BROKERS ${KAFKA_BROKERS}
WORKDIR /app
COPY ./dist/apps/payments-microservice .
COPY package.json package-lock.json ./
RUN npm install --production
CMD node ./main.js