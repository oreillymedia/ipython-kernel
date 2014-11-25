

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

