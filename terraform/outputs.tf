############################## 
# Outputs visibles après apply 
############################## 
 
output "file_path" { 
 
  description = "Chemin complet du fichier créé" 
  value       = local_file.hello.filename 
} 
 
output "file_content" { 
  description = "Contenu écrit dans le fichier" 
  value       = local_file.hello.content 
}
