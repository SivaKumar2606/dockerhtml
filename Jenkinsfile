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
                    sh 'cd /var/lib/jenkins/workspace/dockerhtml_main'
                    sh 'cp /var/lib/jenkins/workspace/dockerhtml_main/dockerhtml/* /var/lib/jenkins/workspace/dockerhtml_main'
                    sh 'docker build -t sivakumar2606/dockerhtml_main:main .'
                }
            }
            stage('Push to Hub') {
                steps {
                    sh 'docker push sivakumar2606/dockerhtml_main:main'
                }
            } 
            stage('Deploy to Docker-Host') {
                steps {     
                    //sh 'docker -H tcp://10.0.0.5:2375 stop mymain'
                    sh 'docker -H tcp://10.0.0.5:2375 run --rm -dit --name mymain -p 9100:80  sivakumar2606/dockerhtml_main:main' 
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
