### Install docker 
To install docker, run from terminal:
```
  sudo apt-get install -y docker.io
  sudo usermod -aG docker $USER
```

Finally, reboot your PC or run from terminal:
```
  sudo reboot
```

### Miscellaneous  
To pull the image, run from terminal:
```
    docker pull aldoclemente/fdapde-docker
```

To start a temporary contained, run from terminal:
```
   docker run --rm -ti aldoclemente/fdapde-docker 
```

To mount the directory `<dir>`, run from terminal:
```
    docker run --name=tmp-container -v $(pwd)/../<dir>:/root/<dir> --rm -ti $IMAGE 
```
Note that the running container is removed once the session ends, i.e., after running `exit`.
