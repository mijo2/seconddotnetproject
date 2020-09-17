pipeline { 
    agent any
    environment{
        dotnet ='C:\\Program Files (x86)\\dotnet\\'
    }
    stages {
        stage('Preparation') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                bat "dotnet build Solution.sln"
            }
        }
        stage('Test') {
            steps {
                bat "dotnet test /p:CollectCoverage=true /p:CoverletOutputFormat=opencover .\\EvenCheck.Tests\\"
            
            }
        }
        stage('SonarQube') {
            steps {
                withSonarQubeEnv('SonarQube') {
                  
                    bat "dotnet build-server shutdown"
                    bat """dotnet sonarScanner begin /k:EvenCheck /d:sonar.host.url=http://localhost:9000 /d:sonar.cs.opencover.reportsPaths=".\\EvenCheck.tests\\coverage.opencover.xml" /d:sonar.coverage.exclusions="**Test*.cs"""
                    bat "dotnet build Solution.sln"
                    bat """dotnet sonarScanner end"""
                    
                }
            }
        }
        stage("Quality Gate") {
            steps {
              timeout(time: 5, unit: 'MINUTES') {
                waitForQualityGate abortPipeline: true
              }
            }
        }
        // stage('Run') {
            // steps {
                // bat "C:/Users/satvats2/Documents/Assignment/FirstCoreProject/bin/Debug/netcoreapp3.1/FirstCoreProject.exe"
            // }
        // }
        stage('Publish'){
            steps{
                bat "dotnet publish"
            }
        }
       // stage('deploy') {  
       //    sh """azureWebAppPublish azureCredentialsId: params.azure_cred_id,  
       //     resourceGroup: params.res_group, appName: params.globalPipelineDemo, sourceDirectory: "globalPipelineDemo/globalPipelineDemo/bin/Release/netcoreapp3.1/publish/""""  
       // }  
    }
    post {  
        always {  
            echo 'Build Result:'  
        }  
        success {  
            echo 'The .net build was successful !'  
        }  
        failure {  
            echo 'The .net build failed !'
            //mail bcc: '', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name - ${env.JOB_NAME}", to: "vatssatyarth11@gmail.com";  
        }    
    }
}