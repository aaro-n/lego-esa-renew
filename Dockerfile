# 使用轻量的基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /home/www

# 安装依赖项并清理缓存
RUN apk update && \
    apk add --no-cache curl && \
    curl -L https://aliyuncli.alicdn.com/aliyun-cli-linux-latest-amd64.tgz -o aliyun-cli.tgz && \
    tar -xzf aliyun-cli.tgz && \
    mv aliyun /usr/local/bin/ && \
    chmod +x /usr/local/bin/aliyun && \
    # 获取最新版本信息
    latest_version=$(curl -s https://api.github.com/repos/go-acme/lego/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/') && \
    # 构建下载链接
    download_url="https://github.com/go-acme/lego/releases/download/${latest_version}/lego_${latest_version}_linux_amd64.tar.gz" && \
    # 下载并安装 Lego
    wget -O lego_linux_amd64.tar.gz "$download_url" && \
    tar -xzf lego_linux_amd64.tar.gz && \
    mv lego /usr/local/bin/ && \
    chmod +x /usr/local/bin/lego && \
    rm -rf /var/cache/apk/*

# 添加一个命令，使容器保持运行
CMD ["tail", "-f", "/dev/null"]
