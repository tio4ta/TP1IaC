############################## 
# Fichier principal Terraform 
############################## 
 
terraform { 
  required_version = ">= 1.0" 
} 
 
# Provider local → Terraform agit sur ta machine locale 
provider "local" {} 

############################################################ 
# Configuration principale Terraform 
############################################################ 
terraform { 
  # On indique ici quels "providers" Terraform doit utiliser 
  required_providers { 
    docker = { 
      source  = "kreuzwerker/docker" # Provider Docker officiel 
      version = "~> 3.0"             # Version minimum du plugin Docker 
    } 
  } 
 
}

############################################################ 
# Provider Docker 
############################################################ 
# Ce bloc indique que Terraform va utiliser Docker 
# comme environnement cible pour créer des ressources. 
provider "docker" { 
  # Pas besoin de configuration supplémentaire 
  # Docker est déjà installé en local 
} 
 
############################## 
# Ressource : Conteneur Docker Flask 
############################## 
 
# On télécharge l'image Python 
resource "docker_image" "python" { 
  name = "python:3.9-slim" 
} 
 
# On crée un container Docker basé sur Python 
resource "docker_container" "flask" { 
  name  = "terraform-flask" 
  image = docker_image.python.name 
 
  # On mappe le port 5000 interne de Flask vers le port 8080 
  ports { 
    internal = 5000 
    external = 8080 
  } 
 
  # On laisse le conteneur tourner (il démarre en idle) 
  command = ["sleep", "infinity"] 
} 
