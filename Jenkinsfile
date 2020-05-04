pipeline {
   agent{
       docker{
           image 'python'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Compilando ou resolvendo as dependencias do projeto'
            sh 'pip install robotframework'
         }
      }
      
    stage('Tests'){
         steps{
            echo('Executando testes de regressão')
            sh 'robot -d ./logs -e todo tests'
        }
      }
    stage('UAT'){
        steps{
            echo('Aguardando testes de aceitação do usuário')
            input(message: 'Go to production?', ok: 'Yes')
        }
    }
    stage('Production'){
        steps{
            echo('App is ready!')
        }
    }

   }
}