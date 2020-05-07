pipeline {
   agent{
       docker{
           image 'rafatrevs/pywd'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Compilando ou resolvendo as dependencias do projeto'
            sh 'pip install -r requirements.txt'
         }
      }
      
    stage('Tests'){
         steps{
            echo('Executando testes de regressão')
            sh 'robot -d ./logs -e todo tests'
            robot otherFiles: '**/*.png', outputPath: 'logs'
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