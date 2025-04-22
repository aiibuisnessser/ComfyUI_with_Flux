FROM valyriantech/comfyui-without-flux:latest

# === HF_TOKEN (для приватных моделей) ===
ARG HF_TOKEN
ENV HF_TOKEN=${HF_TOKEN}

# === FLUX BASE MODELS ===

# Download ae.safetensors (VAE)
RUN wget --header="Authorization: Bearer ${HF_TOKEN}" \
     -O /ComfyUI/models/vae/ae.safetensors \
     "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors?download=true"

# Download flux1-dev.safetensors (UNet)
RUN wget --header="Authorization: Bearer ${HF_TOKEN}" \
     -O /ComfyUI/models/diffusion_models/flux1-dev.safetensors \
     "https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors?download=true"

# === FLUX CLIP models ===

RUN wget -O /ComfyUI/models/clip/clip_l.safetensors \
     "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true"

RUN wget -O /ComfyUI/models/clip/t5xxl_fp8_e4m3fn.safetensors \
     "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors?download=true"

# === LoRA models ===

RUN wget -O /ComfyUI/models/loras/GracePenelopeTargaryenV5.safetensors \
     "https://huggingface.co/WouterGlorieux/GracePenelopeTargaryenV5/resolve/main/GracePenelopeTargaryenV5.safetensors?download=true"

RUN wget -O /ComfyUI/models/loras/VideoAditor_flux_realism_lora.safetensors \
     "https://huggingface.co/VideoAditor/Flux-Lora-Realism/resolve/main/flux_realism_lora.safetensors?download=true"

RUN mkdir -p /ComfyUI/models/xlabs/loras && \
    wget -O /ComfyUI/models/xlabs/loras/Xlabs-AI_flux-RealismLora.safetensors \
    "https://huggingface.co/XLabs-AI/flux-RealismLora/resolve/main/lora.safetensors?download=true"

# === ControlNet Annotators (OpenPose, FaceNet, Hands) ===

RUN mkdir -p /ComfyUI/custom_nodes/comfyui_controlnet_aux/ckpts/lllyasviel/Annotators && \
    wget -O /ComfyUI/custom_nodes/comfyui_controlnet_aux/ckpts/lllyasviel/Annotators/body_pose_model.pth \
    "https://huggingface.co/lllyasviel/Annotators/resolve/main/body_pose_model.pth?download=true" && \
    wget -O /ComfyUI/custom_nodes/comfyui_controlnet_aux/ckpts/lllyasviel/Annotators/hand_pose_model.pth \
    "https://huggingface.co/lllyasviel/Annotators/resolve/main/hand_pose_model.pth?download=true" && \
    wget -O /ComfyUI/custom_nodes/comfyui_controlnet_aux/ckpts/lllyasviel/Annotators/facenet.pth \
    "https://huggingface.co/lllyasviel/Annotators/resolve/main/facenet.pth?download=true"

# === Запуск ComfyUI ===
CMD ["/start.sh"]
