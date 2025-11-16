# 多阶段构建，减少最终镜像大小
FROM golang:1.25.3-alpine AS builder

# 设置工作目录
WORKDIR /app

# 设置环境变量
ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# 安装 git (某些依赖需要)
RUN apk add --no-cache git

# 复制 go mod 和 sum 文件
COPY go.mod go.sum ./

# 下载依赖
RUN go mod download && go mod verify

# 复制源代码 (包括 docs 目录)
COPY . .

# 确保在正确的工作目录
WORKDIR /app

# 构建应用
RUN go build -a -installsuffix cgo -ldflags="-w -s" -o furever .

# 最终阶段 - 使用小体积的基础镜像
FROM alpine:latest

# 安装 ca-certificates 用于 HTTPS 请求
RUN apk --no-cache add ca-certificates tzdata

# 设置时区
ENV TZ=Asia/Shanghai

WORKDIR /root/

# 从构建阶段复制可执行文件
COPY --from=builder /app/furever .

# 暴露端口
EXPOSE 8080

# 运行应用
CMD ["./furever"]
