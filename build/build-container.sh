#!/bin/sh
source job-deployement/bin/activate

requirement="src/jobs/"wordcount"/Config/requirements.txt"
while IFS= read -r dependency
do
  pip install --ignore-installed --user $dependency
  done < "$requirement"
cd job-deployement/lib/
ls -l
