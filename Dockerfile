FROM nginx:1.13
MAINTAINER Waylon Wang <waylon@waylon.wang>

RUN apt-get update \
    && apt-get install -y libav-tools \
    && apt-get install -y net-tools \
    && apt-get install -y iputils-ping \
    && apt-get install -y vim \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/nginx/conf.d
COPY *.conf ./

ENTRYPOINT ["/init"]
CMD ["nginx", "-g", "daemon off;"]