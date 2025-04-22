#!/bin/bash

echo "🔍 Проверка моделей перед стартом ComfyUI..."

# === FLUX VAE
if [ ! -f /ComfyUI/models/vae/ae.safetensors ]; then
  echo "⬇️ Скачивание VAE..."
  wget --header="Authorization: Bearer $HF_TOKEN" \
       -O /ComfyUI/models/vae/ae.safetensors \
       "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors?download=true"
fi

# === FLUX UNET
if [ ! -f /ComfyUI/models/diffusion_models/flux1-dev.safetensors ]; then
  echo "⬇️ Скачивание UNet..."
  wget --header="Authorization: Bearer $HF_TOKEN" \
       -O /ComfyUI/models/diffusion_models/flux1-dev.safetensors \
       "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors?download=true"
fi

# === CLIP
if [ ! -f /ComfyUI/models/clip/clip_l.safetensors ]; then
  wget -O /ComfyUI/models/clip/clip_l.safetensors \
       "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true"
fi

if [ ! -f /ComfyUI/models/clip/t5xxl_fp8_e4m3fn.safetensors ]; then
  wget -O /ComfyUI/models/clip/t5xxl_fp8_e4m3fn.safetensors \
       "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors?download=true"
fi

# === LoRA
mkdir -p /ComfyUI/models/loras /ComfyUI/models/xlabs/loras

if [ ! -f /ComfyUI/models/loras/GracePenelopeTargaryenV5.safetensors ]; then
  wget -O /ComfyUI/models/loras/GracePenelopeTargaryenV5.safetensors \
       "https://huggingface.co/WouterGlorieux/GracePenelopeTargaryenV5/resolve/main/GracePenelopeTargaryenV5.safetensors?download=true"
fi

if [ ! -f /ComfyUI/models/loras/VideoAditor_flux_realism_lora.safetensors ]; then
  wget -O /ComfyUI/models/loras/VideoAditor_flux_realism_lora.safetensors \
       "https://huggingface.co/VideoAditor/Flux-Lora-Realism/resolve/main/flux_realism_lora.safetensors?download=true"
fi

if [ ! -f /ComfyUI/models/xlabs/loras/Xlabs-AI_flux-RealismLora.safetensors ]; then
  wget -O /ComfyUI/models/xlabs/loras/Xlabs-AI_flux-RealismLora.safetensors \
       "https://huggingface.co/XLabs-AI/flux-RealismLora/resolve/main/lora.safetensors?download=true"
fi

echo "🚀 Запуск ComfyUI..."
cd /ComfyUI

# Установка зависимостей, если requirements.txt есть
if [ -f requirements.txt ]; then
  echo "📦 Установка зависимостей..."
  pip install --no-cache-dir -r requirements.txt
fi

exec python3 main.py --listen
