FROM openjdk:11
# Set the working directory in the container
WORKDIR /app

# Copy the application JAR file and any other necessary files
COPY target/app.jar .
# ARG JAR_FILE=target/*.jar
# COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]