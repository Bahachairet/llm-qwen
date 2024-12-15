# Use a lightweight base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y curl

# Install Ollama
RUN curl https://ollama.ai/install.sh | sh

# Download the Qwen model
RUN ollama pull qwen2.5:0.5b-instruct-q5_K_M

# Expose the port for the LLM
EXPOSE 11434

# Start the LLM service
CMD ["ollama", "serve"]