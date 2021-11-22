pipeline {
    environment {
        REGISTRY = credentials('dockerhub-cred')
    }
    agent any

    stages{

        stage('Initial Cleanup') {
            steps {
                dir("${WORKSPACE}") {
                deleteDir()
                }
            }
        }

        stage('Checkout SCM') {
            steps {
                git branch: 'master', url: 'https://github.com/brpo01/docker-tooling-webapp.git'
            }
        }

        stage('Build Image') {
            steps {
                sh "docker build -t tobyrotimi/docker-tooling:${env.BRANCH_NAME}-${env.BUILD_NUMBER} ."
            }
        }

        // stage('Start the application') {
        //     steps {
        //         sh "docker-compose up -d"
        //     }
        // }

        stage('Test endpoint & Push Image to Registry') {
            steps{
                script {
                    while(true) {
                        def response = httpRequest 'http://localhost'
                        if (response.status == 200) {
                            withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                                sh "docker push tobyrotimi/docker-tooling:${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
                            }
                            break 
                        }
                    }
                }
            }
        }

        stage('Remove Images') {
            steps {
                sh "docker-compose down"
                sh "docker rmi tobyrotimi/docker-tooling:${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
            }
        }
    }
}