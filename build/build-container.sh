mv job-deployement/lib/python3.6/site-packages/* libs/
pwd
ls -l
cd libs && zip -x main.py -r "../container/libs.zip"  .
cd ../../src/  && zip -x main.py --exclude = "*libs*" -r "../container/jobs.zip"  .
cp main.py ../container/
cd ../container && zip -r "../deploymentContainer_"$1".zip" .
rm -rf ../container ../build/job-deployement ../build/libs/
ls -l
