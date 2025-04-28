/**
 * Autor: Yeymi Johana De Paz Fernández
 * Fecha: 27/4/2025
 */
package com.guiasejercicios.ejercicio4;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ImportadoraServlet", value = "/ejercicio4/importadora")
public class ImportadoraServlet extends HttpServlet {
    // Variables de estadísticas
    private static int nissanCount = 0;
    private static double nissanTotal = 0;
    private static int toyotaCount = 0;
    private static double toyotaTotal = 0;
    private static int kiaCount = 0;
    private static double kiaTotal = 0;
    private static int vehiclesBetween2000And2015 = 0;
    private static int vehiclesBetween2016And2025 = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Mostrar solo el formulario
        request.setAttribute("mostrarResultados", false);
        request.getRequestDispatcher("/Ejercicio4.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String sexo = request.getParameter("sexo");
        String marca = request.getParameter("marca");
        int year = 0;
        double precio = 0.0;
        boolean error = false;

        try {
            year = Integer.parseInt(request.getParameter("year"));
            precio = Double.parseDouble(request.getParameter("precio"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Formato numérico inválido para año o precio");
            error = true;
        }

        // Validaciones adicionales
        if (nombre == null || nombre.trim().isEmpty()) {
            request.setAttribute("error", "El nombre no puede estar vacío");
            error = true;
        }
        if (sexo == null || (!sexo.equalsIgnoreCase("masculino") && !sexo.equalsIgnoreCase("femenino"))) {
            request.setAttribute("error", "Sexo inválido. Debe ser 'masculino' o 'femenino'");
            error = true;
        }
        if (marca == null || (!marca.equalsIgnoreCase("Nissan") && !marca.equalsIgnoreCase("Toyota") && !marca.equalsIgnoreCase("Kia"))) {
            request.setAttribute("error", "Marca inválida. Debe ser 'Nissan', 'Toyota' o 'Kia'");
            error = true;
        }
        if (year < 2000 || year > 2025) {
            request.setAttribute("error", "El año debe estar entre 2000 y 2025");
            error = true;
        }
        if (precio <= 0) {
            request.setAttribute("error", "El precio debe ser mayor a 0");
            error = true;
        }

        if (error) {
            request.setAttribute("mostrarResultados", false);
            request.getRequestDispatcher("/Ejercicio4.jsp").forward(request, response);
            return;
        }

        // Procesar datos válidos
        if (marca.equalsIgnoreCase("Nissan")) {
            nissanCount++;
            nissanTotal += precio;
        } else if (marca.equalsIgnoreCase("Toyota")) {
            toyotaCount++;
            toyotaTotal += precio;
        } else if (marca.equalsIgnoreCase("Kia")) {
            kiaCount++;
            kiaTotal += precio;
        }

        if (year >= 2000 && year <= 2015) {
            vehiclesBetween2000And2015++;
        } else if (year >= 2016 && year <= 2025) {
            vehiclesBetween2016And2025++;
        }

        // Configurar atributos para la vista
        request.setAttribute("mostrarResultados", true);
        request.setAttribute("nombre", nombre);
        request.setAttribute("sexo", sexo);
        request.setAttribute("marca", marca);
        request.setAttribute("year", year);
        request.setAttribute("precio", precio);
        request.setAttribute("nissanCount", nissanCount);
        request.setAttribute("nissanTotal", nissanTotal);
        request.setAttribute("toyotaCount", toyotaCount);
        request.setAttribute("toyotaTotal", toyotaTotal);
        request.setAttribute("kiaCount", kiaCount);
        request.setAttribute("kiaTotal", kiaTotal);
        request.setAttribute("vehiclesBetween2000And2015", vehiclesBetween2000And2015);
        request.setAttribute("vehiclesBetween2016And2025", vehiclesBetween2016And2025);

        // Redirigir a la vista
        request.getRequestDispatcher("/Ejercicio4.jsp").forward(request, response);
    }
}