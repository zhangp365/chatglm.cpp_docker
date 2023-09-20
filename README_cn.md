[中文版](README_cn.md)   [English Version](README.md)
# 介绍
该项目基于[li-plus/chatglm.cpp](https://github.com/li-plus/chatglm.cpp) 打包一个默认的[Xorbits/chatglm2-6B-GGML](https://huggingface.co/Xorbits/chatglm2-6B-GGML/tree/main) chatglm2-ggml-q4_1.bin模型，可在docker 运行后，通过浏览器直接体验chatglm2，仅使用cpu，开箱即用。

# 使用方法
*使用docker 运行以下命令*
```
docker run -p 7860:7860 -d zhangp365/chatglm-webui:v0.1
```
*在浏览器中输入 http://localhost:7860/ 地址体验*

# 更换模型体验
可更换 [li-plus/chatglm.cpp](https://github.com/li-plus/chatglm.cpp) 支持的其他模型，启动docker 时 -v 加上以下参数，并在 -e 环境变量中指定模型名字，在对应的外部目录放入模型即可
```
docker run -p 7860:7860 -e CLI_ARGS="-m models/your_model_name" -v /your/path/models:/app/models   -d zhangp365/chatglm-webui:v0.1
```

# Docker 镜像
地址： https://hub.docker.com/repository/docker/zhangp365/chatglm-webui/general
大小： 打包一个3.9G chatglm2-ggml-q4_1.bin模型，经过docker压缩，镜像大小仅3.7G，非常方便下载体验

