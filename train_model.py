import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error, r2_score
import joblib

print("1. [DÉBUT] Chargement des données...")
# On charge le fichier CSV
df = pd.read_csv("cleaned.csv")

print("2. [NETTOYAGE] Traitement de la colonne RAM...")
# le fichier contient le texte 'Up' dans la RAM, on le remplace par '8' par sécurité
df['RAM'] = df['RAM'].astype(str).str.replace('Up', '8')
df['RAM'] = pd.to_numeric(df['RAM'], errors='coerce').fillna(8)

# On supprime les lignes où le prix est vide
df = df.dropna(subset=['Price'])

print("3. [SÉPARATION] Sélection des caractéristiques...")
# X contient les critères de choix, y contient ce qu'on veut deviner (le Prix)
features = ['Brand', 'Screen_Size', 'RAM', 'Processor', 'Condition']
X = df[features]c
y = df['Price']

# On sépare : 80% des données pour apprendre, 20% pour vérifier si le modèle ne se trompe pas
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

print("4. [PREPROCESSING] Configuration des transformations de texte...")
# Les algorithmes ne comprennent pas le texte (ex: 'Dell', 'New'). On les transforme en chiffres (OneHotEncoder)
categorical_features = ['Brand', 'Processor', 'Condition']
numeric_features = ['Screen_Size', 'RAM']

categorical_transformer = Pipeline(steps=[
    ('imputer', SimpleImputer(strategy='most_frequent')),
    ('onehot', OneHotEncoder(handle_unknown='ignore'))
])

numeric_transformer = Pipeline(steps=[
    ('imputer', SimpleImputer(strategy='median'))
])

preprocessor = ColumnTransformer(
    transformers=[
        ('num', numeric_transformer, numeric_features),
        ('cat', categorical_transformer, categorical_features)
    ])

print("5. [MODÈLE] Création de l'architecture (Random Forest)...")
# On assemble la transformation des données ET l'algorithme dans une seule chaîne (Pipeline)
model_pipeline = Pipeline(steps=[
    ('preprocessor', preprocessor),
    ('regressor', RandomForestRegressor(n_estimators=100, random_state=42))
])

print("6. [APPRENTISSAGE] Entraînement du modèle en cours...")
# Le modèle lit les données et apprend à associer les caractéristiques au prix
model_pipeline.fit(X_train, y_train)

print("7. [ÉVALUATION] Calcul des performances...")
# On teste le modèle sur les 20% de données mis de côté
y_pred = model_pipeline.predict(X_test)
r2 = r2_score(y_test, y_pred)
mae = mean_absolute_error(y_test, y_pred)

print("\n=============================================")
print(f" Précision du modèle (R² Score) : {r2*100:.2f} %")
print(f" Erreur moyenne (MAE) : {mae:.2f} $")
print("=============================================\n")

print("8. [SAUVEGARDE] Enregistrement du modèle...")
# On sauvegarde le modèle entraîné dans un fichier physique
joblib.dump(model_pipeline, "modele_ordinateur.pkl")
print("Fichier 'modele_ordinateur.pkl' créé ! La partie entraînement est finie.")