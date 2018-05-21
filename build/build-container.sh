#!/bin/sh
source job-deployement/bin/activate

requirement="src/jobs/"wordcount"/Config/requirements.txt"
while IFS= read -r dependency
do
  pip install --ignore-installed --user $dependency
  done < "$requirement"
  cd job-deployement/lib/python3.6/
ls -l
mv job-deployement/lib/python3.6/site-packages/* libs/
cd libs && zip -x main.py -r "../container/libs.zip"  .
cd ../src/  && zip -x main.py --exclude = "*libs*" -r "../container/jobs.zip"  .
cp main.py ../container/
cd ../container && zip -r "../deploymentContainer_"$1".zip" .
cd ..
cd libs
ls -l
