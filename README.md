# 🗃️ Adatabase

Base de données de gestion de ressources pédagogiques, réalisée avec PostgreSQL via Docker.

---

## 📦 Structure du projet

```
.
├── docker-compose.yml
├── migration_up.sql
├── migration_down.sql
├── seed.sql
└── queries.sql
```

---

## ⚙️ Prérequis

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

---

## 🚀 Lancer le projet

### 1. Démarrer la base de données

```bash
docker compose up -d
```

### 2. Créer les tables

```bash
docker exec -i <nom_du_conteneur> psql -U admin -d adatabase < migration_up.sql
```

### 3. Insérer les données

```bash
docker exec -i <nom_du_conteneur> psql -U admin -d adatabase < seed.sql
```

### 4. Exécuter les requêtes

```bash
docker exec -i <nom_du_conteneur> psql -U admin -d adatabase < queries.sql
```

---

## 🧹 Nettoyer la base de données

```bash
docker exec -i <nom_du_conteneur> psql -U admin -d adatabase < migration_down.sql
```

---

## 🗂️ Schéma de la base de données

| Table              | Description                                                |
| ------------------ | ---------------------------------------------------------- |
| `themes`           | Regroupe les ressources par thème (Frontend, Backend...)   |
| `resources`        | Contient les ressources pédagogiques (titre, url, type...) |
| `skills`           | Liste des compétences associées aux ressources             |
| `resources_skills` | Table de liaison entre ressources et compétences           |

### Enum `resource_type`

Les ressources peuvent être de type : `guide`, `video`, `exercice`, `projet`

---

## 🔌 Connexion à la base

| Champ    | Valeur    |
| -------- | --------- |
| Host     | localhost |
| Port     | 5432      |
| User     | admin     |
| Password | admin     |
| Database | adatabase |

---

## 🛑 Arrêter la base de données

```bash
docker compose stop
```
