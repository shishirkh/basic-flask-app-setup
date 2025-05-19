pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "registry.digitalocean.com/shishir123-registry/test:${BUILD_NUMBER}"
    DO_TOKEN = credentials('do_token') 
    KUBECONFIG_CRED = credentials('kubeconfig') 
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        sh "docker build -t ${DOCKER_IMAGE} --platform linux/amd64 ."
      }
    }

    stage('Login to DOCR') {
      steps {
        sh "echo ${DO_TOKEN} | docker login registry.digitalocean.com -u doctl --password-stdin"
      }
    }

    stage('Push Image to DOCR') {
      steps {
        sh "docker push ${DOCKER_IMAGE}"
      }
    }

    stage('Update Kubernetes Manifests') {
      steps {
        sh """
        sed -i 's|shishirkhandelwal/algo-test:*|${DOCKER_IMAGE}|' deployment.yaml
        """
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
          sh """
            export KUBECONFIG=\$KUBECONFIG
            kubectl apply -f deployment.yaml
            kubectl apply -f service.yaml
          """
        }
      }
    }

    stage('Verify Deployment') {
      steps {
        script {
          sleep 15
          sh "curl --fail http://129.212.144.182 || echo 'Service not reachable yet'"
        }
      }
    }
  }

  post {
    failure {
      echo "Pipeline failed!"
    }
    success {
      echo "Deployment completed!"
    }
  }
}
