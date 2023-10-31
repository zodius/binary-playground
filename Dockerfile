FROM --platform=linux/amd64 rust:latest AS ropr
RUN cargo install ropr

FROM --platform=linux/amd64 ubuntu:22.04 AS bin
COPY ./sources.list /etc/apt/sources.list
RUN apt update && apt install -y python3 git gdb binutils build-essential vim gcc-multilib g++-multilib python3-pip
WORKDIR /app
ADD Makefile /app/
ADD src /app/src
RUN make
ADD vendor/pivot32 /app/build/lab/lab2-pivot32


FROM --platform=linux/amd64 ubuntu:22.04
COPY ./sources.list /etc/apt/sources.list
RUN apt update && apt install -y python3 git gdb binutils build-essential vim gcc-multilib g++-multilib python3-pip tmux
RUN git clone https://github.com/longld/peda.git ~/peda
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit
RUN pip3 install -U pip
RUN pip3 install ROPGadget pwntools
WORKDIR /app
COPY --from=bin /app/build /app
COPY --from=ropr /usr/local/cargo/bin/ropr /usr/local/bin/ropr
CMD ["/bin/bash"]
