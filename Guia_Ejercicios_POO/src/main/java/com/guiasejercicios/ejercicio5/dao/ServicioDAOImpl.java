/**
 * Autor: Edgar José Mejia Hernández
 * Fecha: 27/4/2025
 */
package com.guiasejercicios.ejercicio5.dao;

import com.guiasejercicios.ejercicio5.model.Servicio;
import com.guiasejercicios.ejercicio5.util.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ServicioDAOImpl implements ServicioDAO {

    @Override
    public Servicio obtenerServicioPorId(int id) {
        String sql = "SELECT id, tipo, precio FROM servicios WHERE id = ?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Servicio servicio = null;

        try {
            connection = DatabaseConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                servicio = new Servicio();
                servicio.setId(resultSet.getInt("id"));
                servicio.setTipo(resultSet.getString("tipo"));
                servicio.setPrecio(resultSet.getDouble("precio"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnection.closeResultSet(resultSet);
            DatabaseConnection.closeStatement(preparedStatement);
            DatabaseConnection.closeConnection(connection);
        }
        return servicio;
    }

    @Override
    public List<Servicio> obtenerTodosServicios() {
        List<Servicio> servicios = new ArrayList<>();
        String sql = "SELECT id, tipo, precio FROM servicios";
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                Servicio servicio = new Servicio();
                servicio.setId(resultSet.getInt("id"));
                servicio.setTipo(resultSet.getString("tipo"));
                servicio.setPrecio(resultSet.getDouble("precio"));
                servicios.add(servicio);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnection.closeResultSet(resultSet);
            DatabaseConnection.closeStatement(statement);
            DatabaseConnection.closeConnection(connection);
        }
        return servicios;
    }
}