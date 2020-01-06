FROM ubuntu:bionic

RUN apt-get update -qq && apt upgrade -y && apt-get install -y build-essential carton starman
RUN mkdir /htmlmason
WORKDIR /htmlmasondemo

COPY cpanfile /htmlmasondemo
COPY cpanfile.snapshot /htmlmasondemo
RUN carton install

RUN apt remove build-essential -y

COPY . /htmlmasondemo
ENTRYPOINT [ "./run.sh" ]
EXPOSE 3001