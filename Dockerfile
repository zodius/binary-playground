FROM --platform=linux/amd64 ubuntu:16.04
COPY ./sources.list /etc/apt/sources.list
RUN apt update && apt install -y python3 git gdb radare2 binutils build-essential vim gcc-multilib g++-multilib
RUN git clone https://github.com/longld/peda.git ~/peda
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit
WORKDIR /app
ADD Makefile /app/
ADD src /app/src
RUN make
ADD vendor/pivot32 /app/build/lab2-pivot32
CMD ["/bin/bash"]
