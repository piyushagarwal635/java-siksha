# Base image
FROM openjdk:23

# Copy the built JAR file into the container
COPY target/*.jar app.jar


# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
