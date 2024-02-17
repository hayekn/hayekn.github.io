#!/bin/bash

rm "../tex/$1/$2/$3"
ln "../../OneDrive - McGill University/School Documents/$1/$2/$3"  "../tex/$1/$2/$3"

git commit -am "refresh $3"
git push origin main

exit 0
