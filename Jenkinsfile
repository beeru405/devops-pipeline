pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/your-username/your-app-repo.git']]])
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
                    docker.build("your-docker-image:latest")
                    docker.withRegistry('https://registry.example.com', 'credentials-id') {
                        docker.image("your-docker-image:latest").push()
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
