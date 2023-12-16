pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/beeru405/devops-pipeline.git']]])
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("devops-pipeline:latest")
                    docker.withRegistry('https://registry.example.com', 'credentials-id') {
                        docker.image("devops-pipeline:latest").push()
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'minikube kubectl -- config use-context minikube'
                    sh 'kubectl apply -f kubernetes-manifests/'
                    sh 'kubectl rollout status deployment/your-deployment'
                }
            }
        }
    }
}
