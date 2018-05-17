pipeline {
    agent {
      label 'ansible'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
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
