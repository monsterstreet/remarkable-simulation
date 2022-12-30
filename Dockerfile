FROM alpine:latest
USER root
RUN echo 'root:alpine' | chpasswd
RUN apk add \
    openssh-server \
    sudo \
    iproute2 \
    net-tools \
    e2fsprogs

RUN mkdir -p /run/sshd
RUN ssh-keygen -A
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
EXPOSE 22

# configure the filesystem to look like a remarkable
RUN mkdir -p /usr/share/remarkable/templates/
RUN echo 'REMARKABLE_RELEASE_VERSION=0.0.0.simulation' > /usr/share/remarkable/update.conf

# copy local templates
COPY templates/* /usr/share/remarkable/templates/

# mimic `systemctl` with `echo`
RUN echo '/bin/busybox echo $@' > /bin/systemctl
RUN chmod u+x /bin/systemctl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
