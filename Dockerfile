# Step 1: Use Maven image to build the JAR
FROM maven:3.8.6-eclipse-temurin-21 AS build

WORKDIR /app

# Step 2: Copy project files
COPY . .

# Step 3: Build the Spring Boot project
RUN mvn clean package -DskipTests

# Step 4: Use a smaller JDK image to run the JAR
FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy built JAR from previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
