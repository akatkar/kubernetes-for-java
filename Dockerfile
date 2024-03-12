## Use the official Gradle image as the base image
#FROM gradle:8.6.0-jdk17-alpine AS BUILD
#
## Copy only the necessary files for dependency resolution
#COPY build.gradle settings.gradle /usr/src/app/
#COPY src /usr/src/app/src
#
#WORKDIR /usr/src/app
#
## Resolve dependencies to cache them
#RUN gradle build --no-daemon
#
## Build the application
#RUN gradle build --no-daemon
#
## Create a new image for the runtime environment
#FROM adoptopenjdk:17-jdk-hotspot-slim
#EXPOSE 8080 5005
#
## Copy the built JAR file from the BUILD stage
#COPY --from=BUILD /usr/src/app/build/libs/*.jar /opt/app.jar
#
## Set the working directory
#WORKDIR /opt
#
## Set environment variables
#ENV _JAVA_OPTIONS '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005'
#
## Run the application
#CMD ["java", "-jar", "app.jar"]

# Use OpenJDK 17 as the base image for both build and runtime
#FROM openjdk:17-jdk-slim AS BUILD
#
## Install necessary tools
#RUN apt-get update && apt-get install -y curl unzip
#
## Download and install Gradle
#RUN mkdir /opt/gradle
#WORKDIR /opt/gradle
##RUN curl -L https://services.gradle.org/distributions/gradle-8.6.0-bin.zip -o gradle.zip \
##    && unzip gradle.zip \
##    && rm gradle.zip
#WORKDIR /opt/gradle
#RUN curl -L https://services.gradle.org/distributions/gradle-8.6.0-bin.zip -o gradle.zip \
#    && unzip gradle.zip \
#    && rm gradle.zip
#
#
## Set Gradle environment variables
#ENV GRADLE_HOME=/opt/gradle/gradle-8.6.0
#ENV PATH=$PATH:$GRADLE_HOME/bin
#
## Copy only the necessary files for dependency resolution
#COPY build.gradle settings.gradle /usr/src/app/
#COPY src /usr/src/app/src
#
#WORKDIR /usr/src/app
#
## Resolve dependencies to cache them
#RUN gradle build --no-daemon
#
## Build the application
#RUN gradle build --no-daemon
#
## Create a new image for the runtime environment
#FROM openjdk:17-jdk-slim
#EXPOSE 8080 5005
#
## Copy the built JAR file from the BUILD stage
#COPY --from=BUILD /usr/src/app/build/libs/*.jar /opt/app.jar
#
## Set the working directory
#WORKDIR /opt
#
## Set environment variables
#ENV _JAVA_OPTIONS '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005'
#
## Run the application
#CMD ["java", "-jar", "app.jar"]


FROM gradle:8.6.0-jdk17 AS BUILD

# Copy only the necessary files for dependency resolution
COPY build.gradle settings.gradle /usr/src/app/
COPY src /usr/src/app/src

WORKDIR /usr/src/app

# Resolve dependencies to cache them
RUN gradle build --no-daemon

# Build the application
RUN gradle build --no-daemon

# Create a new image for the runtime environment
FROM openjdk:17-jdk-slim
EXPOSE 8080 5005

# Copy the built JAR file from the Gradle image
COPY --from=BUILD /usr/src/app/build/libs/*.jar /opt/app.jar

# Set the working directory
WORKDIR /opt

# Set environment variables
ENV _JAVA_OPTIONS '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005'

# Run the application
CMD ["java", "-jar", "app.jar"]