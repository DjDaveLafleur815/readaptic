from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import requests

app = FastAPI()

# Modele de données pour les capteurs
class SensorData(BaseModel):
    sensor_id: str
    value: float

def get_sensor_data(sensor_entity_id):
    # Fonction pour récupérer les données du capteur à partir de votre source de données
    pass  # Remplacer par votre logique de récupération des données du capteur

# URL de l'API REST de Home Assistant
HA_API_URL = "http://192.168.0.101:8123/api/states"

# Votre jeton d'authentification pour l'API REST de Home Assistant
HA_ACCESS_TOKEN = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIzYTc1NWZiMGQ4MWI0YzBjOTQyMDRhYWJmNjhlNTU4MSIsImlhdCI6MTcxMjczODE2MSwiZXhwIjoyMDI4MDk4MTYxfQ.3zmc4hSq3QdrCgapSKLUytjVnznmnabRtdo7QpT_Xlo"

# Fonction pour récupérer les données d'un capteur spécifique dans Home Assistant
def get_sensor_data(sensor_entity_id):
    headers = {"Authorization": f"Bearer {HA_ACCESS_TOKEN}", "Content-Type": "application/json"}
    response = requests.get(f"{HA_API_URL}/states/{sensor_entity_id}", headers=headers)
    if response.status_code == 200:
        return response.json()
    else:
        raise HTTPException(status_code=response.status_code, detail="Erreur lors de la récupération des données du capteur")

# Route FastAPI pour récupérer les données d'un capteur spécifique
@app.get("/sensor/{sensor_entity_id}")
async def get_sensor(sensor_entity_id: str):
    sensor_data = get_sensor_data(sensor_entity_id)
    return sensor_data

class LoadDataRequest(BaseModel):
    url: str
    authorization_header: str

def load_data_into_neo4j(data):
    # Fonction pour charger les données dans Neo4j
    pass  # Remplacer par votre logique de chargement dans Neo4j

@app.post("/load_data")
async def load_data(request: LoadDataRequest):
    try:
        url = request.url
        headers = {"Authorization": request.authorization_header}
        
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Lève une exception si le code d'état n'est pas 200
        
        data_hass = response.json()
        load_data_into_neo4j(data_hass)
        
        return {"message": "Data loaded into Neo4j"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to load data from Home Assistant. Error: {str(e)}")
    

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8081)