pipeline {
    agent none
    stages {

        stage('Build') {
            agent {
                label "python"
            }
            steps {
                echo "Building....."
                sh 'rm -rf job-deployement libs lib'
                sh 'python3 -m venv job-deployement'
                sh '''
                source job-deployement/bin/activate
                requirement="src/jobs/"$1"/Config/requirements.txt"
                while IFS= read -r dependency
                do
                  pip3 install requests $dependency
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
