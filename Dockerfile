FROM ubuntu
ARG sandbox_version=1.5.3
ADD https://github.com/criyle/go-judge/releases/download/v${sandbox_version}/executorserver_${sandbox_version}_linux_amd64 /usr/bin/sandbox
RUN apt-get -qq update && \
    apt-get install -qq -y curl gcc g++ python3 pypy3 openjdk-11-jdk-headless && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get -qq update && apt-get -qq -y install nodejs yarn && \
    apt-get autoremove -qq -y --purge curl && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    chmod +x /usr/bin/sandbox
