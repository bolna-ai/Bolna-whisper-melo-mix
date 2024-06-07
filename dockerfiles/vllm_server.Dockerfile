FROM python:3.9-slim
WORKDIR /app
RUN pip install vllm
RUN export HUGGING_FACE_HUB_TOKEN=<hugging face token>
EXPOSE 8000
CMD [ "python3","-m" ,"vllm.entrypoints.openai.api_server", "--model", "cognitivecomputations/dolphin-2.9-llama3-8b","--host","0.0.0.0" ]

