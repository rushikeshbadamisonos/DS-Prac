pipeline {
    agent none
    stages {

        stage('Build') {
            agent {
                label "python"
            }
            steps {
                echo "Building....."
                sh 'RUN apk update && apk add bash'
                sh 'rm -rf job-deployement libs lib container'
                sh 'virtualenv --no-site-packages job-deployement'
                sh 'mkdir libs container'
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
