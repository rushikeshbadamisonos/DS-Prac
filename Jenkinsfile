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
                sh 'virtualenv  job-deployement --no-site-packages'
                sh 'mkdir libs container'
                sh '''
                requirement="src/jobs/"wordcount"/Config/requirements.txt"
                while IFS= read -r dependency
                do
                  source job-deployement/bin/activate && pip3 install  --user requests $dependency
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
              echo 'Deploying to Master...'
              withCredentials([sshUserPrivateKey(credentialsId: 'rushiSecret', keyFileVariable: 'rushiSecret', passphraseVariable: 'rushiSecret', usernameVariable: 'hadoop'), string(credentialsId: 'rushiSecretText', variable: 'rushiSecretText')]) {
              sh 'ssh -I $rushiSecret hadoop@10.227.179.117 "mkdir test"'

              }




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
