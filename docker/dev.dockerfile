FROM golang:1.17.2-buster

# Download and install Helm
ENV HELM_ZIP="helm-v2.16.7-linux-amd64.tar.gz"
ENV HELM_BINARY_URL="https://get.helm.sh/${HELM_ZIP}"
RUN curl "${HELM_BINARY_URL}" --output "${HELM_ZIP}"\
    && tar -zxvf "${HELM_ZIP}" \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf ${HELM_ZIP} \
    && rm -rf linux-amd64

ENV PATH="/app/development/docker/bin:${PATH}"
