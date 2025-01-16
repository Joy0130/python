# FROM python:3.12.3-alpine
# WORKDIR /app
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt
# # 開放 Flask 預設埠 5002
# EXPOSE 5002
# COPY . /app
# # 啟動 Flask 應用
# CMD ["python", "app.py"]
FROM python:3.12-slim

# 安裝必要的系統依賴
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt ./  # 複製 requirements.txt
RUN pip install --no-cache-dir -r requirements.txt  # 安裝依賴

EXPOSE 5002
COPY . /app

CMD ["python", "app.py"]

