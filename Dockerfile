# Example of custom Java runtime using jlink in a multi-stage container build
FROM mcr.microsoft.com/openjdk/jdk:16-ubuntu as jre-build

# Create a custom Java runtime
RUN $JAVA_HOME/bin/jlink \
         --add-modules java.base \
         --strip-debug \
         --no-man-pages \
         --no-header-files \
         --compress=2 \
         --output /javaruntime

# Define your base image. You may use any base OS and version of your choice.
FROM debian:buster-slim
ENV JAVA_HOME /usr/lib/jvm/msopenjdk-16-amd64
ENV PATH "${JAVA_HOME}/bin:${PATH}"
COPY --from=jre-build /javaruntime $JAVA_HOME

# Continue with your application deployment
RUN mkdir /opt/app
COPY app/build/libs/app-all.jar /opt/app/japp.jar
CMD ["java", "-jar", "/opt/app/japp.jar"]
