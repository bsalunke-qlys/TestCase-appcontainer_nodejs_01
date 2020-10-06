FROM node:10.17.0 AS build-env
ADD . /app
WORKDIR /app
RUN npm install --only=production

FROM gcr.io/distroless/nodejs:12
COPY --from=build-env /app /app
WORKDIR /app
EXPOSE 3000
CMD ["hello_express.js"]
