FROM debian:11.6-slim AS builder
WORKDIR /opt/wpp
RUN apt-get -y update && \
    apt-get install -y build-essential
COPY . .
RUN  make

FROM debian:11.6-slim AS runtime
WORKDIR /opt/wpp
EXPOSE 5000
CMD ["./demo"]
COPY --from=builder /opt/wpp/demo ./demo
