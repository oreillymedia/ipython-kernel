from python:latest

RUN pip install Jinja2
RUN pip install httplib2
RUN pip install matplotlib
RUN pip install python-dateutil
RUN pip install python-gflags
RUN pip install pyzmq
RUN pip install tornado
#RUN pip install wsgiref
RUN pip install ipython==1.1.0


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