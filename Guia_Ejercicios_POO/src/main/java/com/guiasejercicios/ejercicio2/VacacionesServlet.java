/**
 * Autor: Yeymi Johana De Paz Fernández
 * Fecha: 27/4/2025
 */
package com.guiasejercicios.ejercicio2;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/ejercicio2/calcular")
public class VacacionesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        int antiguedad = Integer.parseInt(request.getParameter("antiguedad"));

        // Calcular días de vacaciones
        int diasVacaciones;

        if (antiguedad <= 1) {
            diasVacaciones = 6;
        } else if (antiguedad <= 5) {
            diasVacaciones = 14;
        } else if (antiguedad <= 10) {
            diasVacaciones = 20;
        } else {
            diasVacaciones = 30;
        }

        // Guardar resultados como atributos de la request
        request.setAttribute("nombre", nombre);
        request.setAttribute("diasVacaciones", diasVacaciones);
        request.setAttribute("mostrarResultados", true);

        // Redireccionar al JSP unificado
        request.getRequestDispatcher("/Ejercicio2.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mostrar solo el formulario
        request.setAttribute("mostrarResultados", false);
        request.getRequestDispatcher("/Ejercicio2.jsp").forward(request, response);
    }
}