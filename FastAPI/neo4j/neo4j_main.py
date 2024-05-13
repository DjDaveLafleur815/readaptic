import requests
from fastapi import FastAPI, HTTPException
from py2neo import Graph, Node
from neo4j import GraphDatabase
from pydantic import BaseModel

# Créer une instance de FastAPI
app = FastAPI()

# Configuration de la connexion à Neo4j
uri = "bolt://localhost:7687"
user = "neo4j"
password = "password"
driver = GraphDatabase.driver(uri, auth=(user, password))
graph = Graph(uri, auth=(user, password))

# Fonction pour charger les données dans Neo4j
def load_data_into_neo4j(data):
    for item in data:
        node = Node("Data", entity_id=item['entity_id'], state=item['state'])
        graph.create(node)
    with driver.session() as session:
        for item in data:
            session.run("""
                CREATE (n:Entity {property: $entity_id})
            """, value=item['entity_id'])

class LoadDataRequest(BaseModel):
    url: str
    authorization_header: str

# Récupérer les données de l'API REST de Home Assistant
@app.get("/load_data")
async def load_data():
    url = "http://192.168.0.101:8123 Cette route t/api/states"
    headers = {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIzYTc1NWZiMGQ4MWI0YzBjOTQyMDRhYWJmNjhlNTU4MSIsImlhdCI6MTcxMjczODE2MSwiZXhwIjoyMDI4MDk4MTYxfQ.3zmc4hSq3QdrCgapSKLUytjVnznmnabRtdo7QpT_Xlo"}
    
    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Lève une exception si le code d'état n'est pas 200
        data_hass = response.json()
        load_data_into_neo4j(data_hass)
        return {"message": "Data loaded into Neo4j"}
    except Exception as e:
        return {"message": f"Failed to load data from Home Assistant. Error: {str(e)}"}

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