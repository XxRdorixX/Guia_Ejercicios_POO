<%--
  Autor: Edgar José Mejia Hernández
  Fecha: 25/4/2025
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.guiasejercicios.ejercicio5.dao.ClienteDAO" %>
<%@ page import="com.guiasejercicios.ejercicio5.dao.ClienteDAOImpl" %>
<%@ page import="com.guiasejercicios.ejercicio5.model.*" %>
<%@ page import="java.util.List" %>

<%
    ClienteDAO clienteDAO = new ClienteDAOImpl();
    List<Cliente> clientesConDetalles = clienteDAO.obtenerTodosClientesConDetalles();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio 5 - Car Clean</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }

        h1, h2 {
            color: #fff;
            text-align: center;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            width: 600px;
            margin-bottom: 40px;
        }

        fieldset {
            border: 2px solid #007bff;
            padding: 25px;
            margin-bottom: 25px;
            border-radius: 10px;
            background-color: #e6f7ff;
        }

        legend {
            font-weight: bold;
            color: #007bff;
            padding: 10px 20px;
            border: 2px solid #007bff;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        label {
            display: inline-block;
            width: 200px;
            text-align: left;
            margin-right: 20px;
            color: #555;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select {
            flex-grow: 1;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 16px;
            color: #333;
        }

        input[type="checkbox"] {
            margin-left: 200px;
            transform: scale(1.3);
        }

        button[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            width: 100%;
            display: block;
            margin-top: 30px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        button[type="submit"]:hover {
            background-color: #1e7e34;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .client-list {
            margin-top: 40px;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 1200px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border: 2px solid #007bff;
            border-radius: 10px;
            overflow: hidden;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: left;
            color: #444;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-align: center;
            text-transform: uppercase;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #e0f7fa;
            cursor: pointer;
        }

        .vip {
            color: green;
            font-weight: bold;
        }

        .error-message {
            color: red;
            margin: 10px 0;
            padding: 10px;
            background-color: #ffeeee;
            border: 1px solid #ffcccc;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<h1>Ejercicio 5 - Sistema Car Clean</h1>

<div class="form-container">
    <form action="procesar_registro" method="post">
        <fieldset>
            <legend>Información del Cliente</legend>
            <div class="form-group">
                <label for="nombres">Nombres:</label>
                <input type="text" id="nombres" name="nombres" required>
            </div>
            <div class="form-group">
                <label for="apellidos">Apellidos:</label>
                <input type="text" id="apellidos" name="apellidos" required>
            </div>
            <div class="form-group">
                <label for="vip">¿Tiene Tarjeta VIP?</label>
                <div>
                    <input type="checkbox" id="vip" name="vip">
                    <span style="margin-left: 15px; color: #6c757d;">Marcar si el cliente es VIP</span>
                </div>
            </div>
        </fieldset>

        <fieldset>
            <legend>Información del Vehículo</legend>
            <div class="form-group">
                <label for="marca">Marca:</label>
                <input type="text" id="marca" name="marca" required>
            </div>
            <div class="form-group">
                <label for="modelo">Modelo:</label>
                <input type="text" id="modelo" name="modelo" required>
            </div>
            <div class="form-group">
                <label for="year">Año:</label>
                <input type="number" id="year" name="year">
            </div>
        </fieldset>

        <fieldset>
            <legend>Servicio Solicitado</legend>
            <div class="form-group">
                <label for="tipo_servicio">Tipo de Servicio:</label>
                <select id="tipo_servicio" name="tipo_servicio" required>
                    <option value="">Seleccione un servicio</option>
                    <option value="1">Motocicleta ($2.75)</option>
                    <option value="2">Sedan ($3.50)</option>
                    <option value="3">Camioneta ($4.00)</option>
                    <option value="4">Microbús ($5.00)</option>
                    <option value="5">Autobús ($7.00)</option>
                </select>
            </div>
        </fieldset>

        <button type="submit">Registrar Cliente y Servicio</button>
    </form>
</div>

<div class="client-list">
    <h2>Lista de Clientes Registrados</h2>

    <% if (request.getParameter("error") != null) { %>
    <div class="error-message">
        <%= request.getParameter("error") %>
    </div>
    <% } %>

    <% if (clientesConDetalles != null && !clientesConDetalles.isEmpty()) { %>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre Completo</th>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Año</th>
            <th>Tipo de Servicio</th>
            <th>Precio</th>
            <th>¿Aplica Descuento?</th>
            <th>Total a Pagar</th>
        </tr>
        </thead>
        <tbody>
        <% for (Cliente cliente : clientesConDetalles) {
            Automotor automotor = cliente.getAutomotores().isEmpty() ? null : cliente.getAutomotores().get(0);
            Servicio servicio = cliente.getServicios().isEmpty() ? null : cliente.getServicios().get(0);
            double precioFinal = 0.0;
            if (servicio != null) {
                precioFinal = cliente.totalPago(servicio.getPrecio());
            }
            boolean aplicaDescuento = cliente.isVip();
        %>
        <tr>
            <td><%= cliente.getId() %></td>
            <td><%= cliente.getNombres() %> <%= cliente.getApellidos() %>
                <% if (cliente.isVip()) { %>
                <span class="vip">(VIP)</span>
                <% } %>
            </td>
            <td><%= (automotor != null) ? automotor.getMarca() : "" %></td>
            <td><%= (automotor != null) ? automotor.getModelo() : "" %></td>
            <td><%= (automotor != null && automotor.getYear() != null) ? automotor.getYear() : "" %></td>
            <td><%= (servicio != null) ? servicio.getTipo() : "" %></td>
            <td><%= (servicio != null) ? String.format("%.2f", servicio.getPrecio()) : "" %></td>
            <td><%= (aplicaDescuento) ? "Sí" : "No" %></td>
            <td><%= String.format("%.2f", precioFinal) %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p>No hay clientes registrados aún.</p>
    <% } %>
</div>
</body>
</html>D