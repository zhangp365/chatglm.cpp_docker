FROM ubuntu:latest AS env_base
RUN apt-get update && apt-get install -y  git  curl python3.10 && apt-get clean \
&& curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py  && python3.10 get-pip.py
# Instantiate venv and pre-activate
RUN pip3 install --no-cache-dir --upgrade pip setuptools


FROM env_base AS base 

# Install chatglm-webui
RUN mkdir /app
WORKDIR /app
RUN pip install --no-cache-dir gradio==3.44.3 
COPY chatglm_cpp-0.2.6-cp310-cp310-linux_x86_64.whl /app
RUN  pip install chatglm_cpp-0.2.6-cp310-cp310-linux_x86_64.whl

# download models
RUN mkdir -p /app/default_models
COPY chatglm2-ggml-q4_1.bin /app/default_models/chatglm2-ggml-q4_1.bin

COPY web_demo.py /app/web_demo.py

FROM base as base_ready
RUN rm -rf /root/.cache/pip/*
# Finalise app setup
EXPOSE 7860
EXPOSE 5000
EXPOSE 5005
# Required for Python print statements to appear in logs
ENV PYTHONUNBUFFERED=1
# Force variant layers to sync cache by setting --build-arg BUILD_DATE
ARG BUILD_DATE
ENV BUILD_DATE=$BUILD_DATE
RUN echo "$BUILD_DATE" > /build_date.txt

# Copy and enable all scripts
COPY ./scripts /scripts
RUN chmod +x /scripts/*

# Run
ENTRYPOINT ["/scripts/docker-entrypoint.sh"]

FROM base_ready AS default
RUN echo "DEFAULT" >> /variant.txt
ENV CLI_ARGS=""
CMD python3.10 web_demo.py ${CLI_ARGS}