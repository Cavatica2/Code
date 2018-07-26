# Readme

We've built singularity and docker containers to run the cavatica pipeline. More information on cavatica can be found here: https://github.com/incertae-sedis/cavatica

## Singularity Container

The container contains two apps, one to run cavatica which queries pubmed and pubmed central while the second one runs the mango graph studio GUI. The GUI might not display the networks and we are still trying to fix that.

### How to obtain the singularity image

To install singularity on your system, please follow the instructions provided by singularity: http://singularity.lbl.gov/docs-installation

```
# To download the singularity image from singularity hub please use one of the following commands:

singularity pull shub://Cavatica2/Code
singularity pull --name customname.img shub://Cavatica2/Code	# to give the image a custom name, please replace the customname.img to the desired name.
singularity pull --commit shub://Cavatica2/Code
singularity pull --hash shub://Cavatica2/Code
```

```
# Build locally using the singularity recipe file. It might take a while to build the singularity image.

wget https://raw.githubusercontent.com/Cavatica2/Code/master/Singularity
sudo singularity build mango.simg Singularity
```

### Run cavatica using user defined search words

```
mkdir output
echo "Your Search Term 1" >> output/config.txt
echo "Your Search Term 2" >> output/config.txt
echo "Your Search Term 3" >> output/config.txt
singularity run --app cavatica --bind output:/cavatica/data/output mango.simg
```

## Run mango graph studio to visualize results from cavatica

```
singularity run --app mango --bind output:/cavatica/data/output mango.simg

# This should pop-up the mango GUI depending on the capabilities of the user's local environment.
# Once the mango GUI pops up, follow the following based on the original instructions found on the cavatica readme.

Go to file --> run gel script
Select the pubmed.gel or pmc.gel from the 'output' folder
This should load the author graphs from your search query terms.
Double click the graph names from the left panel to load the networks.
```


## Docker Container

The container runs cavatica which queries pubmed and pubmed central.

### How to obtain the docker image

To install docker on your system, please follow the instructions provided by docker: https://docs.docker.com/install/

```
# Download the docker image from docker hub

docker pull gkandoi/cavatica
```

```
# Build locally using the dockerfile

wget https://raw.githubusercontent.com/Cavatica2/Code/master/Dockerfile

* Add sudo used group to docker with my username
sudo usermod -aG docker {username}
    - Replace {username} with your username...

* Build docker image
sudo docker build -t cavatica .
    - t = tags it with the name 'cavatica'
```

### Run cavatica using user defined search words

```
echo "Your Search Term 1" >> config.txt
echo "Your Search Term 2" >> config.txt
echo "Your Search Term 3" >> config.txt

* Run docker image
docker run -v `pwd`:/cavatica/data/output cavatica

    * To run interactively:
	docker run -v `pwd`:/cavatica/data/output -it cavatica
    * To run a bash shell in our docker environment:
    docker run -v `pwd`:/cavatica/data/output -it cavatica bash
```