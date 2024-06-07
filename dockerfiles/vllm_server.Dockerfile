FROM python:3.9-slim
WORKDIR /app
RUN apt-get update && apt-get upgrade
RUN pip install vllm
RUN export HUGGING_FACE_HUB_TOKEN=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
RUN pip install huggingface_hub
RUN apt-get install -y  build-essential
RUN python -c "from huggingface_hub.hf_api import HfFolder; HfFolder.save_token('<huggingface_token>')"
EXPOSE 8000
CMD [ "python3","-m" ,"vllm.entrypoints.openai.api_server", "--model", "cognitivecomputations/dolphin-2.9-llama3-8b","--host","0.0.0.0","--trust-remote-code"]