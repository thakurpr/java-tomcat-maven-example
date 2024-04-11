# Stage 1: Build the application using Maven
FROM maven:3.8.4-openjdk-17-slim AS builder

# Set the working directory in the container
WORKDIR /build

# Copy the Maven project files (pom.xml) to the working directory
COPY pom.xml .

# Copy the entire source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Create the final image with the built application
FROM openjdk:17-slim

# Set the working directory in the container
WORKDIR /app

# Copy the compiled application JAR from the builder stage to the working directory
COPY --from=builder /build/target/my-app.jar ./app.jar

# Expose port 8080 to allow external access to the application
EXPOSE 8080

# Command to run the application when the container starts
CMD ["java", "-jar", "app.jar"]
