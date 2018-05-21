pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                label "ansible"
            }

            steps {
                echo "Building....."
                sh 'rm -rf job-deployement libs lib container'
                sh 'virtualenv  job-deployement --no-site-packages'
                sh 'mkdir libs container'
                sh '''
                source job-deployement/bin/activate
                requirement="src/jobs/"wordcount"/Config/requirements.txt"
                while IFS= read -r dependency
                do
                  pip install --ignore-installed --user $dependency
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
