FROM debian:bullseye


RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl


RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt \
    -subj "/C=MA/ST=Hamid/L=BenGuerir/O=dadas/CN=mabahani.42.fr"


COPY ./tools/default.conf /etc/nginx/conf.d/default.conf


EXPOSE 443


ENTRYPOINT ["nginx", "-g", "daemon off;"]
