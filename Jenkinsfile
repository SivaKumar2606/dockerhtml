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
                    sh 'cd /var/lib/jenkins/workspace/multiblue'
                    sh 'cp /var/lib/jenkins/workspace/multiblue/dockerhtml/* /var/lib/jenkins/workspace/multiblue'
                    sh 'docker build -t sivakumar2606/multiblue:main .'
                }
            }
            stage('Push to Hub') {
                steps {
                    sh 'docker push sivakumar2606/multiblue:main'
                }
            } 
            stage('Deploy to Docker-Host') {
                steps {     
                    sh 'docker -H tcp://10.0.0.5:2375 stop mymain'
                    sh 'docker -H tcp://10.0.0.5:2375 run --rm -dit --name mymain -p 9100:80  sivakumar2606/multiblue:main' 
                }
            }
            stage('Check Reachability') {
                steps {
                    sh 'sleep 10s'
                    sh 'curl http://13.90.157.196:9100'
                }
            }
       }
}
