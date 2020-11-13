FROM alpine:latest

LABEL maintain = "ndiklas<nicholas.v.ndiki@gmail.com"
LABEL build_date="2020-09-23"

ARG BUILD_DATE

# Labels
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="Yolomy Client"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.description="Yolomy website front-end application"


RUN echo "Build Date: $BUILD_DATE"
RUN apk update && apk add nodejs nodejs-npm
COPY client /client
WORKDIR /client
RUN npm install
RUN npm run build
RUN npm install -g serve
EXPOSE 3000
CMD [ "serve", "-s", "build", "-l", "3000" ]
