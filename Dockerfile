# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory within the container
WORKDIR /app

# Copy the compiled Java application JAR file into the container
COPY target/your-app.jar /app/your-app.jar

# Define the command to run your Java application
CMD ["java", "-jar", "your-app.jar"]
