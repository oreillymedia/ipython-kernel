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

RUN pip install Jinja2
RUN pip install httplib2
RUN pip install matplotlib
RUN pip install python-dateutil
RUN pip install python-gflags
RUN pip install pyzmq
RUN pip install tornado
#RUN pip install wsgiref
RUN pip install ipython==1.1


# Create a pyxie user

RUN useradd -m -s /bin/bash pyxie
RUN mkdir -p /home/pyxie

# Add the source code to the image
ADD . /home/pyxie 
RUN chown -R pyxie:pyxie /home/pyxie

USER pyxie
ENV HOME /home/pyxie
ENV SHELL /bin/bash
ENV USER pyxie

EXPOSE 8888

WORKDIR /home/pyxie
