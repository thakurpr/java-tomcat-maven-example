# Use an official Maven image as the base image
FROM maven:3.8.4-openjdk-17-slim AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files (pom.xml) to the working directory
COPY pom.xml .

# Download dependencies and build the application
RUN mvn dependency:go-offline && mvn package

# Use an official OpenJDK runtime image as the base image
FROM openjdk:17-slim

# Set the working directory in the container
WORKDIR /app

# Copy the compiled application JAR file from the builder stage to the working directory
COPY --from=builder /app/target/my-app.jar .

# Expose port 8080 to allow external access to the application
EXPOSE 8080

# Command to run the application when the container starts
CMD ["java", "-jar", "my-app.jar"]
