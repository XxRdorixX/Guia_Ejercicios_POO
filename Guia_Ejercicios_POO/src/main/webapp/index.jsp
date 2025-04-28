<%--
  Autor: Rodrigo Ernesto Escobar Rivas
  Fecha: 27/4/2025
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Guía de Ejercicios POO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { padding: 2rem; background-color: #f8f9fa; }
        .header { text-align: center; margin-bottom: 3rem; }
        .exercise-card { margin-bottom: 2rem; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .card-header { font-weight: bold; font-size: 1.2rem; }
        .btn-exercise { width: 100%; margin-top: 1rem; }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Guía de Ejercicios POO</h1>
        <p class="lead">Seleccione un ejercicio</p>
    </div>

    <div class="row">
        <!-- Ejercicio 1 -->
        <div class="col-md-3">
            <div class="card exercise-card">
                <div class="card-header bg-primary text-white">Ejercicio 1</div>
                <div class="card-body">
                    <p class="card-text">Ficha de Estudiante</p>
                    <a href="Ejercicio1.jsp" class="btn btn-primary btn-exercise">Abrir</a>
                </div>
            </div>
        </div>

        <!-- Ejercicio 2 -->
        <div class="col-md-3">
            <div class="card exercise-card">
                <div class="card-header bg-info text-white">Ejercicio 2</div>
                <div class="card-body">
                    <p class="card-text">Cálculo de Vacaciones</p>
                    <a href="Ejercicio2.jsp" class="btn btn-info btn-exercise">Abrir</a>
                </div>
            </div>
        </div>

        <!-- Ejercicio 3 -->
        <div class="col-md-3">
            <div class="card exercise-card">
                <div class="card-header bg-success text-white">Ejercicio 3</div>
                <div class="card-body">
                    <p class="card-text">Agenda de Contactos</p>
                    <a href="Ejercicio3.jsp" class="btn btn-success btn-exercise">Abrir</a>
                </div>
            </div>
        </div>

        <!-- Ejercicio 4 -->
        <div class="col-md-3">
            <div class="card exercise-card">
                <div class="card-header bg-warning text-dark">Ejercicio 4</div>
                <div class="card-body">
                    <p class="card-text">Importadora de Vehículos</p>
                    <a href="Ejercicio4.jsp" class="btn btn-warning btn-exercise">Abrir</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Ejercicio 4=5 -->
    <div class="col-md-3">
        <div class="card exercise-card">
            <div class="card-header bg-warning text-dark">Ejercicio 5</div>
            <div class="card-body">
                <p class="card-text">Car Clean </p>
                <a href="Ejercicio5.jsp" class="btn btn-warning btn-exercise">Abrir</a>
            </div>
        </div>
    </div>
</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>