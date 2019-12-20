node {
    
    stage('Clone repository') {
        checkout scm
    }

    stage('Building gem') {
        sh("gem build ${GEM_NAME}.gemspec")
    }
    
    stage('Publishing gem') {
        sh("gem inabox ${GEM_NAME}-${GEM_VERSION}.${BUILD_ID}.gem -g http://${GEM_SERVER}:${GEM_SERVER_PORT}")
    }
}