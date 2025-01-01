FROM        maven
RUN         apt-get update && apt-get install unzip -y
RUN         mkdir /app
RUN         useradd -d /app roboshop
WORKDIR     /app
RUN         chown roboshop:roboshop /app
USER        roboshop
COPY        src/ /app/src
COPY        pom.xml /app/pom.xml
RUN         mvn clean package
RUN         curl -O curl -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip && unzip newrelic-java.zip && rm -f
newrelic-java.zip
COPY        newrelic.yml newrelic/newrelic.yml
COPY        run.sh /app
# ENTRYPOINT  ["java", "-jar", "/app/target/shipping-1.0.jar"]
ENTRYPOINT  ["bash", "/app/run.sh"]