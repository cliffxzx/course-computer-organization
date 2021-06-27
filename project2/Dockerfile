FROM ubuntu:18.04

WORKDIR /root
# RUN mkdir gem5 && curl -s https://gem5.googlesource.com/public/gem5/+archive/525ce650e1a5bbe71c39d4b15598d6c003cc9f9e.tar.gz | tar xvz -C gem5
# RUN git clone https://github.com/SEAL-UCSB/NVmain nvmain
# COPY gem5 /root/gem5
# COPY nvmain /root/nvmain
RUN apt-get -qq update && apt-get -qq -y install build-essential git m4 scons zlib1g zlib1g-dev libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev python3-dev python3-six python libboost-all-dev pkg-config curl
