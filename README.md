# 🐾 Furever - 宠物救助平台

<div align="center">

![Furever Logo](https://img.shields.io/badge/Furever-宠物救助平台-orange?style=for-the-badge)
![Go](https://img.shields.io/badge/Go-1.25.3-blue?style=for-the-badge&logo=go)
![Gin](https://img.shields.io/badge/Gin-Web框架-green?style=for-the-badge&logo=gin)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

**一个温暖的宠物救助平台，用技术连接爱心，为每一个小生命找到温暖的家**

</div>

## 📖 项目简介

Furever 是一个致力于改善宠物福利的开源平台，通过数字化技术连接救助者、捐赠者和领养家庭，为流浪动物提供更好的生活机会。

## 🚀 快速开始

### 使用 Docker Compose (推荐)

1. **克隆项目**
```bash
git clone <repository-url>
cd furever
```

2. **初始化环境配置**
```bash
cp .env.example .env
```

3. **启动服务**
```bash
docker-compose up -d
```

4. **访问服务**
- **应用**: http://localhost:8080
- **API 文档**: http://localhost:8080/swagger/index.html
- **PostgreSQL**: localhost:5432
- **Redis**: localhost:6379

### 本地开发

1. **安装依赖**
```bash
go mod download
```

2. **启动数据库服务**
```bash
docker-compose up -d postgres redis
```

3. **运行应用**
```bash
go run main.go
```

## 🛠️ 技术架构

### 后端技术栈
- **Go 1.25.3** - 高性能、并发友好的编程语言
- **Gin Framework** - 轻量级、高性能的 Web 框架
- **PostgreSQL** - 可靠的关系型数据库
- **Redis** - 高速缓存和会话存储
- **Docker** - 容器化部署，环境一致性
- **Swagger** - API 文档自动生成

### 项目结构
```
.
├── main.go                 # 应用入口
├── go.mod                  # Go 模块文件
├── go.sum                  # 依赖锁定文件
├── Dockerfile              # Docker 镜像构建文件
├── docker-compose.yml      # Docker Compose 配置
├── .env.example           # 环境变量模板
└── docs/                  # Swagger 文档目录
```

## 📋 常用命令

```bash
# 启动所有服务
docker-compose up -d

# 查看服务状态
docker-compose ps

# 查看日志
docker-compose logs -f

# 停止服务
docker-compose down

# 连接数据库
docker-compose exec postgres psql -U furever_user -d furever_db

# 连接 Redis
docker-compose exec redis redis-cli
```

### API 文档
启动服务后，可以通过以下地址访问 API 文档：
- http://localhost:8080/swagger/index.html

## 🔧 环境配置

Docker Compose 使用变量替换语法自动读取 `.env` 文件中的环境变量。

### 设置环境变量
```bash
cp .env.example .env
# 根据需要编辑 .env 文件
```

### 环境变量文件 (.env)
```bash
# 数据库配置
DB_HOST=localhost        # 本地开发使用 localhost
DB_PORT=5432
DB_USER=furever_user
DB_PASSWORD=furever_password
DB_NAME=furever_db
DB_SSL_MODE=disable

# Redis 配置
REDIS_HOST=localhost     # 本地开发使用 localhost
REDIS_PORT=6379
REDIS_PASSWORD=
REDIS_DB=0

# 应用配置
GIN_MODE=release
APP_ENV=development
APP_PORT=8080
```

### Docker 环境变量映射
Docker Compose 会自动将 `.env` 中的变量映射到容器中，并在 Docker 内部将主机名替换为服务名：

| 本地 .env | Docker 容器内 | 说明 |
|----------|---------------|------|
| `DB_HOST=localhost` | `DB_HOST=postgres` | 自动替换为 PostgreSQL 服务名 |
| `REDIS_HOST=localhost` | `REDIS_HOST=redis` | 自动替换为 Redis 服务名 |

### 默认值
Docker Compose 配置中所有变量都有默认值，即使 `.env` 文件不存在也能正常运行：
- 数据库: `furever_db`, `furever_user`, `furever_password`
- Redis: 端口 6379, 无密码
- 应用: 端口 8080, release 模式

## 🗄️ 数据库

### 默认连接信息
- **主机**: localhost:5432
- **数据库**: furever_db
- **用户名**: furever_user
- **密码**: furever_password

## 🚨 故障排除

### 常见问题

1. **端口冲突**
   - 检查端口是否被占用
   - 修改 `docker-compose.yml` 中的端口映射

2. **数据库连接失败**
   - 确认 PostgreSQL 服务已启动
   - 检查连接配置是否正确

3. **Redis 连接失败**
   - 确认 Redis 服务已启动
   - 检查防火墙设置

### 查看日志
```bash
# 查看所有服务日志
docker-compose logs

# 查看应用日志
docker-compose logs app

# 查看数据库日志
docker-compose logs postgres

# 查看Redis日志
docker-compose logs redis
```

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

MIT License
