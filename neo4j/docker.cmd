@echo off

REM Vérifiez si Docker est installé
docker -v >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker n'est pas installé. Veuillez installer Docker pour exécuter ce script.
    exit /b 1
)

REM Vérifiez si le conteneur Neo4j est déjà en cours d'exécution
docker ps -a --filter "name=neo4j" --format "{{.Names}}" | findstr /x "neo4j" >nul
if %errorlevel% equ 0 (
    echo Le conteneur Neo4j est déjà en cours d'exécution.
    exit /b 0
)

REM Démarrez le conteneur Neo4j
docker run \
    -p 7474:7474 -p 7687:7687 \
    --name neo4j-apoc \
    -e NEO4J_apoc_export_file_enabled=true \
    -e NEO4J_apoc_import_file_enabled=true \
    -e NEO4J_apoc_import_file_use__neo4j__config=true \
    -e NEO4J_PLUGINS=\[\"apoc\",\"apoc-extended\"\] \
    neo4j:5.13.0

echo Le conteneur Neo4j a été démarré avec succès.
exit /b 0
