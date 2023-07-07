# robotfframework-img
## Load image
```
docker load -i test-img.tar
```
We can use `docker image ls` to confirm that the image was loaded successfully. The name of the docker image should be `test-img`

## Run container
```
docker run -it --rm -v $(pwd):/test test-img bash -c "robot --output /test/results /test/test.robot"
```
## Build Container
If the saved image cannot run, we can build it using the Dockerfile
```
docker build -t test-img .
```
