Simple base image for a static Jupyter notebook server.

## Setting everything up

This is meant to run under vagrant, so first do:

```
$ vagrant up
```

Then, login to the image:

```
$ vagrant ssh
$ cd /vagrant
```

The first time you provision the VM, you should also pull some of the base docker images:

```
$ docker pull ubuntu
$ docker pull jupyter/tmpnb
$ docker pull jupyter/configurable-http-proxy
```

Next, build the image:

```
docker build -t odewahn/jupyter-kernel .
```

You can start everything like this:

```
$ ./start.sh
```

Then, go to your browser and hit:

`http://localhost:8000/`

This spins up a new container and redirects you to it.  It will look something like this:

`http://localhost:8000/user-RgpNmthp8Oqr/`

The websocket URL is then just this:

`ws://localhost:8000/user-RgpNmthp8Oqr/`

 

## Kernel Development 

If you want to hack on just the kernel code (i.e., the container that actually starts a single notebook kernel)

From the `/vagrant` directory, start test container like this:

```
docker run -it -p 8888:8888 -v $(pwd):/usr/src  -w /usr/src odewahn/jupyter-kernel /bin/bash
```

This will map the code volume in the container all the way through to your host directory.

Then, run the program:

```
python jupyter-kernel.py
```

Go to `localhost:8888` to see the output of the single kernel.  It should just give a status code, like this:

```
{"status": "ok"}
```






