pipeline {
    agent none
    stages {

        stage('Build') {
            agent {
                label "python"
            }
            steps {
                echo "Building....."

                sh 'rm -rf job-deployement libs lib container'
                sh 'virtualenv --no-site-packages job-deployement'
                sh 'mkdir libs container'
                sh '''

                  requirement="src/jobs/"wordcount"/Config/requirements.txt"
                  while IFS= read -r dependency
                  do
                    source job-deployement/bin/activate
                    pip3 install --user $dependency
                    done < "$requirement"
                  
                  '''
                sh './build/build-container.sh wordcount'


            }
        }
        stage('Deploy') {
            agent {
              label "ansible"
            }
            steps {
              echo 'Testing ...'
              sh 'ls -l'

            }
        }
        stage('Monitor') {
            agent {
              label "ansible"
            }
            steps {
                echo 'Deploying....'
            }
        }
    }
}
