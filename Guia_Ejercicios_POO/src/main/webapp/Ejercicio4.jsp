<%--
  Autor: Yeymi Johana De Paz Fernández
  Fecha: 27/4/2025
--%>
<%@ page import="com.guiasejercicios.ejercicio4.Vehiculo" %>
<%@ page import="com.guiasejercicios.ejercicio4.Cliente" %>
<%@ page import="com.guiasejercicios.ejercicio4.ImportadoraServlet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Importadora de Vehículos - Ejercicio 4</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --color-primary: #2c3e50;
            --color-secondary: #3498db;
            --color-success: #28a745;
            --color-danger: #dc3545;
        }

        body {
            padding-top: 60px;
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container-main {
            max-width: 900px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 25px rgba(0,0,0,0.08);
        }

        .btn-return {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
            background-color: var(--color-primary);
            color: white;
            border: none;
            padding: 10px 20px;
            font-weight: 500;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-return:hover {
            background-color: var(--color-secondary);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            color: white;
        }

        .header-title {
            color: var(--color-primary);
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid var(--color-secondary);
        }

        .section-title {
            color: var(--color-primary);
            margin: 30px 0 20px;
            font-size: 1.4rem;
        }

        .form-label.required:after {
            content: " *";
            color: var(--color-danger);
        }

        .table th {
            background-color: var(--color-primary);
            color: white;
            vertical-align: middle;
        }

        .table td {
            vertical-align: middle;
        }

        .alert {
            margin: 20px 0;
            border-radius: 5px;
        }

        .btn-submit {
            background-color: var(--color-success);
            border: none;
            padding: 10px 25px;
            font-weight: 500;
            color: white;
        }

        .btn-submit:hover {
            background-color: #218838;
            color: white;
        }

        .card {
            margin-bottom: 20px;
            border: none;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .card-title {
            color: var(--color-primary);
            font-weight: 600;
        }
    </style>
</head>
<body>
<!-- Botón de retorno corregido (usa contextPath) -->
<a href="${pageContext.request.contextPath}/index.jsp" class="btn-return">
    <i class="bi bi-house-door"></i> Menú Principal
</a>

<div class="container-main">
    <h1 class="header-title">
        <i class="bi bi-car-front"></i> Importadora de Vehículos
    </h1>

    <!-- Mensajes del sistema -->
    <c:if test="${not empty mensaje}">
        <div class="alert alert-success alert-dismissible fade show">
            <i class="bi bi-check-circle-fill"></i> ${mensaje}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show">
            <i class="bi bi-exclamation-triangle-fill"></i> ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <!-- Sección del formulario -->
    <div class="form-section">
        <h3 class="section-title">
            <i class="bi bi-pencil-square"></i> Registro de Vehículo
        </h3>

        <form action="${pageContext.request.contextPath}/ejercicio4/importadora" method="post" class="needs-validation" novalidate>
            <div class="row g-3">
                <div class="col-md-6">
                    <label for="nombre" class="form-label required">Nombre Completo</label>
                    <input type="text" class="form-control" id="nombre" name="nombre"
                           required pattern="[A-Za-záéíóúÁÉÍÓÚñÑ\s]{3,50}">
                    <div class="invalid-feedback">
                        Por favor ingrese un nombre válido (3-50 caracteres).
                    </div>
                </div>

                <div class="col-md-6">
                    <label for="sexo" class="form-label required">Sexo</label>
                    <select class="form-select" id="sexo" name="sexo" required>
                        <option value="">Seleccione...</option>
                        <option value="masculino">Masculino</option>
                        <option value="femenino">Femenino</option>
                    </select>
                    <div class="invalid-feedback">
                        Por favor seleccione un sexo válido.
                    </div>
                </div>

                <div class="col-md-6">
                    <label for="marca" class="form-label required">Marca del Vehículo</label>
                    <select class="form-select" id="marca" name="marca" required>
                        <option value="">Seleccione...</option>
                        <option value="Nissan">Nissan</option>
                        <option value="Toyota">Toyota</option>
                        <option value="Kia">Kia</option>
                    </select>
                    <div class="invalid-feedback">
                        Por favor seleccione una marca válida.
                    </div>
                </div>

                <div class="col-md-6">
                    <label for="year" class="form-label required">Año</label>
                    <input type="number" class="form-control" id="year" name="year"
                           min="2000" max="2025" required>
                    <div class="invalid-feedback">
                        El año debe estar entre 2000 y 2025.
                    </div>
                </div>

                <div class="col-md-6">
                    <label for="precio" class="form-label required">Precio ($)</label>
                    <input type="number" class="form-control" id="precio" name="precio"
                           step="0.01" min="5000" required>
                    <div class="invalid-feedback">
                        El precio debe ser mayor a $5000.
                    </div>
                </div>

                <div class="col-12 mt-4">
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-submit">
                            <i class="bi bi-save"></i> Registrar Vehículo
                        </button>
                        <button type="reset" class="btn btn-outline-secondary">
                            <i class="bi bi-eraser"></i> Limpiar Formulario
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- Sección de resultados (solo se muestra después de enviar) -->
    <c:if test="${mostrarResultados}">
        <div class="results-section">
            <h3 class="section-title">
                <i class="bi bi-card-checklist"></i> Resultados del Registro
            </h3>

            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><i class="bi bi-person"></i> Datos del Cliente</h5>
                            <p><strong>Nombre:</strong> ${nombre}</p>
                            <p><strong>Sexo:</strong> ${sexo}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><i class="bi bi-car-front"></i> Datos del Vehículo</h5>
                            <p><strong>Marca:</strong> ${marca}</p>
                            <p><strong>Año:</strong> ${year}</p>
                            <p><strong>Precio:</strong> $${precio}</p>
                        </div>
                    </div>
                </div>
            </div>

            <h4 class="section-title">
                <i class="bi bi-graph-up"></i> Estadísticas de Ventas
            </h4>

            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th><i class="bi bi-tag"></i> Marca</th>
                        <th><i class="bi bi-list-check"></i> Vehículos Vendidos</th>
                        <th><i class="bi bi-cash-stack"></i> Total Vendido</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Nissan</td>
                        <td>${nissanCount}</td>
                        <td>$${nissanTotal}</td>
                    </tr>
                    <tr>
                        <td>Toyota</td>
                        <td>${toyotaCount}</td>
                        <td>$${toyotaTotal}</td>
                    </tr>
                    <tr>
                        <td>Kia</td>
                        <td>${kiaCount}</td>
                        <td>$${kiaTotal}</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <h4 class="section-title">
                <i class="bi bi-calendar-range"></i> Ventas por Año
            </h4>

            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th><i class="bi bi-calendar"></i> Rango de Años</th>
                        <th><i class="bi bi-list-check"></i> Total Vendido</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>2000 - 2015</td>
                        <td>${vehiclesBetween2000And2015}</td>
                    </tr>
                    <tr>
                        <td>2016 - 2025</td>
                        <td>${vehiclesBetween2016And2025}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Validación de formulario -->
<script>
    (function() {
        'use strict';

        // Seleccionar todos los formularios con la clase needs-validation
        var forms = document.querySelectorAll('.needs-validation');

        // Validar cada formulario al intentar enviar
        Array.prototype.slice.call(forms)
            .forEach(function(form) {
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
    })();
</script>
</body>
</html>