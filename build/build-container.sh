mv job-deployement/lib/python3.6/site-packages/* libs/
cd libs && zip -x main.py -r "../container/libs.zip"  .
ls -l
