pipeline{
  agent {label 'slave'}
  stages{
    stage('repo pulling'){
      steps{
        git branch: 'main', url: 'https://github.com/Ramana4u/repo2.git'
        sh "ls"
      }
    }
    stage('Terraform code exucution'){
      steps{
        sh "terraform init"
        sh "terraform plan"
        sh "terraform apply -auto-approve"
      }
    }
  }
}
