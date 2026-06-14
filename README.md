# Sample Java WAR webapp

Build the WAR:

```bash
mvn clean package
```

After building, the WAR will be at:

```
target/sample-webapp-1.0-SNAPSHOT.war
```

Run it in a servlet container (Tomcat, Jetty, etc.) or use an embedded runner.

SonarQube
---------

Run SonarQube locally using the provided docker-compose file and then invoke the scanner with Maven.

Start SonarQube:

```bash
docker compose -f docker-compose.sonarqube.yml up -d
```

Open SonarQube at http://localhost:9000 and create a token (Administration → Security → Users → Tokens).

Run analysis (from project root):

```bash
# set SONAR_TOKEN to the token you created
export SONAR_TOKEN=your_token_here

mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=${SONAR_TOKEN}
```

Alternatively, use the `sonar-scanner` CLI with `sonar-project.properties`.
