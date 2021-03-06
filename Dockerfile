FROM etsinfra/docker-ansible

MAINTAINER Kenny Van de Maele <kenny@adimian.com>

ARG VER="1.7.0"
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt install wget curl unzip jq -y && \
    wget https://releases.hashicorp.com/packer/${VER}/packer_${VER}_linux_amd64.zip && \
    unzip packer_${VER}_linux_amd64.zip && \
    mv packer /usr/local/bin && \
    rm -f *.zip && \
    curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb" && \
    dpkg -i session-manager-plugin.deb && \
    session-manager-plugin && \
    apt remove wget unzip -y

RUN adduser packer && usermod -a -G sudo packer

USER packer

# default command: display packer version
CMD [ "packer", "--version" ]
