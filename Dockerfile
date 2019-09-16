FROM ubuntu
RUN apt-get update 
RUN apt-get -y install apache2 
RUN apt-get -y install apache2-utils 
RUN apt-get -y install vim
RUN apt-get -y install lsb-release
RUN apt-get -y install wget 

RUN wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest_all.deb

RUN apt-get update

RUN apt-get -y install cvmfs cvmfs-server

RUN apt-get clean 

EXPOSE 80 
CMD [“apache2ctl”, “-D”, “FOREGROUND”]

