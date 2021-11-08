# [hdrnet](https://groups.csail.mit.edu/graphics/hdrnet/)_[docker](https://docker.com/)

Intorduction: Docker image for [hdrnet](https://groups.csail.mit.edu/graphics/hdrnet/) runtime environment.

## Usage

Let begin with building docker image offline, 

1. Prepare dependence files, download and them to the root directory.

- [ltensorflow](https://github.com/litun5315/hdrnet_docker/releases/download/v0.0/ltensorflow.tar.gz), tensorflow lib files.
-  [py_pkgs](https://github.com/litun5315/hdrnet_docker/releases/download/v0.0/py_pkgs.tar.gz), python packages source file.

Then, your file structure may like this, 

```
.
├── build_image.sh
├── Dockerfile
├── Dockerfile_online
├── hdrnet
├── launch_container.sh
├── LICENSE
├── ltensorflow
├── py_pkgs
└── sources.list

```

2. Build docker image.

```
sh build_image.sh
```

3. Launch docker container.

```
sh launch_container.sh
```

4. Put into the [source code](https://github.com/litun5315/hdrnet_legacy/archive/refs/heads/master.zip) the launched container.
