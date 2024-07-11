# Vita Hello World Docker
A simple Hello World application for the Vita, build with VitaSDK via Docker.


## Why?
While setting up VitaSDK manually isn't that difficult, doing it via Docker should lower the barrier to entry even further.

This repository contains the Hello World C++ example from VitaSDK as a proof of concept.


## Setup
To get started with this example, simply follow these steps.

### Copy the example `.env` file
We first want to create the environment file that we will then use inside the container.

An `.env.example` file has been provided, so you only have to make a copy of it and fill it in.

Store the environment file as `.env`, this way it should be picked up by our container later on.

### Fill in the `.env` file
Now that you have an environment file, we can enter our Vita console's IP address so we can transfer it later on and where to transfer the VPK to.

> [!TIP]
> It's recommended that you assign a static IP address to your Vita console.

### Install the Vita Companion plugin
To use the `build-and-test-app.sh` script, your Vita also needs to have the [Vita Companion plugin](https://github.com/devnoname120/vitacompanion) installed.

Simply follow the steps on their GitHub page.

### Start the container
We should now be ready to start the container!

You can start it using `docker compose up -d`, it should automatically build the image if it's the first time.

> [!TIP]
> If you need to rebuild the image, you can add `--build` at the end of the command.



## Building + Testing
First, enter the Bash shell of the contain with `docker compose exec builder bash`.

You should now be inside the `/src` directory, in which is the source code of our application and 2 scripts.

If you only want to compile the application, simply run `./build-app.sh` to receive the application in vpk form, which you can then copy to the Vita manually.

If you also want to transfer it to your Vita console over the network with Vita Companion, run `./build-and-test-app.sh` instead.
This should automatically transfer, install and run the application.
