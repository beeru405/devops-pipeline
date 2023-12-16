FROM openjdk:11-jre-slim
WORKDIR /app
COPY target/your-app.jar .
CMD ["java", "-jar", "your-app.jar"]
