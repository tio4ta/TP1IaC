############################## 
# Fichier principal Terraform 
############################## 
 
terraform { 
  required_version = ">= 1.0" 
} 
 
# Provider local → Terraform agit sur ta machine locale 
provider "local" {} 
 
# Ressource locale : création d'un fichier 
resource "local_file" "hello" { 
  filename = var.file_name     # On remplace la valeur par une variable 
  content  = var.file_content  # Idem pour le contenu 
}
