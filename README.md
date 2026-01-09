TP1 IaC - Infrastructure as Code (Étapes 1-6)

**Étape 1 – Initialisation Git**

J'ai créé un dépôt Git local et réalisé mon premier commit avec le fichier README.md. J'ai maîtrisé les commandes de base du versionnement.

Commandes utilisées

mkdir TP1IaC && cd TP1IaC

git init

echo "# TP1 IaC" > README.md

git add README.md

git commit -m "Initialisation du projet IaC"

**Étape 2 – Automatisation avec Ansible**

J'ai utilisé Ansible pour déployer automatiquement un serveur web NGINX sur ma machine locale via un playbook déclaratif.

Structure du dossier ansible/

ansible/
├── hosts.ini     # Fichier d'inventaire (localhost)
└── installnginx.yml  # Playbook d'installation NGINX

Description des fichiers

Fichier	Rôle

hosts.ini	Définit la machine cible (localhost)

installnginx.yml	Contient les tâches d'installation NGINX

Exécution

ansible-playbook -i hosts.ini installnginx.yml

**Étape 3 – Terraform Local**

J'ai découvert Terraform en créant un fichier test avec le provider local.

Fichiers créés

terraform/
└── main.tf  # Configuration + resource localfile

Commandes Terraform

terraform init
terraform plan
terraform apply

**Étape 4 – Variables et Outputs Terraform**

J'ai rendu mon code Terraform réutilisable en ajoutant des variables et outputs.

Structure Terraform complète

Fichier	Rôle

main.tf	Configuration provider + resources

variables.tf	Déclaration des variables paramétrables

outputs.tf	Affichage des résultats après apply

Vérification des outputs

terraform output

**Étape 5 – Conteneur Docker NGINX**

J'ai configuré Terraform avec le provider Docker pour créer un conteneur NGINX accessible sur le port 8080.

Configuration Docker dans main.tf

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

# Vérification : http://localhost:8080

docker ps

**Étape 6 – Intégration Terraform + Ansible + Flask**

J'ai réalisé une automatisation complète : Terraform crée un conteneur Python, Ansible déploie une application Flask automatiquement.

Nouveaux fichiers Ansible

Fichier	Rôle

ansible.cfg	Configuration (inventory, tmp)

hosts.ini	Inventaire Docker (connection: docker)

deployflask.yml	Playbook complet (pip, Flask, app.py, lancement)

Déploiement complet réalisé

# 1. Infrastructure (Terraform)

cd terraform && terraform apply

# 2. Application (Ansible)

cd ../ansible

ansible-playbook deployflask.yml

# Test final : curl http://localhost:8080

Versionnement Git

J'ai versionné chaque étape avec des commits et tags clairs :

git add .

git commit -m "Étape X : [description]"

git tag etape-X

git push origin main --tags

Nettoyage

terraform destroy -auto-approve

rm -rf .terraform/ .tfstate*
