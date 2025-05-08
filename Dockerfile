FROM python:3.11-slim

LABEL maintainer="forhire"

ENV IBAPI_VERSION=1030.01
ENV TWSAPI_DIR=/opt/twsapi
WORKDIR /scripts

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install IBAPI manually
RUN mkdir -p ${TWSAPI_DIR} && \
    cd ${TWSAPI_DIR} && \
    wget https://interactivebrokers.github.io/downloads/twsapi_macunix.${IBAPI_VERSION}.zip && \
    unzip twsapi_macunix.${IBAPI_VERSION}.zip && \
    cd IBJts/source/pythonclient && \
    pip install wheel && \
    python setup.py bdist_wheel && \
    pip install dist/*.whl && \
    cd / && rm -rf ${TWSAPI_DIR}

# Install the other Python packages
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Default command
CMD ["bash"]

