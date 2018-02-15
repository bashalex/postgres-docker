## Starting Development

**Setup your Docker environment**

This project uses docker infrastructure.
Make sure that you installed:
 1. `docker`
 2. `docker-compose`
 3. `docker-machine`

- Create a new development virtual machine with `docker-machine create hse.postgres.dev`. This will help isolate your docker env from your host pc.
- Run `eval $(docker-machine env hse.postgres.dev)` to connect docker to this virtual machine in your terminal. You will need to repeat this in any new terminal tab.
- If you're not on macOS, you will probably need to manually mount your local code directory to your VM as a shared folder.
 This will allow it to be mounted to the containers at run time:
  `VBoxManage sharedfolder add hse.postgres.dev --name $(pwd)/postgres --hostpath $(pwd)/postgres/ --automount`. Make sure to stop your docker machine (`docker-machine stop hse.postgres.dev`) before executing this command. As soon as the command is executed, run your docker machine again using `docker-machine start hse.postgres.dev`.

**Run the project**

- Run `docker build -t postgres .` to build the project's container. It may take ages.
- Run `docker run --name postgres postgres` to run the container.

In a new terminal tab you can connect to the postgresql server using `docker exec -it postgres psql`. Don't forget to connect your terminal tab to the docker machine in a new tab first executing `eval $(docker-machine env hse.postgres.dev)`.
