Varnish with Docker
===========

### Varnish environment variables
Varnish will use the following environment variables. You can override them if you want

	VARNISH_PORT 80

### Build the image
To build the image run:

	docker build -t varnish git://github.com/dockerimages/docker-varnish

### Start the container
To run the container you need to link the containers you want to run behind the load balancer that Varnish will create.
Varnish will detect all the node containers you pass and add them to the load balancer, we do this with the "parse" file. The only requirement is that when you link your containers you use the name "nodeN". Example: --link container_name:node1 --link container_name2:node2. This command will also map the port 80 inside the Varnish container to the port 8080 in your host so you can access the node application at http://localhost:8080

	$ sudo docker run -itd -p 8080:80 --link container_name:node1 --link container_name2:node2 yourname/varnish 

#### Bash into the container
If you want to bash into the container you can, just do: 

	$ sudo docker run -itd -p 8080:80 --link container_name:node1 --link container_name2:node2 yourname/varnish bash

