FROM eclipse-temurin:11-jre
ENV GITBUCKET_HOME=/var/gitbucket
RUN wget -P /opt/ https://github.com/gitbucket/gitbucket/releases/download/4.38.4/gitbucket.war 
VOLUME $GITBUCKET_HOME
EXPOSE 8080 29418
CMD [ "/bin/bash", "-c", "java -jar /opt/gitbucket.war" ]