pipeline {

  environment {
    registry = "chetangautamm/repo"
    registryCredential = '58881f31-29bb-48a8-9da9-fc254654146d' 
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
        sshagent(['k8suser']) {
          sh "scp opensips.yaml k8suser@52.172.221.4:/home/k8suser"
          sh "scp configure.sh k8suser@52.172.221.4:/home/k8suser"
          script {
            try {
              sh "ssh k8suser@52.172.221.4 kubectl create -f ."
            }catch(error){
              sh "ssh k8suser@52.172.221.4 kubectl create -f ."
            }
            sh "ssh k8suser@52.172.221.4 ./configure.sh"
          }
        }              
      }
    }
  }
}
