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
                when {
                    branch 'main'
                }
                steps {      
                    sh 'cd /var/lib/jenkins/workspace/multibranch_main'
                    sh 'cp /var/lib/jenkins/workspace/multibranch_main/dockerhtml/* /var/lib/jenkins/workspace/multibranch_main'
                    sh 'rm -rf dockerhtml'
                    sh 'docker build -t sivakumar2606/dockerhtml:main .'
                }
            }
            stage('Push to Hub') {
                steps {
                    sh 'docker push sivakumar2606/dockerhtml:main'
                }
            } 
            stage('Deploy to Docker-Host') {
                steps {     
                    
                    sh 'docker -H tcp://10.0.0.5:2375 run --rm -dit --name mymainweb -p 7000:80  sivakumar2606/dockerhtml:main' 
                }
            }
            stage('Check Reachability') {
                steps {
                    sh 'sleep 10s'
                    sh 'curl http://13.90.157.196:7000'
                }
            }
       }
}
