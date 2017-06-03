# docker-python-opencv-ffmpeg
Repository for clean Dockerfile containing ffmpeg, opencv3 and python2, based on Ubuntu

# Build
You can build it on your own

    git clone https://github.com/Valian/docker-python-opencv-ffmpeg
    cd docker-python-opencv-ffmpeg
    
    # takes lots of time, be prepared
    docker build -t valian/docker-python-opencv-ffmpeg .

But I encourage you to use version from DockerHub - it's MUCH faster

    docker pull valian/docker-python-opencv-ffmpeg
    
# Usage

Image has OpenCV3, python2.7 and ffmpeg ready to use. Example:
    
    docker run --rm -it -v $PWD:/srv valian/docker-python-opencv-ffmpeg python
    >>> import cv2; cv2.VideoCapture('/srv/example.mp4').read()
    # truncated for transparency
    (True, array([[[ 46, 112, 104], ...]], dtype=uint8))
