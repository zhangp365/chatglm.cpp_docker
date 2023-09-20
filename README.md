[中文版](README_cn.md)   [English Version](README.md)
# Introduction
This project is based on [li-plus/chatglm.cpp](https://github.com/li-plus/chatglm.cpp) to package a default [Xorbits/chatglm2-6B-GGML](https://huggingface.co/Xorbits/chatglm2-6B-GGML/tree/main) chatglm2-ggml-q4_1.bin model. It can be run in a Docker container, allowing you to experience chatglm2 directly through your browser, using only CPU, out of the box.

# Usage
*Run the following command using Docker*
```
docker run -p 7860:7860 -d zhangp365/chatglm-webui:v0.1
```
*Access it in your browser at http://localhost:7860/*

# Changing Models
You can replace it with other models supported by [li-plus/chatglm.cpp](https://github.com/li-plus/chatglm.cpp). When starting Docker, use the -v parameter and specify the model name in the -e environment variable. Place the model in the corresponding external directory as follows:``
```
docker run -p 7860:7860 -e CLI_ARGS="-m models/your_model_name" -v /your/path/models:/app/models -d zhangp365/chatglm-webui:v0.1
```
# Docker Image
Link: https://hub.docker.com/repository/docker/zhangp365/chatglm-webui/general
Size: packaging a 3.9GB chatglm2-ggml-q4_1.bin model, after compression in Docker, the image size is only 3.7GB, making it very convenient to download and experience. 

