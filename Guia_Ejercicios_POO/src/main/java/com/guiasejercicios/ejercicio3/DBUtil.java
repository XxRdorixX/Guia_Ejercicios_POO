/**
 * Clase para manejar la conexión a la base de datos
 * Autor: Rodrigo Ernesto Escobar Rivas
 * Fecha: 25/4/2025
 */

package com.guiasejercicios.ejercicio3;

import java.sql.*;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/agenda_contactos";
    private static final String USER = "root";       // Usuario de BD
    private static final String PASSWORD = "";       // Contraseña

    /**
     * Obtiene una conexión a la BD.
     */
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Carga el driver de MySQL
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver JDBC no encontrado", e);
        }
    }

    /**
     * Cierra una conexión de forma segura.
     */
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexión: " + e.getMessage());
            }
        }
    }
}
