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
    
    stage('Creating UAC & OPENSIPS') {
      steps {
        sshagent(['k8suser']) {
          sh "scp -o StrictHostKeyChecking=no -q opensips.yaml k8suser@52.172.221.4:/home/k8suser"
          script {
            try {
              sh "ssh k8suser@52.172.221.4 kubectl apply -f opensips.yaml"
            }catch(error){
              sh "ssh k8suser@52.172.221.4 kubectl apply -f opensips.yaml"
            }
          }
        }              
      }
    }
    
    stage('Configure & Create UAS') {
      steps {
        sh "chmod +x ipaddress.sh"
        sshagent(['k8suser']) {
          sh "scp -o StrictHostKeyChecking=no -q uas_config.yaml k8suser@52.172.221.4:/home/k8suser"
          sh "scp -o StrictHostKeyChecking=no -q ipaddress.sh k8suser@52.172.221.4:/home/k8suser"
          script {
            sh "ssh k8suser@52.172.221.4 ./ipaddress.sh"
            try {
              sh "ssh k8suser@52.172.221.4 kubectl apply -f uas_config.yaml"
            }catch(error){
              sh "ssh k8suser@52.172.221.4 kubectl apply -f uas_config.yaml"
            } 
          }
        }              
      }
    }
  }
}
