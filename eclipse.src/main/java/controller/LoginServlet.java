package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Configuration JDBC de votre MySQL sous Fedora
        String dbUrl = "jdbc:mysql://localhost:3306/pc_db"; 
        String dbUser = "root"; 
        String dbPass = ""; 

        try {
            // Chargement du pilote JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
                String sql = "SELECT * FROM utilisateurs WHERE email = ? AND mot_de_passe = ?";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, email);
                    pstmt.setString(2, password);
                    
                    ResultSet rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
                        // Connexion réussie -> On crée une session pour l'utilisateur
                        HttpSession session = request.getSession();
                        session.setAttribute("userNom", rs.getString("nom"));
                        
                        // Redirection vers le formulaire de l'IA
                        response.sendRedirect("predict.jsp");
                    } else {
                        // Échec
                        request.setAttribute("erreurLogin", "Email ou mot de passe incorrect !");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erreurLogin", "Erreur BDD : " + e.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}