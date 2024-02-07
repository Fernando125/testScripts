pipeline {
    agent ('any')

    stages {
        stage('Delete old logs') {
            steps {
                script {
                    sh '''
                        directory="path_directory"
                        find "$directory" -type f -mtime +7 -exec rm {} \;
                    '''
                }
            }
        }

        stage('Compress recent logs') {
            steps {
                script {
                    sh '''
                        directory="path_directory"
                        dateLogs=$(date +'%d%m%Y')
                        find "$directory" -type f -name "*.log" -ctime -7 -exec zip -q logs_$dateLogs.zip *.log \;
                    '''
                }
            }
        }

        stage('Delete compressed logs') {
            steps {
                script {
                    sh '''
                        directory="path_directory"
                        find "$directory" -type f -name "*.log" -ctime -7 -exec rm {} \;
                        echo "Logs files less than 7 days have been compressed and logs files older than 7 days have been deleted"
                    '''
                }
            }
        }
    }
}