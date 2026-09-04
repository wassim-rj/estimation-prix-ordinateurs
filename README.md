# 💻 Smart Laptop Price Estimator (Java EE & Machine Learning)

Un projet full-stack d'estimation intelligente des prix d'ordinateurs combinant une application web d'entreprise (**Java/Jakarta EE**) et un modèle de prédiction par apprentissage automatique (**Python / Machine Learning**).

---

## 🚀 Fonctionnalités principales
* **Interface Web Dynamique (JSP / Servlets) :** Permet aux utilisateurs d'interagir facilement avec l'application pour saisir les caractéristiques d'un ordinateur.
* **Sécurité & Architecture MVC :** Gestion propre des sessions utilisateurs, des contrôleurs (`LoginServlet`, `PredictionServlet`) et sécurisation des accès.
* **Intégration Machine Learning :** Connexion entre le backend Java et un modèle prédictif Python (`.pkl`) pour estimer le prix en temps réel selon les spécifications techniques.
* **Base de Données Relationnelle :** Stockage des données et gestion des utilisateurs via MySQL.

---

## 🛠️ Technologies Utilisées
* **Backend :** Java, Jakarta EE (Servlets, JSP, JSTL)
* **Intelligence Artificielle :** Python, Scikit-Learn / Pandas (`app.py`, `train_model.py`)
* **Base de données :** MySQL (`script.sql`)
* **Serveur & Outils :** Apache Tomcat, Eclipse IDE, VS Code, Git / Fedora Linux
* **Bibliothèques Java :** Gson, MySQL Connector J

---

## 📂 Structure du Projet
```text
MINI_PROJET_JEE/
│── eclipse.src/          # Code source de l'application web Java EE
│   ├── main/java/        # Contrôleurs (Servlets) et logique métier
│   └── main/webapp/      # Pages JSP (index, predict, resultat) et bibliothèques (lib)
│── app.py                # API Python pour le Machine Learning
│── train_model.py        # Script d'entraînement du modèle
│── modele_ordinateur.pkl # Modèle prédictif entraîné
│── script.sql            # Script de création de la base de données
└── cleaned.csv           # Données nettoyées pour l'apprentissage
