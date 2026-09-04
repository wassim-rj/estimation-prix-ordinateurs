<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion - Application IA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4 card shadow p-4 bg-white mt-5">
                <h3 class="text-center mb-4 text-primary">Connexion</h3>
                
                <% if(request.getAttribute("erreurLogin") != null) { %>
                    <div class="alert alert-danger"><%= request.getAttribute("erreurLogin") %></div>
                <% } %>

                <form action="LoginServlet" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Email :</label>
                        <input type="email" name="email" class="form-control" value="wassim@email.com" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mot de passe :</label>
                        <input type="password" name="password" class="form-control" value="123456" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Se connecter</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>