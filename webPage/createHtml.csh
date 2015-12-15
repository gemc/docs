#!/bin/csh -f


# This script will create the html documentation
# from the rst files

set version = 1.0
set author  = "Maurizio Ungaro"
set project = gemc



# remove previous dir and run sphinx-quickstart
#sphinx-quickstart --sep -q -p $project -a $author -v $version --ext-pngmath


# copy files to dir and compile
cp *.rst  Ungaro/source
cp default.css Ungaro/source/_static
cp default.css Ungaro/source/_
cp layout.html Ungaro/source/_templates
cp logo.png Ungaro/source/_static
cd Ungaro
make html
#
#cd ..
#rm -rf static
#cp -r Ungaro/build/html/_static static
#cp Ungaro/build/html/*.* .
#

#
#rm -rf Ungaro
#
## moving all references to static
#foreach f(`ls *.html`)
#	sed s/_static/static/ $f > tmp
#	mv tmp $f
#end
#
#echo Done. Optionally you can remove the page source reference at the bottom of index.html
