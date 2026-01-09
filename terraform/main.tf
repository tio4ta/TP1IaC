# Terraform - Test local 
# Objectif : créer un fichier local automatiquement avec Terraform 
 
terraform { 
  required_version = ">= 1.0" 
} 
 
provider "local" { 
  # Provider pour exécuter des actions locales 
} 
 
resource "local_file" "hello" { 
  filename = "hello_terraform.txt" 
  
  content  = "   Terraform fonctionne correctement sur cette machine." 
}
