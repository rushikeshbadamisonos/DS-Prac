pipeline {
    agent none
    stages {
      environment {
        key = credentials('key')
        clusterId = credentials('cluster_Id')
        }
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
                echo 'Testing..'
                sh './build/ship-container.sh wordcount $clusterId $key'
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
