FROM debian
WORKDIR /opt/wpp
CMD ["./demo"]
EXPOSE 5000
RUN apt-get -y update
RUN apt-get install -y build-essential
COPY . .
RUN make
