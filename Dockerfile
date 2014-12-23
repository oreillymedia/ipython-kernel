from ubuntu:latest

RUN apt-get update
RUN apt-get install -y ruby1.9.3
RUN apt-get install -y python-software-properties python-dev python-pip
RUN apt-get install -y libfreetype6-dev 
RUN apt-get install -y libxft-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y vim 
RUN apt-get install -y git-core 
RUN apt-get install -y build-essential 
RUN apt-get install -y curl unzip wget
RUN apt-get install -y python-scipy 
RUN apt-get install -y python-sklearn
RUN apt-get install -y imagemagick 
RUN apt-get install -y python-vtk

RUN pip install Jinja2
RUN pip install httplib2
RUN pip install matplotlib
RUN pip install python-dateutil
RUN pip install python-gflags
RUN pip install pyzmq
RUN pip install tornado
RUN pip install ipython==1.1
RUN pip install mayavi
RUN pip install numpy

#
# Install movielib from source
#
WORKDIR /tmp
RUN git clone https://github.com/Zulko/moviepy.git
WORKDIR /tmp/moviepy
RUN pip install .

# Create a pyxie user

RUN useradd -m -s /bin/bash pyxie
RUN mkdir -p /home/pyxie

# Add the source code to the image
ADD . /home/pyxie 

# Installs the required library
RUN python /home/pyxie/t.py

RUN chown -R pyxie:pyxie /home/pyxie

#USER pyxie
#ENV HOME /home/pyxie
#ENV SHELL /bin/bash
#ENV USER pyxie


EXPOSE 8888

WORKDIR /home/pyxie
