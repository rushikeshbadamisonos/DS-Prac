pipeline {
    agent none
    environment {
      clusterId = credentials('cluster_Id')
      }
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
                echo 'Testing.. $clusterId'
                #sh './build/ship-container.sh wordcount $clusterId $key'
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
