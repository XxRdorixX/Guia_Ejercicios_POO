/**
 * Autor: Edgar José Mejia Hernández
 * Fecha: 27/4/2025
 */
package com.guiasejercicios.ejercicio5.controller;

import com.guiasejercicios.ejercicio5.dao.ClienteDAO;
import com.guiasejercicios.ejercicio5.dao.ClienteDAOImpl;
import com.guiasejercicios.ejercicio5.dao.ServicioDAO;
import com.guiasejercicios.ejercicio5.dao.ServicioDAOImpl;
import com.guiasejercicios.ejercicio5.model.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/procesar_registro")
public class ProcesarRegistroServlet extends HttpServlet {
    private ClienteDAO clienteDAO = new ClienteDAOImpl();
    private ServicioDAO servicioDAO = new ServicioDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String vipParam = request.getParameter("vip");
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String yearParam = request.getParameter("year");
        String tipoServicioIdParam = request.getParameter("tipo_servicio");

        if (nombres == null || nombres.trim().isEmpty() ||
                apellidos == null || apellidos.trim().isEmpty() ||
                marca == null || marca.trim().isEmpty() ||
                modelo == null || modelo.trim().isEmpty() ||
                tipoServicioIdParam == null || tipoServicioIdParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/Ejercicio5.jsp?error=Todos los campos marcados con (*) son obligatorios.");
            return;
        }

        Integer year = null;
        if (yearParam != null && !yearParam.trim().isEmpty()) {
            try {
                year = Integer.parseInt(yearParam);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/Ejercicio5.jsp?error=El año debe ser un número entero.");
                return;
            }
        }

        int servicioId;
        try {
            servicioId = Integer.parseInt(tipoServicioIdParam);
            Servicio servicio = servicioDAO.obtenerServicioPorId(servicioId);
            if (servicio == null) {
                System.out.println("Servicio no encontrado para ID: " + servicioId);
                response.sendRedirect(request.getContextPath() + "/Ejercicio5.jsp?error=El servicio seleccionado no es válido. ID: " + servicioId);
                return;
            }
        } catch (NumberFormatException e) {
            System.out.println("Error al parsear servicio ID: " + tipoServicioIdParam);
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Ejercicio5.jsp?error=El servicio seleccionado no es válido.");
            return;
        }

        boolean vip = (vipParam != null && vipParam.equals("on"));

        Cliente cliente = new Cliente(0, nombres, apellidos, vip);
        Automotor automotor = new Automotor(0, 0, marca, modelo, year);

        clienteDAO.guardarCliente(cliente, automotor, servicioId);

        response.sendRedirect(request.getContextPath() + "/Ejercicio5.jsp");
    }
}