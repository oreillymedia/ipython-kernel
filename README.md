Simple base image for a static Jupyter notebook server.


## Start the notebook kernel server in Docker


To build the image:

```
docker build -t odewahn/jupyter-kernel
```

To start the container manually: 

```
docker run -p 8888:8888 odewahn/jupyter-kernel
```

Eventually, though, this kernel should be started by fig or something like Deis.

## To Do

* Remove the static app stuff from the repo entirely to just leave the kernel stuff
* Make a docker image that can auto-resart
* Host on something like Deis?  
* Explore how to get other kernels going
* How to add other Kernels (especially something like Go or Julia), or switch kernels?  

