node {
    
    stage('Clone repository') {
        checkout scm
    }

    stage('Publishing gem') {
        sh("env")
        sh("gem build ${JOB_NAME}.gemspec")
        sh("gem inabox ${JOB_NAME}-${GEM_VERSION}.gem -g http://${GEM_SERVER}:${GEM_SERVER_PORT}")
    }
}