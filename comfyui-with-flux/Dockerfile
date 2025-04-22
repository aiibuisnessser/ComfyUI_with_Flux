FROM valyriantech/comfyui-without-flux:latest

# === Hugging Face Token (жестко вшит) ===
ENV HF_TOKEN=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

# === 🔐 Проверка токена (быстрый фейл, если невалидный) ===
RUN echo "🧪 Проверка HuggingFace токена..." && \
    wget --spider --header="Authorization: Bearer ${HF_TOKEN}" \
    "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors" || \
    (echo "❌ Неверный HF_TOKEN или нет доступа к модели!" && exit 1)

# === 🟣 FLUX: VAE ===
RUN echo "⬇️ Скачивание FLUX VAE (ae.safetensors)..." && \
    wget --progress=dot:giga --header="Authorization: Bearer ${HF_TOKEN}" \
    -O /ComfyUI/models/vae/ae.safetensors \
    "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors?download=true"

# === 🔵 FLUX: UNet ===
RUN echo "⬇️ Скачивание FLUX UNet (flux1-dev.safetensors)..." && \
    wget --progress=dot:giga --header="Authorization: Bearer ${HF_TOKEN}" \
    -O /ComfyUI/models/diffusion_models/flux1-dev.safetensors \
    "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors?download=true"

# === 🟡 FLUX CLIP модели ===
RUN echo "⬇️ Скачивание CLIP моделей..." && \
    wget --progress=dot:giga \
    -O /ComfyUI/models/clip/clip_l.safetensors \
    "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true" && \
    wget --progress=dot:giga \
    -O /ComfyUI/models/clip/t5xxl_fp8_e4m3fn.safetensors \
    "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors?download=true"

# === 🧡 LoRA модели ===
RUN echo "⬇️ Скачивание LoRA моделей..." && \
    wget --progress=dot:giga \
    -O /ComfyUI/models/loras/GracePenelopeTargaryenV5.safetensors \
    "https://huggingface.co/WouterGlorieux/GracePenelopeTargaryenV5/resolve/main/GracePenelopeTargaryenV5.safetensors?download=true" && \
    wget --progress=dot:giga \
    -O /ComfyUI/models/loras/VideoAditor_flux_realism_lora.safetensors \
    "https://huggingface.co/VideoAditor/Flux-Lora-Realism/resolve/main/flux_realism_lora.safetensors?download=true" && \
    mkdir -p /ComfyUI/models/xlabs/loras && \
    wget --progress=dot:giga \
    -O /ComfyUI/models/xlabs/loras/Xlabs-AI_flux-RealismLora.safetensors \
    "https://huggingface.co/XLabs-AI/flux-RealismLora/resolve/main/lora.safetensors?download=true"

# === 🚀 Запуск ComfyUI ===
CMD ["/start.sh"]
