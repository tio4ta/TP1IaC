TP1 IaC - Infrastructure as Code (Étapes 1-6)

Étape 1 – Initialisation Git
Création d'un dépôt Git local, premier fichier README.md et commit initial. Objectif : maîtriser les bases du versionnement.
​

Commandes principales

mkdir TP1IaC && cd TP1IaC
git init
git add README.md
git commit -m "Initialisation du projet IaC"

Étape 2 – Automatisation avec Ansible
Utilisation d'Ansible pour déployer automatiquement un serveur web NGINX localement. Découverte des playbooks déclaratives.
​

Structure du dossier ansible/

ansible/
├── hosts.ini  # Fichier d'inventaire Ansible (machines cibles)
└── installnginx.yml  # Playbook pour installer et démarrer NGINX
Description des fichiers
Fichier	Rôle
hosts.ini	Définit la machine cible (localhost) 
​
installnginx.yml	Contient les tâches pour installer NGINX 
​
Exécution du playbook

ansible-playbook -i hosts.ini installnginx.yml
Étape 3 – Terraform Local
Introduction à Terraform avec provider local pour créer un fichier test automatiquement.
​

Fichiers Terraform

terraform/
└── main.tf  # Configuration provider local + resource localfile
Commandes Terraform

terraform init
terraform plan
terraform apply

Étape 4 – Variables et Outputs Terraform
Rendu du code Terraform réutilisable avec variables.tf et outputs.tf.
​

Structure Terraform
Fichier	Rôle
variables.tf	Déclaration des variables paramétrables 
​
outputs.tf	Affichage des résultats après apply 
​
Test des outputs

terraform output

Étape 5 – Conteneur Docker NGINX
Terraform + provider Docker pour créer un conteneur NGINX accessible sur port 8080.
​

Configuration Docker (main.tf)

resource "docker_container" "nginx" {
  image  = "nginx:latest"
  name   = "terraform-nginx"
  ports {
    internal = 80
    external = 8080
  }
}

Test

terraform apply

# Accès : http://localhost:8080

docker ps  # Vérifier terraform-nginx

Étape 6 – Terraform + Ansible + Flask
Intégration complète : Terraform crée conteneur Python, Ansible déploie app Flask automatiquement via connexion Docker.
​
Nouveaux fichiers Ansible

Fichier	Rôle
ansible.cfg	Configuration Ansible (tmp, inventory) 
​
hosts.ini	Inventaire Docker (connection: docker) 
​
deployflask.yml	Playbook : pip, Flask, app.py, lancement 
​
Prérequis Étape 6

pip install docker

ansible-galaxy collection install community.docker

Déploiement complet

# 1. Terraform (conteneur)
cd terraform && terraform apply

# 2. Ansible (app Flask)
cd ../ansible
ansible-playbook deployflask.yml

# Test : http://localhost:8080 → "Hello depuis Flask dans Docker !"
Commandes Git Globales
Versionnez chaque étape avec tags :
​
git add .
git commit -m "Étape X : description"
git tag etape-X
git push origin main --tags

Nettoyage

terraform destroy -auto-approve  # Supprime conteneurs
rm -rf .terraform/ .tfstate*
