from ipython/scipystack

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
