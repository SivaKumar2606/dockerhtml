pipeline {
    agent {
        node {
            label 'prod'
        }
    }
        stages {
            stage('Clone Repo') {
                steps {
                    sh 'rm -rf dockerhtml'
                    sh 'git clone https://github.com/SivaKumar2606/dockerhtml.git'
                }
            }
            stage('Build-Image') {
                steps {      
                    sh 'cd /var/lib/jenkins/workspace/multibranch_prod'
                    sh 'cp /var/lib/jenkins/workspace/multibranch_prod/dockerhtml/* /var/lib/jenkins/workspace/multibranch_prod'
                    sh 'rm -rf dockerhtml'
                    sh 'docker build -t sivakumar2606/dockerhtml:prod .'
                }
            }
            stage('Push to Hub') {
                steps {
                    sh 'docker push sivakumar2606/dockerhtml:prod'
                }
            } 
            stage('Deploy to Docker-Host') {
                steps {     
                    
                    sh 'docker -H tcp://10.0.0.5:2375 run --rm -dit --name myprodweb -p 9000:80  sivakumar2606/dockerhtml:prod' 
                }
            }
            stage('Check Reachability') {
                steps {
                    sh 'sleep 10s'
                    sh 'curl http://13.90.157.196:9000'
                }
            }
       }
}
