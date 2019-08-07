FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN \
  sed -i -e "s%http://[^ ]\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list && \
  apt update && \
  apt upgrade -y && \
  apt -y --no-install-recommends install \
  ca-certificates curl sudo xorg dbus dbus-x11 ubuntu-gnome-default-settings gtk2-engines \
  ttf-ubuntu-font-family fonts-ubuntu-font-family-console fonts-droid-fallback lxappearance && \
  apt-get autoclean && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/* && \
  echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

COPY Xilinx_ISE_DS_Lin_14.7_1015_1.tar /

RUN mkdir /vivado-installer &&\
  tar --strip-components 1 -C /vivado-installer \
  -xvf Xilinx_ISE_DS_Lin_14.7_1015_1.tar &&\
  rm /Xilinx_ISE_DS_Lin_14.7_1015_1.tar

