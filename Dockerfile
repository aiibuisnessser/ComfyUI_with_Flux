FROM nvidia/cuda:12.2.0-cudnn8-runtime-ubuntu22.04

WORKDIR /workspace

# Ставим зависимости
RUN apt-get update && apt-get install -y \
    git python3 python3-pip python3-venv wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Копируем проект
COPY . .

# Устанавливаем Python зависимости
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Запускаем ComfyUI
CMD ["bash", "start.sh"]
