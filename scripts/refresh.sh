#!/bin/bash

GITREPO="/Users/nicholashayek/hayekn.github.io"
SCHOOLDOCS="/Users/nicholashayek/OneDrive - McGill University/School Documents" 

if test ! -d "$GITREPO/tex/$1/$2" ; then
  mkdir $GITREPO/tex/$1/$2
fi

rm "$GITREPO/tex/$1/$2/$3"

ln "$SCHOOLDOCS/$1/$2/$3"  "$GITREPO/tex/$1/$2/$3"

cd $GITREPO
git commit -am "refresh $3"
git push origin main

exit 0
