<%--
  Autor: Héctor Antonio Guillen Serrano
  Fecha: 27-4-2025
--%>
<%@ page import="com.guiasejercicios.ejercicio2.VacacionesServlet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cálculo de Vacaciones - Ejercicio 2</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --color-primary: #2c3e50;
            --color-secondary: #3498db;
            --color-success: #28a745;
        }
        body {
            padding-top: 60px;
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container-main {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .btn-return {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
            background-color: var(--color-primary);
            color: white;
        }
        .header-title {
            color: var(--color-primary);
            border-bottom: 2px solid var(--color-secondary);
            padding-bottom: 10px;
            margin-bottom: 25px;
        }
        .form-section, .results-section {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<!-- Botón para volver al menú -->
<a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary btn-return">
    <i class="bi bi-house-door"></i> Menú Principal
</a>

<div class="container-main">
    <h1 class="text-center header-title">
        <i class="bi bi-calendar-check"></i> Cálculo de Vacaciones
    </h1>

    <!-- Mensajes de error -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger">
            <i class="bi bi-exclamation-triangle"></i> ${error}
        </div>
    </c:if>

    <!-- Sección del formulario -->
    <c:if test="${not mostrarResultados}">
        <div class="form-section">
            <form action="${pageContext.request.contextPath}/ejercicio2/calcular" method="post">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>
                <div class="mb-3">
                    <label for="antiguedad" class="form-label">Años de antigüedad:</label>
                    <input type="number" class="form-control" id="antiguedad" name="antiguedad" min="0" required>
                </div>
                <button type="submit" class="btn btn-success">
                    <i class="bi bi-calculator"></i> Calcular
                </button>
            </form>
        </div>
    </c:if>

    <!-- Sección de resultados -->
    <c:if test="${mostrarResultados}">
        <div class="results-section">
            <div class="alert alert-success">
                <h3><i class="bi bi-check-circle"></i> Resultado del Cálculo</h3>
                <p>Hola, <strong>${nombre}</strong>!</p>
                <p>Te corresponden <strong>${diasVacaciones}</strong> días de vacaciones.</p>
            </div>
            <a href="${pageContext.request.contextPath}/Ejercicio2.jsp" class="btn btn-primary">
                <i class="bi bi-arrow-repeat"></i> Nuevo Cálculo
            </a>
        </div>
    </c:if>
</div>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>