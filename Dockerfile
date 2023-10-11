# Stage 1: Build the Java application
FROM maven:3.8.1-openjdk-11 AS builder
WORKDIR /app

# Copy the Maven POM file and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy the source code
COPY src src

# Build the application
RUN mvn package

# Stage 2: Create a minimal Java runtime image
FROM openjdk:11-jre-slim
WORKDIR /app

# Copy the JAR file from the previous stage
COPY --from=builder /app/target/my-app.jar my-app.jar

# Define the command to run your application
CMD ["java", "-jar", "my-app.jar"]
