FROM eclipse-temurin:11
RUN apt-get update
RUN apt-get install maven -y

WORKDIR /app
COPY . /app

RUN mvn clean install
RUN javac /app/src/main/java/org/example/QuickAck.java
RUN cp /app/mssql-jdbc-12.3.0-SNAPSHOT.jre11-min40ms.jar /app/target/mssql-jdbc-12.3.0-SNAPSHOT.jre11-min40ms.jar
# RUN cp /app/mssql-jdbc-12.2.0.jre11.jar /app/target/mssql-jdbc-12.2.0.jre11.jar

CMD java -cp "/app/target/sockFactory3-1.0-SNAPSHOT.jar:target/*" org.example.Main