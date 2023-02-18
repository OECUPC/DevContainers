FROM debian

RUN apt update
RUN apt install -y curl
RUN apt install -y python3.9 && apt install -y python3-pip
RUN apt install -y git
RUN apt install -y nodejs
RUN apt install -y npm
RUN npm install -g n
RUN n stable

RUN mkdir /home/Dev