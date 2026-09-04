package model;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class MachineLearningClient {

    public static double getPredictedPrice(String brand, double screenSize, int ram, String processor, String condition) throws Exception {
        // 1. Préparation de l'objet JSON à envoyer à Flask
        JsonObject jsonInput = new JsonObject();
        jsonInput.addProperty("Brand", brand);
        jsonInput.addProperty("Screen_Size", screenSize);
        jsonInput.addProperty("RAM", ram);
        jsonInput.addProperty("Processor", processor);
        jsonInput.addProperty("Condition", condition);

        // 2. Envoi de la requête HTTP POST à l'API Flask (Port 5000)
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("http://localhost:5000/predict"))
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(jsonInput.toString()))
                .build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        // 3. Traitement de la réponse de l'IA
        if (response.statusCode() == 200) {
            JsonObject jsonResponse = JsonParser.parseString(response.body()).getAsJsonObject();
            return jsonResponse.get("predicted_price").getAsDouble();
        } else {
            throw new RuntimeException("Erreur de l'API Flask : Code " + response.statusCode());
        }
    }
}