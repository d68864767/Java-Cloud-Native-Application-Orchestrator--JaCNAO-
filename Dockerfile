```Dockerfile
# Use an official maven image as a parent image
FROM maven:3.6.3-jdk-8 as build

# Set the working directory in the image to /app
WORKDIR /app

# Copy the pom.xml file to our app directory
COPY pom.xml .

# Download all required dependencies into one layer
RUN mvn dependency:go-offline -B

# Copy the rest of the code
COPY . .

# Package our application code
RUN mvn package

# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="example@example.com"

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/*.jar

# Add the application's jar to the container
COPY --from=build ${JAR_FILE} app.jar

# Run the jar file 
ENTRYPOINT ["java","-jar","/app.jar"]
```
