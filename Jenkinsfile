pipeline {
    agent {
      label 'Ansible'
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
