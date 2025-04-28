/**
 * Autor: Edgar José Mejia Hernández
 * Fecha: 27/4/2025
 */
package com.guiasejercicios.ejercicio5.dao;

import com.guiasejercicios.ejercicio5.model.Servicio;
import java.util.List;

public interface ServicioDAO {
    Servicio obtenerServicioPorId(int id);
    List<Servicio> obtenerTodosServicios();
}