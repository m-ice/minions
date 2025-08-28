pipeline {
    agent {
        // 使用 Linux 环境，确保 Jenkins 节点上已安装 Flutter & JDK & Android SDK
        label 'linux'
    }

    environment {
        // 从 Jenkins 全局凭据里获取
        PGY_API_KEY = credentials('pgy_api_key')
        PGY_USER_KEY = credentials('pgy_user_key')
    }

    stages {
        stage('Checkout') {
            steps {
                // 拉取 Gitee 仓库代码
                git(
                    url: 'https://gitee.com/你的用户名/你的仓库.git',
                    branch: 'main',
                    credentialsId: 'gitee-credentials' // 在 Jenkins 配置 Gitee 账号凭据
                )
            }
        }

        stage('Setup Flutter') {
            steps {
                // 确保 Jenkins 节点已经配置好 flutter PATH
                sh 'flutter --version'
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }

        stage('Analyze') {
            steps {
                sh 'flutter analyze'
            }
        }

        stage('Test') {
            steps {
                sh 'flutter test'
            }
        }

        stage('Build APK') {
            steps {
                sh 'flutter build apk --release'
            }
        }

        stage('Upload to Pgyer') {
            steps {
                sh '''
                    curl -F "file=@build/app/outputs/flutter-apk/app-release.apk" \
                         -F "_api_key=$PGY_API_KEY" \
                         -F "uKey=$PGY_USER_KEY" \
                         https://www.pgyer.com/apiv2/app/upload
                '''
            }
        }
    }

    post {
        success {
            echo "🎉 构建成功，已上传到蒲公英"
        }
        failure {
            echo "❌ 构建失败，请检查日志"
        }
    }
}
