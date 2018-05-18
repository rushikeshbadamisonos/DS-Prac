pipeline {
    agent none
    stages {

        stage('Build') {
            agent {
                label "python"
            }
            steps {
                echo "Building....."
                sh './build/build-container.sh wordcount'
            }
        }
        stage('Deploy') {
            agent {
              label "ansible"
            }
            steps {
              echo 'Testing ...'
              sh 'rm -rf job-deployement'

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
