cd /D %~dp0
chcp 65001
java -Dfile.encoding=UTF-8 -jar agent.jar -jnlpUrl http://ds-1c-elk.dengisrazy.ru:8080/computer/ds-dev-app1/slave-agent.jnlp -secret 9c8e28573841e9c6186e628c40decfb6964bae1f48b5ed9077a52e5a5ed9c6f1 -workDir "C:\jenkins_slave"