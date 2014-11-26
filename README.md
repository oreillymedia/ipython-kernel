

## Start the notebook kernel server in Docker

Run this on the command line

```
docker run -it -p 8000:8000 -v $(pwd):/usr/src odewahn/singlecell /bin/bash
```

Once it launches, start the server:

```
python kernel-server.py
```

## Run a static server locally

Then run a static page server on localhost, like this:

```
python -m SimpleHTTPServer
```

Then try to get the remote kernel to execute stuff you type into the box...


## To Do

### In Docker

* Remove the static app stuff from the repo entirely to just leave the kernel stuff
* Make a docker image that can auto-resart
* Host on something like Deis?  
* Explore how to get other kernels going
* How to add other Kernels (especially something like Go or Julia), or switch kernels?  


### In the web app

* Add restart kernel button, and a "halt" button
* Map the JS module to the new container (i.e., replace the hardcoded value in var ws_url = "ws://192.168.59.103:8000"; )
* Add a "Run" button to the codemirror cells
* Make it work with multiple samples, just like the other plugins
* Add a  "Powered by Jupyter" logo in the header or footer

