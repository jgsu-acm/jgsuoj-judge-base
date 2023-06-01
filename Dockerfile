FROM ubuntu:22.04
ARG sandbox_version=1.6.7
ADD https://github.com/criyle/go-judge/releases/download/v${sandbox_version}/executorserver_${sandbox_version}_linux_amd64 /usr/bin/sandbox
RUN apt-get -qq update && \
    apt-get install -qq -y curl gcc g++ python3 pypy3 openjdk-17-jdk-headless && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get -qq update && apt-get -qq -y install nodejs yarn && \
    apt-get autoremove -qq -y --purge curl && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    chmod +x /usr/bin/sandbox
