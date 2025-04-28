/**
 * Autor: Edgar José Mejia Hernández
 * Fecha: 27/4/2025
 */

package com.guiasejercicios.ejercicio5.dao;

import com.guiasejercicios.ejercicio5.model.Cliente;
import com.guiasejercicios.ejercicio5.model.Automotor;
import com.guiasejercicios.ejercicio5.model.Servicio;
import java.util.List;

public interface ClienteDAO {
    void guardarCliente(Cliente cliente, Automotor automotor, int servicioId);
    List<Cliente> obtenerTodosClientesConDetalles();
    Cliente obtenerClientePorId(int id);
}