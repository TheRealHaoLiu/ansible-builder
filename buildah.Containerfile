ARG BASE_IMAGE=quay.io/buildah/stable:latest

FROM ${BASE_IMAGE} as builder
COPY . /tmp/src/
WORKDIR /tmp/src

RUN python3 -m ensurepip
RUN python3 -m pip install --upgrade pip build
RUN dnf install -y git

RUN python3 -m build

FROM ${BASE_IMAGE}
COPY --from=builder /tmp/src/dist /tmp/src/dist

RUN python3 -m ensurepip
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install /tmp/src/dist/*.tar.gz

RUN rm -rf /tmp/src
RUN mkdir -p /project

WORKDIR /project
