node {
    
    stage('Cloning') {
        checkout scm
    }
    
    stage('Testing') {
        sh("./spec_handler.rb")
    }

    stage('Building') {
        sh("gem build ${GEM_NAME}.gemspec")
    }
    
    stage('Publishing') {
        sh("gem inabox ${GEM_NAME}-${GEM_VERSION}.${BUILD_ID}.gem -g http://${GEM_SERVER}:${GEM_SERVER_PORT}")
    }
}