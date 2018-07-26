# Readme

We've built a singularity container to run the cavatica pipeline. More information on cavatica can be found here: https://github.com/incertae-sedis/cavatica

The container contains two apps, one to run cavatica which queries pubmed and pubmed central while the second one runs the mango graph studio GUI.

## How to obtain the singularity image

To install singularity on your system, please follow the instructions provided by singularity: http://singularity.lbl.gov/docs-installation

```
# Download the singularity image from singularity hub

singularity pull shub://
```

```
# Build using the singularity recipe file

wget https://raw.githubusercontent.com/Cavatica2/Code/master/Singularity
sudo singularity build mango.simg Singularity
```

## Run cavatica using user defined search words

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