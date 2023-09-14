FROM node:lts-alpine
ARG KAFKA_BROKERS=kafka-service:9092
ENV KAFKA_BROKERS ${KAFKA_BROKERS}
WORKDIR /app
COPY ./dist/apps/api-gateway .
COPY package.json package-lock.json ./
ENV PORT=3333
EXPOSE ${PORT}
RUN npm install --production
CMD node ./main.js