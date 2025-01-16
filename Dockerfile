# FROM python:3.12.3-alpine
# WORKDIR /app
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt
# # 開放 Flask 預設埠 5002
# EXPOSE 5002
# COPY . /app
# # 啟動 Flask 應用
# CMD ["python", "app.py"]
FROM python:3.12.3-alpine

# 安装必要的依赖工具和库
RUN apk add --no-cache gcc musl-dev libffi-dev

WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# 開放 Flask 預設埠 5002
EXPOSE 5002
COPY . /app

# 啟動 Flask 應用
CMD ["python", "app.py"]
