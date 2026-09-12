pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                bat '''
                echo Checking Java...
                "C:\\Users\\Veena S Dodamani\\AppData\\Local\\Programs\\Eclipse Adoptium\\jdk-21.0.12.101-hotspot\\bin\\java.exe" -version

                if not exist build mkdir build

                "C:\\Users\\Veena S Dodamani\\AppData\\Local\\Programs\\Eclipse Adoptium\\jdk-21.0.12.101-hotspot\\bin\\javac.exe" -d build src\\Hello.java

                if errorlevel 1 exit /b 1

                echo BUILD SUCCESS
                '''
            }
        }

        stage('Test') {
            steps {
                bat '''
                "C:\\Users\\Veena S Dodamani\\AppData\\Local\\Programs\\Eclipse Adoptium\\jdk-21.0.12.101-hotspot\\bin\\java.exe" -cp build Hello > test-output.txt

                findstr /C:"Hello from Week 5 Jenkins CI/CD!" test-output.txt >nul

                if errorlevel 1 (
                    echo TEST FAILED
                    type test-output.txt
                    exit /b 1
                )

                echo TEST PASSED
                '''
            }
        }

        stage('Validation') {
            steps {
                bat '''
                if exist build\\Hello.class (
                    echo VALIDATION PASSED - Build artifact exists.
                ) else (
                    echo VALIDATION FAILED - Build artifact missing.
                    exit /b 1
                )
                '''
            }
        }
    }

    post {
        success {
            echo 'CI pipeline completed successfully.'
        }

        failure {
            echo 'CI pipeline failed. Check Console Output.'
        }
    }
}
