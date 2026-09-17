FROM nvidia/cuda:12.1.0-runtime-ubuntu22.04

RUN apt-get update && apt-get install -y python3.12 python3.12-dev python3-pip git ffmpeg

WORKDIR /app
COPY . /app

RUN pip3 install --upgrade pip
RUN pip3 install runpod soundfile
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
RUN pip3 install -e .

CMD [ "python3", "-u", "handler.py" ]
