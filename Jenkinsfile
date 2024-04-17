  pipeline {
  agent any

  environment {
      GIT_REPO = 'https://github.com/Hek70r/node-multiplayer-snake.git'
      GIT_BRANCH = 'master'
  }

  triggers {
      pollSCM('* * * * *')
  }

  stages {

      stage('Collect') {
          steps {
              git branch: "${GIT_BRANCH}", url: "${GIT_REPO}"
          }
      }

      stage('Build') {
          steps {
              echo "Building..."
              sh '''
              cd docker_build
              docker build -t snake_build -f ./Dockerfile .
              '''
          }
      }

      stage('Test') {
          steps {
              echo "Testing..."
              sh '''
              cd docker_test
              docker build -t snake_test -f ./Dockerfile .
              '''
          }
      }

    stage("Deploy") {
            steps {
                echo "Deploying..."
                // Uruchomienie kontenera budującego aplikację
                sh 'docker run --name snake_build -d -p 3000:3000 snake_build'
        }
    }

      stage('Publish') {
          steps {
            echo "Publishing test results and logs..."
            // Zapisz logi z kontenera
            sh 'docker logs snake_build > snake_log.txt'
            // Archiwizuj logi i inne wyniki
            archiveArtifacts artifacts: 'snake_log.txt', fingerprint: true
          
            sh 'docker stop snake_build'
            sh 'docker rm snake_build'
          }
      }
  }
  }
