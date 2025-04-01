pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'JDK9'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/karthikbattula02/LoginPage_Jenkins.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh '''
                cp target/LoginWebApp.war /Users/kbattula/ksoftwares/apache-tomcat-10.1.39/webapps
                /Users/kbattula/ksoftwares/apache-tomcat-10.1.39/bin/shutdown.sh
                /Users/kbattula/ksoftwares/apache-tomcat-10.1.39/bin/startup.sh
                '''
            }
        }
    }
}