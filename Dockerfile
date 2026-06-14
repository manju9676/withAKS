FROM maven:3.9.6-eclipse-temurin-11 AS build
WORKDIR /workspace

COPY pom.xml ./
COPY src ./src

RUN mvn -B package -DskipTests

FROM tomcat:9.0-jdk11

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /workspace/target/sample-webapp-1.0-SNAPSHOT.war \
     /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]