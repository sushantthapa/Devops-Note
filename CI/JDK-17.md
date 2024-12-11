
```
pipeline {
    agent any
    environment {
        ImageName = "${REGISTRY_REPO}"
        JDK_17_HOME = '/opt/jdk-17'
    }
    stages {
        stage('Cloning Git') {
            steps {
                echo "INFO: Switching to branch ${env.BRANCH_NAME} and commit ${env.GIT_COMMIT}"
                checkout scm
                sh "git reset --hard ${env.GIT_COMMIT}"
                echo "INFO: Project files checked out from branch ${env.BRANCH_NAME} and commit ${env.GIT_COMMIT}"
            }
        }
        stage('Building image') {
            steps {
                script {
                    
                    echo 'Building Docker image...'
                    def shortCommit = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
                    
                    env.JAVA_HOME = "${env.JDK_17_HOME}"
                    env.PATH = "${env.JAVA_HOME}/bin:${env.PATH}"
                    
                    sh "ls"
                    sh "pwd"                    
                    sh "/opt/apache-maven-3.8.4/bin/mvn clean package"
                    sh "docker build -f Dockerfile -t reg.citytech.global/${Product}/${ImageName}:${shortCommit} --pull=true --file=application/Dockerfile ."
                    echo 'Docker image build complete.'
                }
            }
        }

        stage('Push Image to Registry') {
            steps {
                script {
                    echo 'Pushing Docker image to Registry...'
                    def shortCommit = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
                    env["ImageTag"] = "${ImageName}:${shortCommit}"
                    sh "docker push reg.citytech.global/${Product}/${ImageName}:${shortCommit}"

                    echo 'Image pushed to Registry.'
                }
            }
        }
    stage('Remove unused docker images') {
      steps{
        script{
			try {
                sh "docker image prune --filter until=30m -a -f"
				} catch (err) {
                echo err.getMessage()
			}
		}
      }
    }
    stage ('Image Updater Post Job'){
      steps{
          // comment
          build job: POST_JOB, parameters: [
          string(name: 'PROJECT', value: "$PROJECT"),
          string(name: 'IMAGE_TAG', value: ImageTag),
          string(name: 'VALUES_FILE', value: "$VALUES_FILE")
        ]
      }
    }
  }
 }
```