pipeline {
    agent {
      label 'ansible'
    }

    stages {
        stage('Build') {
            steps {
                echo "Building....."
                sh './build/build-container.sh'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Monitor') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
