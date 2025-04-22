FROM valyriantech/comfyui-without-flux:latest

# Hugging Face Token (передаётся через ENV или RunPod UI)
ENV HF_TOKEN=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

# Копируем стартовый скрипт
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Запускаем его при старте контейнера
CMD ["/start.sh"]
