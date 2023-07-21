#!/bin/sh

input=$1

prechecks() {
	echo "Welcome to dockerized solution for building mkdocs"

	if [ `whoami` != 'root' ];then
	    echo "Please run this script as root user"
	    exit 1
	fi

	if [ -d "mkdocs_project" ]; then
	   echo "Required directory exists..."
	else
	   echo "INFO: Creating directory"	 
	   mkdir mkdocs_project	
	fi

	if [ -x "$(command -v docker)" ]; then
	    echo "INFO: Found Docker installation, proceeding.."
	else
	    echo "Please Install docker and try again"
	fi
}

build() {
	echo "INFO: Bulding the dokcer image..."

	sudo docker build -t mkdocs:v1.0.0 .
}

produce() {
	docker run -it --rm -v $PWD:/docs -w /docs/mkdocs_project -u $(id -u ${USER}):$(id -g ${USER}) mkdocs:v1.0.0 produce
	echo "INFO: Site produced successfully, generated site tar file can also be hosted in any webserver"
}


serve() {
	echo "INFO: Starting mkdocs server on 8000 port.."
  	docker run -it --rm -v $PWD:/docs -w /docs/mkdocs_project -p 8000:8000 -u $(id -u ${USER}):$(id -g ${USER}) mkdocs:v1.0.0 serve
}


case "$input" in
    #case 1 - printing the required info, which is default option
    "help")
    	echo """
   	This automated script is used to build and host mkdocs site
   	Use this script as below..
   
   	To produce and serve (without passing any argument, this method automate build and serve)
   	sudo sh ./mkdockerize.sh
   
   	produce only
   	sudo sh ./mkdockerize.sh produce
   
   	serve only 
   	sudo sh ./mkdockerize.sh serve
	   """
	   ;;

   "produce")
   	prechecks
   	produce
   	;;
   
   "serve")
   	prechecks
   	serve
   	;;
   *)
   	prechecks
   	build
   	produce
   	serve
      ;;	
esac
