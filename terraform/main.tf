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
 
############################################################ 
# Ressource : Conteneur Docker NGINX 
############################################################ 
resource "docker_container" "nginx" { 
  image = "nginx:latest"        # Image Docker utilisée (téléchargée si absente) 
  name  = "terraform-nginx"     # Nom du conteneur 
 
  # Configuration des ports 
  # Le port 80 interne du conteneur devient accessible 
  # via le port 8080 sur la machine locale 
  ports { 
    internal = 80               # Port dans le conteneur 
    external = 8080             # Port sur la machine hôte 
  } 
}

### Ressource locale : création d'un fichier 
resource "local_file" "hello" { 
  filename = var.file_name     # On remplace la valeur par une variable 
  content  = var.file_content  # Idem pour le contenu 
}
