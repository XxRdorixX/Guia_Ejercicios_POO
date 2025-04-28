<%--
  Autor: Rodrigo Ernesto Escobar Rivas
  Fecha: 27/4/2025
--%>
<%@ page import="com.guiasejercicios.ejercicio3.Agenda" %>
<%@ page import="com.guiasejercicios.ejercicio3.Contacto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // Configuración inicial
  Agenda agenda = new Agenda();
  String mensaje = "";
  boolean mostrarError = false;
  String accion = request.getParameter("accion");
  List<Contacto> contactos = null;
  List<Contacto> resultadosBusqueda = null;
  String busqueda = request.getParameter("busqueda");
  boolean formularioEnviado = "POST".equals(request.getMethod());

  // Procesar acciones solo si hay una acción específica
  if (accion != null) {
    try {
      switch (accion) {
        case "agregar":
          // Solo validar si se envió el formulario (método POST)
          if (formularioEnviado) {
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");

            // Validaciones
            if (nombre == null || nombre.trim().isEmpty()) {
              throw new Exception("El nombre es requerido");
            }
            if (telefono == null || telefono.trim().isEmpty()) {
              throw new Exception("El teléfono es requerido");
            }
            if (email == null || email.trim().isEmpty()) {
              throw new Exception("El email es requerido");
            }
            if (!email.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
              throw new Exception("El email no tiene un formato válido");
            }

            // Agregar contacto si pasa validaciones
            Contacto nuevo = new Contacto(nombre, telefono, email);
            agenda.agregarContacto(nuevo);
            mensaje = "Contacto agregado correctamente";
          }
          break;

        case "buscar":
          // Solo validar si se envió el formulario de búsqueda
          if (formularioEnviado) {
            if (busqueda == null || busqueda.trim().isEmpty()) {
              throw new Exception("Debe ingresar un nombre para buscar");
            }
            resultadosBusqueda = agenda.buscarPorNombre(busqueda);
            if (resultadosBusqueda.isEmpty()) {
              mensaje = "No se encontraron contactos con ese nombre";
            }
          }
          break;

        case "listar":
          // La lista se carga automáticamente al final
          break;
      }
    } catch (Exception e) {
      mensaje = "Error: " + e.getMessage();
      mostrarError = true;
    }
  }

  // Cargar todos los contactos para la vista de listado
  contactos = agenda.getContactos();
%>
<!DOCTYPE html>
<html>
<head>
  <title>Agenda de Contactos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { padding: 20px; }
    .form-container { max-width: 600px; margin: 0 auto; }
    .tab-content { padding: 20px 0; }
    .nav-tabs { margin-bottom: 20px; }
    .search-box { margin-bottom: 20px; }
  </style>
</head>
<body>
<div class="container">
  <h1 class="text-center mb-4">Agenda de Contactos</h1>

  <%-- Mostrar mensajes solo cuando corresponda --%>
  <% if (mostrarError && !mensaje.isEmpty()) { %>
  <div class="alert alert-danger"><%= mensaje %></div>
  <% } else if (!mensaje.isEmpty()) { %>
  <div class="alert alert-info"><%= mensaje %></div>
  <% } %>

  <!-- Pestañas de navegación -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link <%= (accion == null || accion.equals("agregar")) ? "active" : "" %>"
         href="Ejercicio3.jsp?accion=agregar">Agregar Contacto</a>
    </li>
    <li class="nav-item">
      <a class="nav-link <%= (accion != null && accion.equals("listar")) ? "active" : "" %>"
         href="Ejercicio3.jsp?accion=listar">Ver Contactos</a>
    </li>
    <li class="nav-item">
      <a class="nav-link <%= (accion != null && accion.equals("buscar")) ? "active" : "" %>"
         href="Ejercicio3.jsp?accion=buscar">Buscar Contacto</a>
    </li>
  </ul>

  <!-- Contenido de las pestañas -->
  <div class="tab-content">
    <% if (accion == null || accion.equals("agregar")) { %>
    <!-- Formulario para agregar contacto -->
    <form method="post" action="Ejercicio3.jsp">
      <input type="hidden" name="accion" value="agregar">
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre:</label>
        <input type="text" class="form-control" id="nombre" name="nombre" required>
      </div>
      <div class="mb-3">
        <label for="telefono" class="form-label">Teléfono:</label>
        <input type="text" class="form-control" id="telefono" name="telefono" required>
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Email:</label>
        <input type="email" class="form-control" id="email" name="email" required>
      </div>
      <button type="submit" class="btn btn-primary">Agregar Contacto</button>
    </form>

    <% } else if (accion.equals("listar")) { %>
    <!-- Lista de contactos -->
    <h3>Lista de Contactos</h3>
    <% if (contactos.isEmpty()) { %>
    <p class="text-muted">No hay contactos en la agenda.</p>
    <% } else { %>
    <div class="table-responsive">
      <table class="table table-striped">
        <thead class="table-dark">
        <tr>
          <th>Nombre</th>
          <th>Teléfono</th>
          <th>Email</th>
        </tr>
        </thead>
        <tbody>
        <% for (Contacto c : contactos) { %>
        <tr>
          <td><%= c.getNombre() %></td>
          <td><%= c.getTelefono() %></td>
          <td><%= c.getEmail() %></td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </div>
    <% } %>

    <% } else if (accion.equals("buscar")) { %>
    <!-- Búsqueda de contactos -->
    <div class="search-box">
      <form method="post" action="Ejercicio3.jsp">
        <input type="hidden" name="accion" value="buscar">
        <div class="input-group">
          <input type="text" class="form-control" name="busqueda"
                 placeholder="Ingrese nombre a buscar" value="<%= busqueda != null ? busqueda : "" %>">
          <button type="submit" class="btn btn-primary">Buscar</button>
        </div>
      </form>
    </div>

    <% if (resultadosBusqueda != null) { %>
    <h3>Resultados de la búsqueda</h3>
    <% if (resultadosBusqueda.isEmpty()) { %>
    <p class="text-muted">No se encontraron contactos con ese nombre.</p>
    <% } else { %>
    <div class="table-responsive">
      <table class="table table-striped">
        <thead class="table-dark">
        <tr>
          <th>Nombre</th>
          <th>Teléfono</th>
          <th>Email</th>
        </tr>
        </thead>
        <tbody>
        <% for (Contacto c : resultadosBusqueda) { %>
        <tr>
          <td><%= c.getNombre() %></td>
          <td><%= c.getTelefono() %></td>
          <td><%= c.getEmail() %></td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </div>
    <% } %>
    <% } %>
    <% } %>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
