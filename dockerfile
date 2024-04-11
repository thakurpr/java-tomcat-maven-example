# Use an official OpenJDK runtime as the base image
FROM openjdk:11


# Set the working directory inside the container
WORKDIR /app


# Copy the JAR or WAR file into the container
COPY webapp-runner.jar /app/
# Or use COPY myapp.war /app/ if your application is a WAR file


# Expose the port that the application listens on (replace 8080 with your application's port)
EXPOSE 8080


# Command to run when the container starts
CMD ["java", "-jar", "webapp-runner.jar"]
# Or CMD ["java", "-jar", "myapp.war"] if your application is a WAR file
