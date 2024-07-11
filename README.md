# Vita Hello World Docker
A simple Hello World application for the Vita, build with VitaSDK via Docker.


## Why?
While setting up VitaSDK manually isn't that difficult, doing it via Docker should lower the barrier to entry even further.

This repository contains the Hello World C++ example from VitaSDK as a proof of concept.


## Setup
To get started with this example, simply follow these steps.

### Copy the example `vita.env` file
We first want to create the environment file that we will then use inside the container, this file contains information about your Vita console.

An `vita.env.example` file has been provided, so you only have to make a copy of it and fill it in.

Store the environment file as `vita.env`, this way it should be picked up by our container later on.

### Fill in the `vita.env` file
Now that you have an Vita environment file, we can enter information about our Vita console.

> [!TIP]
> It's recommended that you assign a static IP address to your Vita console.

### Install the Vita Companion plugin
To use the `build-and-test-app.sh` script, your Vita also needs to have the [Vita Companion plugin](https://github.com/Ibrahim778/vitacompanion) installed.

Simply follow the steps on their GitHub page.

> [!NOTE]
> This is a fork of [devnoname120's Vita Companion](https://github.com/devnoname120/vitacompanion) that also allows installing VPK files remotely.

> [!TIP]
> Don't forget to also enable the "CMD/FTP Servers" option in the quick start menu, as otherwise you won't be able to connect to your Vita.

### Start the container
We should now be ready to start the container!

You can start it using `docker compose up -d`, it should automatically build the image if it's the first time.

> [!TIP]
> If you need to rebuild the image, you can add `--build` at the end of the command.

### Create `Intellisense-src` directory (Recommended)
While this step is optional, it is highly recommended to make the development experience a lot easier.

> [!NOTE]
> In this example we will be using VS Code, but this likely will also work for other IDE's.

First, install the "C/C++" extension from Microsoft.
This can be installed by pressing CTRL + P, and then running `ext install ms-vscode.cpptools`.

> [!TIP]
> If you can't find the extension, you might be running an unofficial build of VS Code that doesn't have Microsoft extensions.
>
> You can install the extension manually by downloading the [.vsix file straight from Microsoft's website](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools).

Once you have the extension installed, simply run `./configure-intellisense.sh` in a terminal on your host to copy the relevant files to your host machine.

Your editor should now be able to find the sources and provide you with proper Intellisense.



## Building + Testing
First, enter the Bash shell of the contain with `docker compose exec builder bash`.

You should now be inside the `/src` directory, in which is the source code of our application and 2 scripts.

If you only want to compile the application, simply run `./build-app.sh` to receive the application in vpk form, which you can then copy to the Vita manually.

If you also want to transfer it to your Vita console over the network with Vita Companion, run `./build-and-test-app.sh` instead.
This should automatically transfer, install and run the application.
