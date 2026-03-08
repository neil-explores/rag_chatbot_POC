FROM python:3

WORKDIR /

EXPOSE 3000

RUN apt-get update && \
  apt-get install vim -y

WORKDIR /project

COPY app.py /project/app.py
COPY create_knowledge_base.py /project/create_knowledge_base.py

RUN pip install --upgrade pip
RUN pip install streamlit pandas numpy sentence-transformers faiss-cpu datasets pickle-mixin 

RUN python create_knowledge_base.py

CMD ["/bin/bash"]
