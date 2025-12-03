# 1️⃣ Image de base avec JDK 17
FROM openjdk:17-jdk-slim

# 2️⃣ Définir le répertoire de travail dans le conteneur
WORKDIR /app

# 3️⃣ Copier le fichier pom.xml et les sources
COPY pom.xml .
COPY src ./src

# 4️⃣ Construire le projet avec Maven (skip tests pour accélérer)
RUN apt-get update && \
    apt-get install -y maven && \
    mvn clean package -DskipTests



# 6️⃣ Commande pour lancer ton application
CMD ["java", "-jar", "target/student-management-0.0.1-SNAPSHOT.jar"]
