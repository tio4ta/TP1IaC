############################## 
# Déclaration des variables 
############################## 
 
# Nom du fichier à générer 
variable "file_name" { 
  description = "Nom du fichier généré par Terraform" 
  type        = string 
  default     = "hello_terraform.txt" 
} 
 
# Contenu du fichier généré 
variable "file_content" { 
  description = "Contenu du fichier généré" 
  type        = string 
  default     = "   Terraform fonctionne avec des variables !" 
} 
