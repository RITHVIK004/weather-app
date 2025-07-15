# ✅ Use Tomcat 9 + JDK 21 base image
FROM tomcat:9.0-jdk21

# ✅ Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# ✅ Copy the WAR you built with Maven
COPY target/weather.war /usr/local/tomcat/webapps/ROOT.war

# ✅ Expose the same port your Spring Boot app uses
EXPOSE 9000
