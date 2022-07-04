FROM python:3.9

WORKDIR /app

RUN apt-get update && apt-get install python3-pip -y

RUN pip install \
    torch==1.10.1+cu111 \
    torchvision==0.11.2+cu111 \
    -f https://download.pytorch.org/whl/torch_stable.html

RUN pip install detectron2 -f \
    https://dl.fbaipublicfiles.com/detectron2/wheels/cu113/torch1.10/index.html

RUN pip install opencv-python-headless \
    mlflow azure-storage-blob azure-identity \
    dvc[s3] dvc[azure]

RUN pip uninstall -y protobuf && pip install protobuf==3.20.1

CMD [ "bash" ]
