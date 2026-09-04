from flask import Flask, request, jsonify
import joblib
import pandas as pd

app = Flask(__name__)

print("--- Démarrage de l'API Flask ---")
# 1. Chargeement du modele ; 
try:
    model = joblib.load("modele_ordinateur.pkl")
    print("Modèle 'modele_ordinateur.pkl' chargé avec succès et prêt !")
except FileNotFoundError:
    print("Erreur : Le fichier 'modele_ordinateur.pkl' est introuvable. Re-exécutez train_model.py")
    exit()

# 2. la route POST que l'application Java va appeler
@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Récupéreration des données envoyées par Java au format JSON
        data = request.get_json()
        
        # forme de JSON : => 
        # Le JSON reçu ressemblera à ça :
        # {
        #    "Brand": "Dell",
        #    "Screen_Size": 15.6,
        #    "RAM": 16,
        #    "Processor": "Intel Core i5 11th Gen.",
        #    "Condition": "New"
        # }
        
        # Convertir ce JSON en tableau (DataFrame) pour le modèle
        input_data = pd.DataFrame([data])
        
        # Faire la prédiction du prix grâce au cerveau (.pkl)
        prediction = model.predict(input_data)
        
        # Renvoyer le prix prédit à Java au format JSON
        return jsonify({
            'status': 'success',
            'predicted_price': round(prediction[0], 2)
        })
        
    except Exception as e:
        return jsonify({
            'status': 'error',
            'message': str(e)
        }), 400

if __name__ == '__main__':
    # Le serveur écoute sur le port 5000 de ma machine Fedora
    print("API Flask lancée sur http://localhost:5000")
    app.run(host='0.0.0.0', port=5000, debug=True)