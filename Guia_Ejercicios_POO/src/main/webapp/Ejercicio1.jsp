<%--
  Autor: Gladis DEl carmen Rivas Miranda
  Fecha: 27/4/2025
--%>
<%@ page import="com.guiasejercicios.ejercicio1.Estudiante" %>
<%@ page import="com.guiasejercicios.ejercicio1.Validador" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Variables para manejo del estado
    boolean mostrarFormulario = true;
    Estudiante estudiante = null;
    String mensajeError = null;

    // Procesar datos si es POST
    if ("POST".equals(request.getMethod())) {
        try {
            // Crear objeto estudiante
            estudiante = new Estudiante();
            estudiante.setCarnet(request.getParameter("carnet"));
            estudiante.setNombres(request.getParameter("nombres"));
            estudiante.setApellidos(request.getParameter("apellidos"));
            estudiante.setDireccion(request.getParameter("direccion"));
            estudiante.setTelefono(request.getParameter("telefono"));
            estudiante.setEmail(request.getParameter("email"));
            estudiante.setFechaNacimiento(request.getParameter("fechaNacimiento"));

            // Validar los datos
            Validador.validarEstudiante(estudiante);

            // Si pasa validación, mostrar resultados
            mostrarFormulario = false;

        } catch (Exception e) {
            mensajeError = e.getMessage();
            mostrarFormulario = true;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Ficha de Estudiante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { padding: 20px; background-color: #f8f9fa; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 15px rgba(0,0,0,0.1); }
        h1 { color: #2c3e50; margin-bottom: 30px; text-align: center; }
        .alert { margin-bottom: 25px; }
        .form-label { font-weight: 500; }
        .btn-container { margin-top: 25px; display: flex; gap: 15px; }
        table { margin-top: 30px; }
        th { background-color: #2c3e50; color: white; }
    </style>
</head>
<body>
<div class="container">
    <h1>Ficha de Estudiante</h1>

    <% if (mostrarFormulario) { %>
    <!-- SECCIÓN DEL FORMULARIO -->
    <% if (mensajeError != null) { %>
    <div class="alert alert-danger">
        <strong>Error:</strong> <%= mensajeError %>
    </div>
    <% } %>

    <form method="post">
        <div class="mb-3">
            <label for="carnet" class="form-label">Carnet (2 letras + 4 números):</label>
            <input type="text" class="form-control" id="carnet" name="carnet"
                   value="<%= request.getParameter("carnet") != null ? request.getParameter("carnet") : "" %>" required>
        </div>

        <div class="mb-3">
            <label for="nombres" class="form-label">Nombres (max 25 caracteres):</label>
            <input type="text" class="form-control" id="nombres" name="nombres"
                   value="<%= request.getParameter("nombres") != null ? request.getParameter("nombres") : "" %>" required maxlength="25">
        </div>

        <div class="mb-3">
            <label for="apellidos" class="form-label">Apellidos (max 25 caracteres):</label>
            <input type="text" class="form-control" id="apellidos" name="apellidos"
                   value="<%= request.getParameter("apellidos") != null ? request.getParameter("apellidos") : "" %>" required maxlength="25">
        </div>

        <div class="mb-3">
            <label for="direccion" class="form-label">Dirección (max 255 caracteres):</label>
            <textarea class="form-control" id="direccion" name="direccion" rows="3" required maxlength="255"><%= request.getParameter("direccion") != null ? request.getParameter("direccion") : "" %></textarea>
        </div>

        <div class="mb-3">
            <label for="telefono" class="form-label">Teléfono (formato 0000-0000):</label>
            <input type="text" class="form-control" id="telefono" name="telefono"
                   value="<%= request.getParameter("telefono") != null ? request.getParameter("telefono") : "" %>" required pattern="\d{4}-\d{4}">
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email" name="email"
                   value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>
        </div>

        <div class="mb-3">
            <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento (DD/MM/YYYY):</label>
            <input type="text" class="form-control" id="fechaNacimiento" name="fechaNacimiento"
                   value="<%= request.getParameter("fechaNacimiento") != null ? request.getParameter("fechaNacimiento") : "" %>" required pattern="(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/(19|20)\d{2}">
        </div>

        <div class="btn-container">
            <button type="submit" class="btn btn-primary">Enviar Datos</button>
            <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al Inicio</a>
        </div>
    </form>

    <% } else { %>
    <!-- SECCIÓN DE RESULTADOS -->
    <div class="alert alert-success">
        <strong>Éxito:</strong> Los datos del estudiante han sido validados correctamente.
    </div>

    <table class="table table-bordered">
        <thead class="table-dark">
        <tr>
            <th>Campo</th>
            <th>Valor</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><strong>Carnet</strong></td>
            <td><%= estudiante.getCarnet() %></td>
        </tr>
        <tr>
            <td><strong>Nombres</strong></td>
            <td><%= estudiante.getNombres() %></td>
        </tr>
        <tr>
            <td><strong>Apellidos</strong></td>
            <td><%= estudiante.getApellidos() %></td>
        </tr>
        <tr>
            <td><strong>Dirección</strong></td>
            <td><%= estudiante.getDireccion() %></td>
        </tr>
        <tr>
            <td><strong>Teléfono</strong></td>
            <td><%= estudiante.getTelefono() %></td>
        </tr>
        <tr>
            <td><strong>Email</strong></td>
            <td><%= estudiante.getEmail() %></td>
        </tr>
        <tr>
            <td><strong>Fecha de Nacimiento</strong></td>
            <td><%= estudiante.getFechaNacimiento() %></td>
        </tr>
        </tbody>
    </table>

    <div class="btn-container">
        <a href="Ejercicio1.jsp" class="btn btn-primary">Registrar otro estudiante</a>
        <a href="index.jsp" class="btn btn-secondary">Volver al Inicio</a>
    </div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

