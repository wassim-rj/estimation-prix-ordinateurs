<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Estimation Ordinateur - IA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-3 text-end">
    <span class="badge bg-secondary p-2">Bienvenue, <%= session.getAttribute("userNom") %> !</span>
</div>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 card shadow p-4 bg-white">
                <h2 class="text-center mb-4 text-primary">Estimer le prix d'un PC (IA)</h2>
                <form action="PredictionServlet" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Marque :</label>
                        <select name="brand" class="form-select" required>
                            <option value="Dell">Dell</option>
                            <option value="Lenovo">Lenovo</option>
                            <option value="HP">HP</option>
                            <option value="ASUS">ASUS</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Taille Écran (pouces) :</label>
                        <input type="number" step="0.1" name="screen_size" class="form-control" value="15.6" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">RAM (GB) :</label>
                        <input type="number" name="ram" class="form-control" value="16" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Processeur :</label>
                        <select name="processor" class="form-select" required>
                            <option value="Intel Core i5 11th Gen.">Intel Core i5 11ème Génération</option>
                            <option value="Intel Core i7 10th Gen.">Intel Core i7 10ème Génération</option>
                            <option value="Intel Core i5 7th Gen.">Intel Core i5 7ème Génération</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">État (Condition) :</label>
                        <select name="condition" class="form-select" required>
                            <option value="New">Neuf (New)</option>
                            <option value="Open box">Boîte ouverte (Open box)</option>
                            <option value="Very Good - Refurbished">Remis à neuf (Refurbished)</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Lancer l'estimation</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>