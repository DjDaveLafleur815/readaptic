# Utilisez une image de base Python
FROM python:3.9.16-alpine3.17

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
EXPOSE 8000

# Commande pour exécuter l'application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8081", "--proxy-headers"]

# docker build -t fastapi . && docker run --rm -p 8081:8081 fastapi