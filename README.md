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

#### Install docker 

##### Windows user

###### Prerequisites: WSL (Windows Subsystem for Linux)

1. Enable virtualization in BIOS:
 - Restart your computer and enter the BIOS setup. This is usually done by pressing a key during startup, such as F2, F10, Del, or Esc (the key varies by manufacturer).
 - Find the setting for virtualization (it might be called Intel VT-x, AMD-V, or something similar) and enable it.
 - Save the changes and exit the BIOS setup.

2. Open a command propt as administrator:
 - Search for "Command Prompt" in the Start menu.
 - Right-click on "Command Prompt" and select "Run as Administrator."

3. Run the following command from the command propt:
	```
	 wsl --install --distribution Ubuntu
	``` 
This command will install Windows Subsystem for Linux (WSL) and the Ubuntu distribution.

4. Reboot and Set Up Ubuntu:
 - After the installation completes, you may need to restart your computer.
 - On first launch, WSL will prompt you to create a new user account for Ubuntu. Follow the prompts to set up a username and password.

5. Check the Version of WSL:
- run from a command propt:
	```
	 wsl --version
	```

###### Docker installation

1. Prerequisites:
 - Ensure you have installed WSL version 2 and a Linux distribution (refer to the previous section for detailed instructions).
 
2. Download Docker for Desktop:
 - Download the Docker Desktop installer from the Docker website. You can find it [here](https://www.docker.com/). 
 
3. Install Docker for Desktop:
 - Run the downloaded executable to install Docker Desktop.
 - Follow the installation prompts to complete the setup.
 
4. Configure Docker:
 - Once the installation is complete, open Docker Desktop.
 - You will need to log in with your Docker account. If you don't have one, you can create it on the Docker website.
 - Open Docker Desktop, go to Settings (the gear icon), then navigate to `Resources` -> `WSL Integration`.
 - Ensure that WSL integration is enabled and check all your installed Linux distributions.

5. Reboot Your Machine:
 - After configuring Docker, reboot your machine to ensure all settings take effect.
 
6. Verify Installation:
 - Open a command propt.
 - Run the following command to enter your WSL environment:
    ```
     wsl
    ```
 - Once in the WSL terminal, check the Docker version by running:
    ```
 	 docker --version 
 	```
 	This command should display the installed Docker version, confirming that Docker is correctly set up.
7. Use Docker:
 - Now, you can use Docker in your WSL environment. For example, you can pull and run Docker images. Go to the Miscellaneous section and enjoy fdapde-docker image.

##### macOs user

1. Install Homebrew:
 - Run from a terminal:
    ```
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	```
2. Download and install Docker:
 - Run from a terminal:
	```
  	 brew install --cask docker
	```
3. Configure Docker:
 - Once the installation is complete, open Docker Desktop.
 	```
	 open /Applications/Docker.app
	```
 - You will need to log in with your Docker account. If you don't have one, you can create it on the Docker website.
 - Open Docker Desktop, go to Settings (the gear icon), then navigate to `Resources` -> `WSL Integration`.
 - Ensure that WSL integration is enabled and check all your installed Linux distributions.

4. Reboot Your Machine:
 - After configuring Docker, reboot your machine to ensure all settings take effect.

5. Use Docker:
 - Now, you can use Docker. For example, you can pull and run Docker images. Go to the Miscellaneous section and enjoy fdapde-docker image.


##### Ubuntu user

1. Download and install Docker:
 - Run from a terminal:
	```
  	 sudo apt-get install -y docker.io
  	 sudo usermod -aG docker $USER 
	```
2. Reboot Your Machine:
 - After configuring Docker, reboot your machine to ensure all settings take effect.


3. Configure Docker:
 - Once the installation is complete, open Docker Desktop.
 	```
	 docker login
	```
 - You will need to log in with your Docker account. If you don't have one, you can create it on the Docker website.

4. Use Docker:
 - Now, you can use Docker. For example, you can pull and run Docker images. Go to the Miscellaneous section and enjoy fdapde-docker image.

