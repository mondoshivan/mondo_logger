node {
    
    stage('Clone repository') {
        checkout scm
    }

    stage('Publishing gem') {
        sh("env")
        sh("gem build ${REPOSITORY}.gemspec")
        sh("gem inabox ${REPOSITORY}-${version}.gem -g http://${GEM_SERVER}:${GEM_SERVER_PORT}")
    }
}