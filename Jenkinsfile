pipeline {
    agent any

    stages {
      stage('Preparation') {
             steps {
                 echo 'Fetching files from git..'
                 git 'https://github.com/sohammondal/golden-ami'
             }
         }

        stage('Baking AMI') {
            steps {
                echo 'Baking AMI..'
                sh 'bash packer.sh'
            }
        }
        stage('Launch Instance with Golden-AMI') {
            steps {
                echo 'Launch Instance with Golden-AMI....'
                sh 'bash launch.sh'
            }
        }
         stage('Scanning AMI') {
            steps {
                echo 'Creating Inspector Stack....'
                sh 'bash inspector.sh'
            }
        }
    }
}
