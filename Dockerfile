FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    openjdk-17 \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/jusan-singularity/gradle-spring-rest /app

RUN ./gradlew wrapper --gradle-version 6.9

RUN ./gradlew build

CMD ["./gradlew", "bootRun"]
 
