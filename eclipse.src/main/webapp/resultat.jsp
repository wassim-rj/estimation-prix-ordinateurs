<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Résultat Estimation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 card shadow p-4 text-center bg-white">
                <h2 class="mb-4 text-secondary">Résultat de la prédiction</h2>
                
                <% if(request.getAttribute("erreur") != null) { %>
                    <div class="alert alert-danger"><%= request.getAttribute("erreur") %></div>
                <% } else { %>
                    <div class="alert alert-success py-4">
                        <h4 class="text-muted">Le prix estimé par notre modèle ML est :</h4>
                        <p class="display-5 fw-bold text-success mt-3">
                            <%= request.getAttribute("prixEstime") %> $
                        </p>
                    </div>
                <% } %>
                
                <a href="predict.jsp" class="btn btn-outline-primary mt-2">Faire une autre estimation</a>
            </div>
        </div>
    </div>
</body>
</html>