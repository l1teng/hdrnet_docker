# docker run -itd --name hdrnet0 --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0,1 --shm-size 8g nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04

LABEL maintainer="tengli.terry+dev@gmail.com"

# ENV TZ
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda-8.0/lib64:/usr/local/cuda-8.0/lib64:/usr/local/cuda-8.0/extras/CUPTI/lib64:/usr/local/cuda/lib64
ENV PATH $PATH:/usr/local/cuda/bin:$HOME/bin

# install dependences
ADD sources.list /etc/apt
# TODL: enhance
RUN mv /etc/apt/sources.list.d /etc/apt/sources.list.d.ori && apt update && apt install git python-pip python-dev -y && rm -rf /var/lib/apt/lists/*

# >>> python dependences >>>
ADD py_pkgs/Werkzeug-0.11.10.tar.gz /root/
WORKDIR /root/Werkzeug-0.11.10
RUN python setup.py install && cd .. && rm -rf /root/Werkzeug-0.11.10

# ADD py_pkgs/mock-3.0.0.tar.gz /root/
# WORKDIR /root/mock-3.0.0
# RUN python setup.py install && cd .. && rm -rf /root/mock-3.0.0

ADD py_pkgs/numpy-1.12.0.tar.gz /root/
WORKDIR /root/numpy-1.12.0
RUN python setup.py install && cd .. && rm -rf /root/numpy-1.12.0

# install before pytest
ADD py_pkgs/setuptools-19.0.tar.gz /root/
WORKDIR /root/setuptools-19.0
RUN python setup.py install && cd .. && rm -rf /root/setuptools-19.0
ADD py_pkgs/setuptools_scm-1.16.0.tar.gz /root/
WORKDIR /root/setuptools_scm-1.16.0
RUN python setup.py install && cd .. && rm -rf /root/setuptools_scm-1.16.0
ADD py_pkgs/py-1.10.0.tar.gz /root/
WORKDIR /root/py-1.10.0
RUN python setup.py install && cd .. && rm -rf /root/py-1.10.0

ADD py_pkgs/pytest-3.0.0.tar.gz /root/
WORKDIR /root/pytest-3.0.0
RUN python setup.py install && cd .. && rm -rf /root/pytest-3.0.0

# install before scikit-image
ADD py_pkgs/Cython-0.16.tar.gz /root/
WORKDIR /root/Cython-0.16
RUN python setup.py install && cd .. && rm -rf /root/Cython-0.16

ADD py_pkgs/scikit-image-0.7.2.tar.gz /root/
WORKDIR /root/scikit-image-0.7.2
RUN python setup.py install && cd .. && rm -rf /root/scikit-image-0.7.2

ADD py_pkgs/scipy-0.15.0.tar.gz /root/
ADD sources.list /etc/apt
WORKDIR /root/scipy-0.15.0 
RUN apt update && apt install gfortran libopenblas-dev liblapack-dev -y && rm -rf /var/lib/apt/lists/* && python setup.py install && cd .. && rm -rf /root/scipy-0.15.0

# ADD py_pkgs/skimage-0.0.tar.gz /root/

WORKDIR /root
Add py_pkgs/tensorflow_gpu-1.1.0-cp27-none-linux_x86_64.whl /root
RUN pip install -i http://mirrors.aliyun.com/pypi/simple/ tensorflow_gpu-1.1.0-cp27-none-linux_x86_64.whl && rm tensorflow_gpu-1.1.0-cp27-none-linux_x86_64.whl
RUN pip install -i http://mirrors.aliyun.com/pypi/simple/ tensorflow-gpu==1.1.0 setproctitle==1.1.10 pyglib==0.1 python_gflags==3.1.1 python_magic==0.4.13 mock==0.5.0 protobuf==3.17.3

ADD sources.list /etc/apt
RUN apt update && apt install libglew-dev freeglut3-dev pkg-config libopencv-dev python-opencv libgflags-dev -y && rm -rf /var/lib/apt/lists/*

# https://github.com/mgharbi/hdrnet_legacy/issues/10
ADD ltensorflow/tf.tar.gz /usr/local/include/
ADD ltensorflow/lib.tar.gz  /usr/local/

# clone the source code repo
# RUN git clone https://github.com/litun5315/hdrnet_legacy.git hdrnet
# or
# ADD https://github.com/litun5315/hdrnet_legacy/archive/refs/heads/master.zip /root/

WORKDIR /root

CMD ["/bin/bash"]
