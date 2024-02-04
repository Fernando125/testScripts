pipeline {
    agent ('any')

    stages {
        stage('Eliminar logs antiguos') {
            steps {
                script {
                    sh '''
                        directorio="ruta_directorio"
                        find "$directorio" -type f -mtime +7 -exec rm {} \;
                    '''
                }
            }
        }

        stage('Comprimir logs recientes') {
            steps {
                script {
                    sh '''
                        directorio="ruta_directorio"
                        fecha=$(date +'%d%m%Y')
                        find "$directorio" -type f -name "*.log" -ctime -7 -exec zip -q logs_$fecha.zip *.log \;
                    '''
                }
            }
        }

        stage('Eliminar logs ya comprimidos') {
            steps {
                script {
                    sh '''
                        directorio="ruta_directorio"
                        find "$directorio" -type f -name "*.log" -ctime -7 -exec rm {} \;
                        echo "Se han comprimido los logs con menos de 7 días y se han eliminado los logs con más de 7 días"
                    '''
                }
            }
        }
    }
}
