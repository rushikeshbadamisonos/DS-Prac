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
                sh 'python3 -m venv job-deployement'
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
