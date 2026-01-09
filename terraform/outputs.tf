############################## 
# Outputs - Docker container 
############################## 
 
# Nom du conteneur Docker créé 
#output "container_name" { 
  #description = "Nom du conteneur Docker créé par Terraform" 
 # value       = docker_container.nginx.name 
#} 
 
# Port d'accès externe 
#output "published_port" { 
 # description = "Port externe pour accéder à NGINX" 
  #value       = docker_container.nginx.ports[0].external 
#}
