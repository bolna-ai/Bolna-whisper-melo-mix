FROM python:3.9-slim
WORKDIR /app
RUN pip install vllm
RUN export HUGGING_FACE_HUB_TOKEN=<hugging face token>
EXPOSE 8000
CMD [ "python -m vllm.entrypoints.openai.api_server --model facebook/opt-125m" ]
