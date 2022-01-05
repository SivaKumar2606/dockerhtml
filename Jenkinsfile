pipeline {
    agent any
        stages {
            stage('Clone Repo') {
                steps {
                    sh 'rm -rf dockerhtml'
                    sh 'git clone https://github.com/SivaKumar2606/dockerhtml.git'
                }
            }
            stage('Build-Image') {
                steps {      
                    sh 'cd /var/lib/jenkins/workspace/pipeline2'
                    sh 'cp /var/lib/jenkins/workspace/pipeline2/dockerhtml/* /var/lib/jenkins/workspace/pipeline2'
                    sh 'docker build -t sivakumar2606/pipeline2:v1 .'
                }
            }
            stage('Push to Hub') {
                steps {
                    sh 'docker push sivakumar2606/pipeline2:v1'
                }
            } 
            stage('Deploy to Docker-Host') {
                steps {     
                    sh 'docker -H tcp://10.0.0.5:2375 run --rm -dit --name myweb2 -p 9100:80  sivakumar2606/pipeline2:v1' 
                }
            }
            stage('Check Reachability') {
                steps {
                    sh 'sleep 10s'
                    sh 'curl http://40.117.103.166:9100'
                }
            }
       }
}
