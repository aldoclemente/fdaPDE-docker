### Install docker 

#### Windows user

##### Prerequisites: WSL (Windows Subsystem for Linux)

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

##### Docker installation

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

#### macOs user

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


#### Ubuntu user

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

### Miscellaneous
All the following commands can be run in a Linux or macOS terminal. If you are a Windows user, ensure you have successfully installed WSL and Docker as explained in the Installation section.   
To pull the image, run from terminal:
```
 docker pull aldoclemente/fdapde-docker
```

To start a temporary container, run from terminal:
```
 docker run --rm -ti aldoclemente/fdapde-docker 
```

To mount the directory `<dir>`, run from terminal:
```
 docker run --name=tmp-container -v $(pwd)/../<dir>:/root/<dir> --rm -ti aldoclemente/fdapde-docker /bin/bash
```
Note that the running container is removed once the session ends, i.e., after running `exit` from terminal.

In the following, assume you have forked `fdaPDE-cpp` and developed a new, fancy model. 
Once inside the docker container, you can run the tests as follows:
```
cd 
cd <dir>/test/
./run_test.sh
```

You can also implement your own C++ `script`. Assuming you have a `<dir>/test/script/`, which contains all the scripts you've implemented, to compile a specific script, run the following command:
```
g++ -o script script.cpp -I../../ -I../../fdaPDE/core/ -I/usr/include/eigen3 -O2 -std=c++20 -g -march=native -DFDAPDE_NO_DEBUG
```
Note the three -I include paths. If you've forked `fdaPDE-core`, omit the `-I../../fdaPDE/core/` option in the above command to compile your script. Additionally, remember that every C++ script you implement must contain `#include<Eigen/Dense>` as well as the appropriate header files from the fdaPDE library. 
The Docker image also provides MPI support. To compile a script and run it in the container using MPI, use the following commands:
```
mpicxx -o output script.cpp -I../../ -I../../fdaPDE/core/ -I/usr/include/eigen3 -O2 -std=c++20 -g -march=native -DFDAPDE_NO_DEBUG
mpiexec --allow-run-as-root -n <processes> ./script
```

