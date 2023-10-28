FROM --platform=linux/amd64 ubuntu:16.04
COPY ./sources.list /etc/apt/sources.list
RUN apt update && apt install -y python3 git gdb radare2 binutils build-essential vim
RUN git clone https://github.com/longld/peda.git ~/peda
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit
WORKDIR /app
CMD ["/bin/bash"]