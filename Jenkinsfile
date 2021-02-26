pipeline {

  environment {
    registry = "chetangautamm/repo"
    registryCredential = 'dockerhub' 
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/chetangautamm/jenkins-opensips.git'
      }
    }
    
    stage('Deploy App') {
      steps {
        sh "chmod +x configure.sh"
        sshagent(['k8s-host1-local']) {
          sh "scp -o StrictHostKeyChecking=no -q opensips.yaml k8s-host1@192.168.1.207:/home/k8s-host1"
          sh "scp -o StrictHostKeyChecking=no -q configure.sh k8s-host1@192.168.1.207:/home/k8s-host1"
          script {
            try {
              sh "ssh k8s-host1@192.168.1.207 kubectl apply -f opensips.yaml"
            }catch(error){
              sh "ssh k8s-host1@192.168.1.207 kubectl apply -f opensips.yaml"
            }
            
            sh "ssh k8s-host1@192.168.1.207 ./configure.sh"
          }
        }              
      }
    }
  }
}
