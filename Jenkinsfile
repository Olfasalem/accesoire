pipeline {
    agent any
    environment {
        DOCKER_PATH = "C:\\Program Files\\Docker\\cli-plugins"
        PATH = "${DOCKER_PATH}:${PATH}"
        DOCKERHUB_CREDENTIALS = credentials('DockerHub')
        NODEJS_PATH = "C:\\Program Files (x86)\\nodejs"
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }
        stage('Install Node.js and npm') {
            steps {
                script {
                    def nodejs = tool name: 'NODEJS', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
                    env.PATH = "${nodejs}/bin:${env.PATH}"
                }
            }
        }
   
      stage('Build & rename Docker Image') {
    steps {
        script {
            // Construisez l'image Docker
            bat "docker build -t olfa-image:${BUILD_ID} accesoire/"
            bat "docker tag olfa-image:${BUILD_ID} olfasalem/olfa-image:${BUILD_ID}"
        }
    }
}
      stage('Run Docker Container') {
    steps {
        script {
            // Exécutez le conteneur Docker en utilisant l'image construite
            bat "docker run -d -p 8083:8080 --name site_container_${BUILD_ID} olfasalem/olfa-image:${BUILD_ID}"
        }
    }
}




    }
}
