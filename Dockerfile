FROM debian:sid
MAINTAINER Zhang Cheng <stephenpcg@gmail.com>

# current texlive version in debian:
#    jessie: 2014.20141024-2+deb8u1
#    stretch: 2016.20170123-5
#    sid: 2016.20170123-5

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		python-pip \
		python-setuptools \
	&& pip install Sphinx==1.5.5 \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		make \
		texlive \
		texlive-xetex \
		texlive-latex-extra \
		texlive-lang-cjk \
		fonts-noto-cjk \
		ttf-mscorefonts-installer \
	&& rm -rf /var/lib/apt/lists/*

VOLUME ["/sphinx"]
WORKDIR /sphinx
