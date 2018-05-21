source job-deployement/bin/activate
requirement="src/jobs/"$1"/Config/requirements.txt"
while IFS= read -r dependency
do
  pip3 install --user requests $dependency
done < "$requirement"
mkdir libs
mkdir container
mv job-deployement/lib/python3.6/site-packages/* libs/
cd libs && zip -x main.py -r "container/libs.zip"  .

cd ../../src/  && zip -x main.py --exclude = "*libs*" -r "../container/jobs.zip"  .
cp main.py ../container/
cd ../container && zip -r "../deploymentContainer_"$1".zip" .
rm -rf ../container ../build/job-deployement ../build/libs/
ls -l
