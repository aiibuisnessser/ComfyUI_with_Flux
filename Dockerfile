FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

WORKDIR /workspace

# Установим системные зависимости
RUN apt-get update && apt-get install -y \
    git python3 python3-pip python3-venv wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Скопируем проект
COPY . .

# Установим зависимости Python
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Запуск
CMD ["bash", "start.sh"]
