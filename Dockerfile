FROM        maven
RUN         mkdir /app
RUN         useradd -d /app roboshop
WORKDIR     /app
RUN         chown roboshop:roboshop /app
USER        roboshop
COPY        src/ /app/src
COPY        pom.xml /app/pom.xml
RUN         mvn clean package
ENTRYPOINT  ["java", "-jar", "/app/target.shipping-1.0.jar"]