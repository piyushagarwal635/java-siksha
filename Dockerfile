# Base image
# Use official Java runtime
FROM openjdk:23-jdk-slim

# Set working directory
WORKDIR /app

# Copy pom.xml and source files
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Build the application
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Copy the generated JAR file
COPY target/*.jar app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]

