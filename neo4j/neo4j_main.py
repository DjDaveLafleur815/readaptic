import requests
from fastapi import FastAPI, HTTPException
from neo4j import GraphDatabase
from pydantic import BaseModel

# Créer une instance de FastAPI
app = FastAPI()

# Configuration de la connexion à Neo4j
uri = "bolt://localhost:7687"
user = "neo4j"
password = "password"
driver = GraphDatabase.driver(uri, auth=(user, password))

# Fonction pour charger les données dans Neo4j
def load_data_into_neo4j(data):
    with driver.session() as session:
        for item in data:
            session.run("""
                CALL apoc.load.jsonParams(
                    'http://192.168.43.76:8123/api/states',
                    { Authorization: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIzMzA4NGEwMWMyM2M0MGZmOTRlMmJlMDIzMGQ5ZjdmMSIsImlhdCI6MTcyMDE3NzY1NywiZXhwIjoyMDM1NTM3NjU3fQ.ZGYQuyqYmlt_OJpUdYEkEL9aMhZA-zGZGXj1hFvW_zc' },
                    null
                    ) YIELD value
                UNWIND value AS state
                MERGE (n:HomeAssistantState {entity_id: state.entity_id})
                SET n.state_id = state.id,
                    n.user_id = state.user_id,
                    n.parent_id = state.parent_id,
                    n.state = state.state,
                    n.last_changed = state.last_changed,
                    n.last_updated = state.last_updated,
                    n.attributes = apoc.convert.toJson(state.attributes) // Convert attributes map to JSON string
                RETURN n

            """, entity_id=item['entity_id'], state=item['state'])

class LoadDataRequest(BaseModel):
    url: str
    authorization_header: str

# Récupérer les données de l'API REST de Home Assistant
@app.get("/load_data")
async def load_data():
    url = "http://192.168.1.56:8123/api/states"
    headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiI1N2UxYzFhODg3MzY0OWQ5YWNiMjVhMzE0NGI5ZTBhOCIsImlhdCI6MTcyMDExOTgwNSwiZXhwIjoyMDM1NDc5ODA1fQ.f8ufNe_N-KcHbp5U91CuTuDA0EyJHOm9zTivVCC7hHE"
    }
    
    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Lève une exception si le code d'état n'est pas 200
        data_hass = response.json()
        load_data_into_neo4j(data_hass)
        return {"message": "Data loaded into Neo4j"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to load data from Home Assistant. Error: {str(e)}")

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
