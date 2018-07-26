BootStrap: docker
From: r-base

%post
		apt-get update
		apt-get install sudo
		sudo apt-get install -y git
		sudo apt-get install -y curl
		sudo apt-get install -y wget
		sudo apt-get install -y libwww-perl
		sudo apt-get install -y libglu1-mesa
		sudo apt-get install -y libgtk2.0-0
		wget http://ftp.us.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.49-1+deb7u2_amd64.deb
		sudo apt-get install -y ./libpng12-0_1.2.49-1+deb7u2_amd64.deb
		echo 'install.packages(c("ggplot2",  "RColorBrewer", "plotrix", "readr", "RISmed", "stringr", "igraph"), repos="http://cran.us.r-project.org", dependencies=TRUE)' > /tmp/packages.R \
&& Rscript /tmp/packages.R
		git clone https://github.com/incertae-sedis/cavatica.git
		git clone 

%apprun cavatica
		cd /cavatica/data/output
		ln -s ../test/*.tsv .
		../../code/script.sh
		find /cavatica/data/output -type l | xargs rm

%runscript
		cd ~

%environment
		export PATH=/:$PATH
