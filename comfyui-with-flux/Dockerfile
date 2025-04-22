FROM valyriantech/comfyui-without-flux:latest

# Hugging Face Token (для приватных моделей)
ENV HF_TOKEN=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

# Копируем скрипты
COPY comfyui-with-flux/start.sh /start.sh
COPY comfyui-with-flux/start-original.sh /start-original.sh

# Делаем их исполняемыми
RUN chmod +x /start.sh /start-original.sh

# Запускаем кастомный entrypoint
CMD ["/start.sh"]
