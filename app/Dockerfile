# Flutter officially supports Ubuntu among linux distros.
FROM ubuntu:24.10 AS build

WORKDIR /app

# Install dependencies.
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget curl git unzip xz-utils zip libglu1-mesa

# Install Flutter.
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz
RUN tar -xvf ./flutter_linux_3.24.3-stable.tar.xz -C ./
ENV PATH="/app/flutter/bin:$PATH"

# Build app.
COPY . .
# Ignore Git ownership problem as it prevents building.
RUN git config --global --add safe.directory /app/flutter
RUN flutter pub get
RUN flutter build web -o build

FROM nginx:stable-alpine
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html

# docker build -t kokimorino/mweb-proxy:latest .
# docker push kokimorino/mweb-proxy:latest
