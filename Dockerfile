FROM r-base

MAINTAINER Cavatica2 - Anuja Majmundar, Jocelyn Colella, Gaurav Kandoi

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y libwww-perl
RUN apt-get install -y git
RUN echo 'install.packages(c("ggplot2",  "RColorBrewer", "plotrix", "readr", "RISmed", "stringr", "igraph"), repos="http://cran.us.r-project.org", dependencies=TRUE)' > /tmp/packages.R \
&& Rscript /tmp/packages.R
RUN git clone https://github.com/Cavatica2/cavatica.git
	#in docker this clones the entire repo into the root ('/') directory

WORKDIR /cavatica/data/output
        #we have to run the script.sh form the test folder because that's where the config.txt file is

ENTRYPOINT ln -sf /cavatica/data/test/*.tsv . \
	&& ../../code/script.sh \
	&& find /cavatica/data/output -type l | xargs rm
        	#wizardy by Julian - removes the useless *.tsv files
        	#not completely necessary, but good housekeeping

ENV PATH=/:$PATH