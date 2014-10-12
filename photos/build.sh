#!/bin/bash

if [ -d thumbnails ] ; then
  rm -rf thumbnails
fi
mkdir thumbnails

cat _head > index.html

pushd photos

for i in * ; do
  echo $i
  convert -scale 200x200 $i ../thumbnails/$i
  echo "    <div class=\"thumbnail\"><a href=\"photos/$i\"><img src=\"thumbnails/$i\" /></a></div>" >> ../index.html
done

popd

cat _tail >> index.html
