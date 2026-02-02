pipeline {
    agent { label "${LABEL_NAME}" }
    environment {
        IMAGE_NAME = "simpleappy0"
        IMAGE_TAG = "${BUILD_NUMBER}"
        DOCKER_IMAGE = "${IMAGE_NAME}:${IMAGE_TAG}"
    }
    stages {
        stage ( 'CODE' ) {
            steps {
                git url:"https://github.com/vishwash-debug/agentdocker.git" , branch: "main"                 
            }
        }
        stage ( 'build' ) {
             steps {
                 sh "docker build -t ${DOCKER_IMAGE} ."
             }
        }   
        
         stage ('deploy') {
               steps {
                   sh "docker stop c1 || true"
                   sh "docker rm c1 || true"
                   sh "docker run -d --name c1 -p 80:80 --restart always ${DOCKER_IMAGE} sleep infinity"
                   
               }
    }
}
    post {
        emailext {
            body: '''this mail is regarding the failed build
for the reference check console output of ''',
    subject: 'Build FAILED $(BUILD_NUMBER)', 
    to: 'vishwashaws@gmail.com'
                 }
    }
}

