package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MachineLearningClient;

@WebServlet("/PredictionServlet")
public class PredictionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Récupération des paramètres du formulaire HTML
        String brand = request.getParameter("brand");
        double screenSize = Double.parseDouble(request.getParameter("screen_size"));
        int ram = Integer.parseInt(request.getParameter("ram"));
        String processor = request.getParameter("processor");
        String condition = request.getParameter("condition");

        try {
            // 2. Appel du client ML (Modèle) pour obtenir l'estimation de l'IA
            double prixEstime = MachineLearningClient.getPredictedPrice(brand, screenSize, ram, processor, condition);
            
            // 3. On stocke le résultat pour la vue
            request.setAttribute("prixEstime", prixEstime);
            
        } catch (Exception e) {
            request.setAttribute("erreur", "Impossible de contacter le serveur de Machine Learning : " + e.getMessage());
            e.printStackTrace();
        }

        // 4. Redirection vers la vue résultat.jsp
        request.getRequestDispatcher("resultat.jsp").forward(request, response);
    }
}