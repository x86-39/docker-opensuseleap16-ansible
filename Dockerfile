FROM registry.opensuse.org/home/x86-39/opensuse/leap/16.0/images/images/opensuse/leap:16.0
LABEL maintainer="Jasmijn Emilia Rosalina Knoope"
ENV container=docker

# Install systemd -- See https://hub.docker.com/_/centos/
RUN zypper -n install systemd; zypper clean ; \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install requirements.
RUN zypper refresh \
 && zypper install -y \
      sudo \
      which \
      hostname \
      iproute \
      python3 \
 && zypper clean -a

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/lib/systemd/systemd"]
