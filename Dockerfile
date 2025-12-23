# 1. 使用官方 Python 轻量级基础镜像 (根据你的项目需求选择版本，这里推荐 3.10)
FROM python:3.11-slim

# 2. 设置工作目录
WORKDIR /app

# 3. 将当前目录下的 requirements.txt 复制到容器中
# 注意：因为 Dockerfile 在 sora2api 目录下，所以直接复制即可
COPY requirements.txt .

# 4. 安装依赖
# --no-cache-dir 可以减小镜像体积
# 这一步对应你原本的 pip install -r requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 5. 复制剩余的项目文件到容器中
COPY . .

# 6. (可选) 如果 main.py 启动了 Web 服务（如 Flask/FastAPI），你需要暴露端口
# 假设是 8000 端口，如果不是请修改
# EXPOSE 8000

# 7. 启动服务
# 对应你原本的 python main.py
CMD ["python", "main.py"]
