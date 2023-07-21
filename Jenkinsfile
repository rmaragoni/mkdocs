pipeline{
    agent any
    environment {
        PROJECT_NAME = "centralDocuments"
        APPLICATION_NAME = "mkdocsApplication"
        VERSION = "v1.0.0"
    }
    stages{
        stage('clone'){
            steps{
                script {
                    git branch: 'master', uri: 'https://github.com/rmaragoni/mkdocs.git', credentialsId: 'git-readonly'
                }
            }
        }
        stage('Build'){
            steps{
                script {
                    imageBuilder = docker.build("mkdocs:${env.VERSION}")

                    sh """
                        echo "Create sample project"
                        ./mkdockerize.sh produce
                    """
                }
            }
        }
        stage('Test'){
            steps{
                script {
                    sh """
                        echo "Running mkdocs server to serve static site"
                        ./mkdockerize.sh serve

                        curl http://127.0.0.1:8000

                        if [ $? -eq 0 ]; then
                            echo "Application is running and able to access the page"
                        else
                            echo "Application is not running"
                            exit 1    
                        fi
                    """
                }
            }
        }
        stage('Image Push'){
            steps{
                script {
                    imageBuilder.push()
                }
            }
        }
    }
    post {
        success{
            echo "Build completed successfully"
        }
        failure{
            currentBuild.currentResult == 'FAILURE'
            echo "Build Failed, please check the erros.."
        }
        always{
            echo "Pipeline execution completed"
        }
    }
}
