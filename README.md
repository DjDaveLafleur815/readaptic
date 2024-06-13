# Readaptic

## How To Install

### Clone the projet

``` 
git clone https://github.com/DjDaveLafleur815/readaptic.git
```

### Move Command Prompt on target folder

```
cd readaptic
```
### Install Docker on Linux :

# 1. Add Docker's official GPG key:
```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

# 2. Add the repository to Apt sources:
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
### Run the following command :
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
### For MacOS and Windows, install Docker Desktop is the best way :

### MacOS users

1. Download the installer using the download buttons at the top of the page, or from the release notes.

2. Double-click Docker.dmg to open the installer, then drag the Docker icon to the Applications folder. By default, Docker Desktop is installed at /Applications/Docker.app.

3. Double-click Docker.app in the Applications folder to start Docker.

4. The Docker menu displays the Docker Subscription Service Agreement.

    Here’s a summary of the key points:

        Docker Desktop is free for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open source projects.
        Otherwise, it requires a paid subscription for professional use.
        Paid subscriptions are also required for government entities.
        Docker Pro, Team, and Business subscriptions include commercial use of Docker Desktop.

5. Select Accept to continue.

Note that Docker Desktop won't run if you do not agree to the terms. You can choose to accept the terms at a later date by opening Docker Desktop.

For more information, see Docker Desktop Subscription Service Agreement
. We recommend that you also read the FAQs

.

6. From the installation window, select either:

    Use recommended settings (Requires password). This let's Docker Desktop automatically set the necessary configuration settings.
    Use advanced settings. You can then set the location of the Docker CLI tools either in the system or user directory, enable the default Docker socket, and enable privileged port mapping. See Settings, for more information and how to set the location of the Docker CLI tools.

7. Select Finish. If you have applied any of the above configurations that require a password in step 6, enter your password to confirm your choice.


### Windows users

    1. Download the installer using the download button at the top of the page, or from the release notes.

    2. Double-click Docker Desktop Installer.exe to run the installer. By default, Docker Desktop is installed at C:\Program Files\Docker\Docker.

    3. When prompted, ensure the Use WSL 2 instead of Hyper-V option on the Configuration page is selected or not depending on your choice of backend.

    4. If your system only supports one of the two options, you will not be able to select which backend to use.

    5. Follow the instructions on the installation wizard to authorize the installer and proceed with the install.

    6. When the installation is successful, select Close to complete the installation process.

If your admin account is different to your user account, you must add the user to the docker-users group:

    1. Run Computer Management as an administrator.
    
    2. Navigate to Local Users and Groups > Groups > docker-users.

    3. Right-click to add the user to the group.

    4. Sign out and sign back in for the changes to take effect.

### Run the API after Docker installation

```
cd FastAPI

docker build -t fastapi . && docker run --rm -p 8081:8081 fastapi
```

### Install Flutter

### Checks your requirements

### For Linux users

```
which bash file mkdir rm which
/bin/bash
/usr/bin/file
/bin/mkdir
/bin/rm
which: shell built-in command
```
```
sudo apt-get update -y && sudo apt-get upgrade -y;
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa
```
```
sudo apt-get install \
    clang cmake git \
    ninja-build pkg-config \
    libgtk-3-dev liblzma-dev \
    libstdc++-12-dev
```

### For MacOS users

```
sudo softwareupdate --install-rosetta --agree-to-license
```

Download and install the following packages.

    Xcode 15 to debug and compile native Swift or ObjectiveC code. The Xcode installation includes Git 2.27 or later to manage source code.
    CocoaPods 1.13 to compile enable Flutter plugins in your native apps.

The developers of the preceding software provide support for those products. To troubleshoot installation issues, consult that product's documentation.

When you run the current version of flutter doctor, it might list a different version of one of these packages. If it does, install the version it recommends.

### For Windows users

Download and install the Windows version of the following packages:

    Git for Windows 2.27 or later to manage source code.
    Visual Studio 2022 to debug and compile native C++ Windows code. Make sure to install the Desktop development with C++ workload. This enables building Windows app including all of its default components. Visual Studio is an IDE separate from Visual Studio Code.

The developers of the preceding software provide support for those products. To troubleshoot installation issues, consult that product's documentation.

When you run the current version of flutter doctor, it might list a different version of one of these packages. If it does, install the version it recommends.


### Use VSCode to install Flutter SDK

1. Launch VS Code.

2. To open the Command Palette, press Control + Shift + P.

3. In the Command Palette, type flutter.

4. Select Flutter: New Project.

5. VS Code prompts you to locate the Flutter SDK on your computer.

    If you have the Flutter SDK installed, click Locate SDK.

    If you do not have the Flutter SDK installed, click Download SDK.

    This option sends you the Flutter install page if you have not installed Git as directed in the development tools prerequisites.

6. When prompted Which Flutter template?, ignore it. Press Esc. You can create a test project after checking your development setup.

7. When the Select Folder for Flutter SDK dialog displays, choose where you want to install Flutter.
    VS Code places you in your user profile to start. Choose a different location.

    Consider ~/development/

8. Click Clone Flutter.

    While downloading Flutter, VS Code displays this pop-up notification : "Downloading the Flutter SDK. This may take a few minutes."

    This download takes a few minutes. If you suspect that the download has hung, click Cancel then start the installation again.

9. Once it finishes downloading Flutter, the Output panel displays.
    "Checking Dart SDK version...
     Downloading Dart SDK from the Flutter engine ...
     Expanding downloaded archive..."

10. When successful, VS Code displays this pop-up notification : "Initializing the Flutter SDK. This may take a few minutes."

11. While initializing, the Output panel displays the following : 

    "Building flutter tool...
     Running pub upgrade...
     Resolving dependencies...
     Got dependencies.
     Downloading Material fonts...
     Downloading Gradle Wrapper...
     Downloading package sky_engine...
     Downloading flutter_patched_sdk tools...
     Downloading flutter_patched_sdk_product tools...
     Downloading windows-x64 tools...
     Downloading windows-x64/font-subset tools..."

12. This process also runs flutter doctor -v. At this point in the procedure, ignore this output. Flutter Doctor might show errors that don't apply to this quick start.

13. When the Flutter install succeeds, VS Code displays this pop-up notification : "Do you want to add the Flutter SDK to PATH so it's accessible
in external terminals?"

14. VS Code may display a Google Analytics notice.

    If you agree, click OK.

15. To enable flutter in all a shell windows:

    1. Close, then reopen all a shell windows.
    2. Restart VS Code.


### Run the following prompt
```
flutter doctor
flutter doctor -v
```

### Run the app interface after Docker installation
```
cd readaptic/app_interface

docker build -t app-interface . && docker run --rm -p 1200:1200 app-interface
```

### Run the Neo4j (make executable docker.sh before running it)
```
cd readaptic/neo4j
sudo ./docker.sh
```