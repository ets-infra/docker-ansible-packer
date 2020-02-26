FROM etsinfra/docker-ansible

MAINTAINER Kenny Van de Maele <kenny@adimian.com>

ARG VER="1.5.4"
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt install wget unzip -y && \
    wget https://releases.hashicorp.com/packer/${VER}/packer_${VER}_linux_amd64.zip && \
    unzip packer_${VER}_linux_amd64.zip && \
    mv packer /usr/local/bin && \
    rm -f *.zip && \
    apt remove wget unzip -y

# default command: display packer version
CMD [ "packer", "--version" ]
