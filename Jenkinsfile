pipeline {
    stages {
        stage('Build') {
            agent {
                label "python"
            }
            steps {
                echo "Building....."
                sh './build/build-container.sh'
            }
        }
        stage('Deploy') {
            agent {
              label "ansible"
            }
            steps {
                echo 'Testing..'
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
