# Utilisez une image de base Python
FROM python:latest

RUN mkdir -p /app

# Définit le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez les fichiers requis dans le conteneur
COPY ./requirements.txt /app/requirements.txt

# Installez les dépendances de votre application
RUN pip install --upgrade pip

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY . /app/

# Exposez le port sur lequel l'application FastAPI fonctionne
EXPOSE 8081

# Commande pour exécuter l'application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8081", "--proxy-headers"]

# sudo docker build -t fastapi . && sudo docker run --rm -p 8081:8081 fastapi
