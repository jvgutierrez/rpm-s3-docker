FROM centos:centos6
MAINTAINER "Valentin Gutierrez"
RUN yum check-update && yum install -y http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm || true
RUN yum install -y \
	python-boto \
	deltarpm \
	python-deltarpm \
	git
RUN git clone --recursive -- https://github.com/crohr/rpm-s3 /usr/local/rpm-s3
RUN adduser rpms3
USER rpms3
RUN echo 'PATH=$PATH:/usr/local/rpm-s3/bin/' > /home/rpms3/.bashrc
RUN echo 'source /etc/bashrc' >> /home/rpms3/.bashrc
WORKDIR /home/rpms3
CMD ["/bin/bash"]
