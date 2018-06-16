# Homebridge-Docker

Docker image for Homebrigde by nfarina

For details see https://github.com/nfarina/homebridge

This is simply wrapping the source in a runnable Docker image for everyone that cannot install the dev environment on his machine or everyone that wants a simple containerized solution.

## Configuration

Copy `config-sample.json` to `config.json` and adapt to your likings as per normal homebridge config.
To install packages I'm now using yarn and a `package.json` file. Check out the included one for an example.

The container will wait for a `config.json` file and `package.json` file before attempting to start up homebridge. This can come in handy if homebridge is crashing instantly due to a misconfigured plugin, simply rename one of the files and then attach to the docker container to debug.
