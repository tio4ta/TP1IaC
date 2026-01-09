--- 
 
##    Étape 2 – Automatisation avec Ansible 
 
Dans cette étape, nous avons utilisé **Ansible** pour déployer automatiquement un serveur 
web **NGINX** sur la machine locale.   
L’objectif était de découvrir l’automatisation de configuration à l’aide d’un playbook Ansible 
simple. 
 
###    Structure du dossier `ansible/` 
 
ansible/ 
├── hosts # Fichier d'inventaire Ansible (machines cibles) 
└── install_nginx.yml # Playbook pour installer et démarrer NGINX 
 
 
###    Description des fichiers 
 
| Fichier | Rôle | 
|----------|------| 
| `hosts` | Définit la machine cible (`localhost`) | 
| `install_nginx.yml` | Contient les tâches à exécuter pour installer NGINX | 
 
###    Exécution du playbook 
 
Commande utilisée pour exécuter Ansible : 
 
```bash 
ansible-playbook -i hosts install_nginx.yml
