FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl git nodejs npm openssh-client zstd \
    && rm -rf /var/lib/apt/lists/*

USER vscode
ENV ELAN_HOME=/home/vscode/.elan
ENV NPM_CONFIG_PREFIX=/home/vscode/.local
ENV PATH=${ELAN_HOME}/bin:${NPM_CONFIG_PREFIX}/bin:${PATH}
RUN curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh -s -- -y --default-toolchain none

COPY --chown=vscode:vscode install-codex.sh /tmp/install-codex.sh
RUN sh /tmp/install-codex.sh && rm /tmp/install-codex.sh
