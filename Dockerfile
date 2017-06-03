FROM ubuntu:16.10

#2.7
ENV PYTHON_VERSION 2.7

# Install OpenCV 3.0
RUN apt-get -y update && apt-get -y install python$PYTHON_VERSION-dev wget unzip \
    build-essential cmake git pkg-config libatlas-base-dev gfortran \
    libjasper-dev libgtk2.0-dev libavcodec-dev libavformat-dev \
    libswscale-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libv4l-dev \
    && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && pip install numpy matplotlib \
    && wget https://github.com/Itseez/opencv/archive/3.2.0.zip -O opencv3.zip \
    && unzip -q opencv3.zip && mv /opencv-3.2.0 /opencv && rm opencv3.zip \
    && wget https://github.com/Itseez/opencv_contrib/archive/3.2.0.zip -O opencv_contrib3.zip \
    && unzip -q opencv_contrib3.zip && mv /opencv_contrib-3.2.0 /opencv_contrib && rm opencv_contrib3.zip \

    # prepare build
    && mkdir /opencv/build && cd /opencv/build \
    && cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D BUILD_PYTHON_SUPPORT=ON \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=OFF \
      -D INSTALL_PYTHON_EXAMPLES=OFF \
      -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON \
      -D BUILD_NEW_PYTHON_SUPPORT=ON \
      -D WITH_IPP=OFF \
      -D WITH_FFMPEG=ON \
      -D WITH_V4L=ON .. \

    # install
    && cd /opencv/build && make -j$(nproc) && make install && ldconfig

    #clean
RUN apt-get -y remove build-essential cmake git pkg-config libatlas-base-dev gfortran \
    libjasper-dev libgtk2.0-dev libavcodec-dev libavformat-dev \
    libswscale-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libv4l-dev \
    && apt-get clean \
    && rm -rf /opencv /opencv_contrib /var/lib/apt/lists/*

# Define default command.
CMD ["bash"]
