python3 -m venv job-deployement
rm -rf job-deployement
rm -rf lib
python3 -m venv job-deployement
source job-deployement/bin/activate
#requirement="requirement.txt"
while IFS= read -r dependency
do
  pip3 install requests $dependency
done < "$requirement"
mkdir lib
mv job-deployement/lib/python3.6/site-packages/* lib/
