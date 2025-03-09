# Use official Java runtime
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Build the application (Works on both Windows & Linux)
RUN mvn clean package -DskipTests

# Copy the generated JAR file
COPY target/*.jar app.jar

# Run the application
CMD ["java", "-jar", "app.jar"]
