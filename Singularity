BootStrap: docker
From: r-base

%post
        apt-get update
	apt-get install sudo
	sudo apt-get install -y git
	sudo apt-get install -y curl
	sudo apt-get install -y wget
	echo 'install.packages(c("ggplot2",  "RColorBrewer", "plotrix", "readr", "RISmed", "stringr", "igraph"), repos="http://cran.us.r-project.org", dependencies=TRUE)' > /tmp/packages.R \
&& Rscript /tmp/packages.R

%environment
        export PATH=/:$PATH

## Singularity file created during NSF Cyber Carpentry 2018 project. This container has linux and R so far.

