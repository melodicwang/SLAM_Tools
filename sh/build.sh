#!/bin/sh

#This sh file is built for building a project.


if test -d build
then
	echo "The build directory is already exist."
	echo "Deleting it now ..."
	rm -r build
else
	echo "The build directory is not exist."
fi


echo "Building the build directory ..."
mkdir build
echo "The build directory is built now."

cd build/
echo "Now we are in the build/ ..."


echo "cmake .. ing..."
cmake ..
echo "cmake .. is done."

echo "make -j12 ing..."
make -j12
echo "make -j12 is done."


echo "Deleting the build directory ..."
cd ..
rm -r build


if test ! -d build
then 
	echo "The build directory is deleted now."
fi

