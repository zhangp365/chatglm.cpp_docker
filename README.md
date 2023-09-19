# Introduction
This project dockerises the deployment of [li-plus/chatglm.cpp](https://github.com/li-plus/chatglm.cpp) and its variants. It provides a default configuration (corresponding to a vanilla deployment of the application)

*This goal of this project is to be to [li-plus/chatglm.cpp](https://github.com/li-plus/chatglm.cpp), what [AbdBarho/stable-diffusion-webui-docker](https://github.com/AbdBarho/stable-diffusion-webui-docker) is to [AUTOMATIC1111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui).*

# Usage
*This project currently supports Linux as the deployment platform. It will also work using WSL2.*
docker run -p 7860:7860 -v /your/path/models:/models -d zhangp365/chatglm-webui:v0.1

## Pre-Requisites
- docker
- docker compose
- CUDA docker runtime

## Docker Compose
This is the recommended deployment method (it is the easiest and quickest way to manage folders and settings through updates and reinstalls). The recommend variant is `default` (it is an enhanced version of the vanilla application).


