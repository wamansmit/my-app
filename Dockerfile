FROM anapsix/alpine-java 
LABEL maintainer="wamansmit@gmail.com"
COPY /target/my-app.jar /home/my-app.jar 
CMD ["java","-jar","/home/my-app.jar"]
