FROM valyriantech/comfyui-without-flux:latest

# Hugging Face Token (для приватных моделей)
ENV HF_TOKEN=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

# Копируем стартовый скрипт
COPY comfyui-with-flux/start.sh /start.sh
RUN chmod +x /start.sh

# Запускаем кастомный entrypoint
CMD ["/start.sh"]
