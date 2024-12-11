```

def getCommitSha() {
    return sh(returnStdout: true, script: 'git rev-parse HEAD').substring(0, 7)
}

pipeline {
    agent any
    environment {
    ImageName = "${REGISTRY_REPO}"

    }
    stages {
        stage('Cloning Git') {
            steps {
                echo "INFO: Switching to branch ${env.BRANCH_NAME} and commit ${env.GIT_COMMIT}"
                checkout sc
                sh "git reset --hard ${env.GIT_COMMIT}"
                echo "INFO: Project files checked out from branch ${env.BRANCH_NAME} and commit ${env.GIT_COMMIT}"
            }
        }

        stage('Building image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    sh "docker build --no-cache -f Dockerfile -t ${ImageName}:${env.BRANCH_NAME} ."
                    echo 'Docker image build complete.'
                }
            }
        }


    }
}

```