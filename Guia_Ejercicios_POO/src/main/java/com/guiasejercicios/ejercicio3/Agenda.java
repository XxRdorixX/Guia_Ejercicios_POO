/**
 * Clase que gestiona la lista de contactos con base de datos
 * Autor: Rodrigo Ernesto Escobar Rivas
 * Fecha: 25/4/2025
 */

package com.guiasejercicios.ejercicio3;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Clase que maneja la lógica de la agenda:
 * - Agregar, listar y buscar contactos en MySQL.
 */
public class Agenda {

    /**
     * Guarda un nuevo contacto en la BD.
     */
    public void agregarContacto(Contacto contacto) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBUtil.getConnection();  // Obtiene conexión
            String sql = "INSERT INTO contactos (nombre, telefono, email) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);

            // Asigna parámetros al query
            stmt.setString(1, contacto.getNombre());
            stmt.setString(2, contacto.getTelefono());
            stmt.setString(3, contacto.getEmail());

            stmt.executeUpdate();
        } finally {
            if (stmt != null) stmt.close();
            DBUtil.closeConnection(conn);
        }
    }

    /**
     * Obtiene TODOS los contactos de la BD.
     */
    public List<Contacto> getContactos() throws SQLException {
        List<Contacto> contactos = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM contactos ORDER BY nombre");

            // Convierte cada fila de la BD en un objeto Contacto
            while (rs.next()) {
                Contacto c = new Contacto();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setTelefono(rs.getString("telefono"));
                c.setEmail(rs.getString("email"));
                contactos.add(c);
            }

        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            DBUtil.closeConnection(conn);
        }

        return contactos;
    }

    /**
     * Busca contactos por nombre
     */
    public List<Contacto> buscarPorNombre(String nombre) throws SQLException {
        List<Contacto> resultados = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM contactos WHERE nombre LIKE ? ORDER BY nombre";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + nombre + "%");
            rs = stmt.executeQuery();

            while (rs.next()) {
                Contacto c = new Contacto();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setTelefono(rs.getString("telefono"));
                c.setEmail(rs.getString("email"));
                resultados.add(c);
            }

        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            DBUtil.closeConnection(conn);
        }

        return resultados;
    }
}

