### fdaPDE Docker Environment

This docker image provides an environment for compiling and running the C++ library [fdaPDE-cpp](https://github.com/fdaPDE/fdaPDE-cpp) or its [core](https://github.com/fdaPDE/fdaPDE-core).    

```
docker pull aldoclemente/fdapde-docker:latest
```

#### Getting started

##### Cloning the repository 
Assume you have cloned [fdaPDE-cpp](https://github.com/fdaPDE/fdaPDE-cpp) repository into a directory `<dir>` on your host machine.

##### Mounting the directory
To test or develop within the Docker container, you need to mount `<dir>`. Run the following command from the terminal, ensuring your current working directory is `<dir>`:
```
 docker run --rm -v $(pwd)/../<dir>:/root/<dir> -ti aldoclemente/fdapde-docker /bin/bash
```
*Notes*

 * The `-v` parameter flags the absolute path to `<dir>` on your host machine to `root/<dir>` in the container.
	
* You can modify files in `<dir>` using your favorite text editor on the host machine while the container is running.

* The container is automatically removed once the session ends (i.e., after you run `exit` in the terminal).
 
##### Running Tests
Once inside the docker container, you can run the library's predefined tests as follows:
```
cd 
cd <dir>/test/
./run_test.sh
```

##### Developing and compiling your own scripts
To compile a custom C++ script inside the container, use the following command:
```
g++ -o script script.cpp -I/path/to/<dir> -I/path/to/<dir>/fdaPDE/core/ -I/usr/include/eigen3 -O2 -std=c++20 -g -march=native -DFDAPDE_NO_DEBUG
```

Ensure that every custom script contains `#include<Eigen/Dense>` along with other necessary headers from the `fdaPDE` library. 

##### MPI support
The Docker image also provides MPI support for parallel computing with MPI. To compile a script with MPI support, use the following command:
```
mpicxx -o output script.cpp -I/path/to/<dir>/ -I/path/to/<dir>/fdaPDE/core/ -I/usr/include/eigen3 -O2 -std=c++20 -g -march=native -DFDAPDE_NO_DEBUG
```
To execute the compiled script using MPI, run:
```
mpiexec --allow-run-as-root -np <processes> ./script
```
*Notes*

* Replace `<processes>` with the desired number of processes.

* `--allow-run-as-root` flag is required to run MPI as root inside the Docker container.

##### heaptrack support
The Docker image includes the memory profiler [heaptrack](https://github.com/KDE/heaptrack), which allows you to analyze the memory usage of your executables.

To use heaptrack inside the container while enabling graphical output, run:
```
xhost +local:docker
docker run --rm -v $(pwd)/../<dir>:/root/<dir> \ 
	-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \ 
	-ti aldoclemente/fdapde-docker /bin/bash
```
*Notes*

 * The `-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY` options allow graphical output. 
 
 * Users on Wayland may need alternative setup (e.g., `XDG_RUNTIME_DIR` and `WAYLAND_DISPLAY` environment variables).

Once inside the container, compile your C++ script as explained in the previous section. 
Then, run heaptrack as follows:

```
heaptrack ./<exec>
``` 

This command generates a compressed `.zst` file containing the profiling data. 
The GUI will also attempt to launch automatically.
If the GUI does not launch immediately or if you prefer to analyze the data later, you can manually open the report using:

```
heaptrack_gui <exec>.zst
```

After closing the container, restore X server permissions by running:
```
xhost -local:docker
```
