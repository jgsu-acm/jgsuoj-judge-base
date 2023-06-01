FROM gcc:13
ARG sandbox_version=1.6.7
ADD https://github.com/criyle/go-judge/releases/download/v${sandbox_version}/executorserver_${sandbox_version}_linux_amd64 /usr/bin/sandbox
RUN apt-get -qq update && \
    apt-get install -qq -y pypy3 openjdk-17-jdk-headless nodejs yarnpkg && \
    update-alternatives --install /usr/bin/yarn yarn /usr/bin/yarnpkg 100 && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    chmod +x /usr/bin/sandbox
