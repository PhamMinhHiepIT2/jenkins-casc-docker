FROM jenkins/jenkins:2.472

LABEL maintainer="Hiep Pham"

USER root
RUN apt-get update && apt-get install -y lsb-release

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yml

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

COPY casc.yml /var/jenkins_home/casc.yml

RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

EXPOSE 8080