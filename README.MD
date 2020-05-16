# typescript-node-starter
A starter Template for Nodejs project with Docker build and Docker development workflow

## Prerequisites
1. docker
2. docker-compose

## Getting started

    touch debug.env
    docker-compose up --build
    // modify index.ts, and watch the application recompiles and restarts

## Usage
Clone this repository. To have a clean history remove the .git directory and initialise .git (optional)

    git clone https://github.com/ragulmathawa/typescript-node-starter.git && rm -rf typescript-node-starter/.git

### Debugging
1. Create debug.env & fill in required environment variables
2. Use docker-compose to start a debug container and run typescript application in watch mode
    `docker-compose up --build`

    `--build` - to build debug image when ever you change the package.json dependencies
3. VS Code Debugger - create a new tasks configuration in VSCode debugger as below

```json
    // Open debuggger and click Open Launch.json in debug panel (Gear icon)
    {
        "type": "node",
        "request": "attach",
        "name": "Docker: Attach to Node",
        "remoteRoot": "/usr/src/app",
        "port": 9232
    }        
```
##### Note:
* If you have multiple app to debug at same time, you can modify the port in docker-compose.yml as well as tasks.json to unused port