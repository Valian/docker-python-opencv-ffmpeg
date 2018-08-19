# Docker: python-opencv-ffmpeg(-cuda)

Repository for clean Dockerfile containing ffmpeg, opencv3 and python2/3, based on Ubuntu 16.04 LTS.

## Tags

* `:py2` Python 2.7, OpenCV 3.4.2, ffmpeg  
* `:py3` Python 3.5, OpenCV 3.4.2, ffmpeg  
* `:py2-cuda` Python 2.7, OpenCV 3.4.2, ffmpeg with CUDA 8.0 support  
* `:py3-cuda` Python 3.5, OpenCV 3.4.2, ffmpeg with CUDA 8.0 support  


## Build

First you need to install docker on your local computer, see following [tutorial](https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository). Note, for running the docker properly you have be logged as superuser otherwise you will face many partial issues which sometimes does not make much sense.

You can build it on your own, note it takes lots of time, be prepared.
``` bash
git clone <git-repository>
cd docker_python-opencv-ffmpeg
docker image build -t valian/docker-python-opencv-ffmpeg -f Dockerfile-py2 .
```
To build other versions, select different Dockerfile.

Other option is using already build image from DockerHub which is significantly faster. it basically download the already build image.
``` bash
docker pull valian/docker-python-opencv-ffmpeg
```

## Usage

Image has OpenCV3, python2.7/3.5 and ffmpeg ready to use. Example:

``` bash
docker run --rm -it -v $PWD:/srv valian/docker-python-opencv-ffmpeg
>>> import cv2; cv2.VideoCapture(0).read()
# truncated for transparency
(True, array([[[ 0, 43, 37], ...]], dtype=uint8))
```