/**
 * Autor: Edgar José Mejia Hernández
 * Fecha: 27/4/2025
 */

package com.guiasejercicios.ejercicio5.dao;

import com.guiasejercicios.ejercicio5.model.Cliente;
import com.guiasejercicios.ejercicio5.model.Automotor;
import com.guiasejercicios.ejercicio5.model.Servicio;
import com.guiasejercicios.ejercicio5.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ClienteDAOImpl implements ClienteDAO {

    @Override
    public void guardarCliente(Cliente cliente, Automotor automotor, int servicioId) {
        String clienteSql = "INSERT INTO clientes (nombres, apellidos, vip) VALUES (?, ?, ?)";
        String automotorSql = "INSERT INTO automotores (cliente_id, marca, modelo, year) VALUES (?, ?, ?, ?)";
        String servicioSql = "INSERT INTO clientes_servicios (cliente_id, servicio_id) VALUES (?, ?)";
        Connection connection = null;
        PreparedStatement clienteStmt = null;
        PreparedStatement automotorStmt = null;
        PreparedStatement servicioStmt = null;
        ResultSet generatedKeys = null;

        try {
            connection = DatabaseConnection.getConnection();
            connection.setAutoCommit(false);

            clienteStmt = connection.prepareStatement(clienteSql, Statement.RETURN_GENERATED_KEYS);
            clienteStmt.setString(1, cliente.getNombres());
            clienteStmt.setString(2, cliente.getApellidos());
            clienteStmt.setBoolean(3, cliente.isVip());
            clienteStmt.executeUpdate();

            generatedKeys = clienteStmt.getGeneratedKeys();
            int clienteId = 0;
            if (generatedKeys.next()) {
                clienteId = generatedKeys.getInt(1);
                cliente.setId(clienteId);
            } else {
                throw new SQLException("No se pudo obtener el ID del cliente generado.");
            }

            automotorStmt = connection.prepareStatement(automotorSql);
            automotorStmt.setInt(1, clienteId);
            automotorStmt.setString(2, automotor.getMarca());
            automotorStmt.setString(3, automotor.getModelo());
            automotorStmt.setObject(4, automotor.getYear());
            automotorStmt.executeUpdate();

            servicioStmt = connection.prepareStatement(servicioSql);
            servicioStmt.setInt(1, clienteId);
            servicioStmt.setInt(2, servicioId);
            servicioStmt.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            DatabaseConnection.closeResultSet(generatedKeys);
            DatabaseConnection.closeStatement(clienteStmt);
            DatabaseConnection.closeStatement(automotorStmt);
            DatabaseConnection.closeStatement(servicioStmt);
            DatabaseConnection.closeConnection(connection);
        }
    }

    @Override
    public List<Cliente> obtenerTodosClientesConDetalles() {
        List<Cliente> clientes = new ArrayList<>();
        Map<Integer, Cliente> clienteMap = new HashMap<>();
        String sql = "SELECT c.id as cliente_id, c.nombres, c.apellidos, c.vip, " +
                "a.id as automotor_id, a.marca, a.modelo, a.year, " +
                "s.id as servicio_id, s.tipo as servicio_tipo, s.precio as servicio_precio " +
                "FROM clientes c " +
                "LEFT JOIN automotores a ON c.id = a.cliente_id " +
                "LEFT JOIN clientes_servicios cs ON c.id = cs.cliente_id " +
                "LEFT JOIN servicios s ON cs.servicio_id = s.id";
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int clienteId = resultSet.getInt("cliente_id");

                Cliente cliente = clienteMap.get(clienteId);
                if (cliente == null) {
                    cliente = new Cliente(clienteId, resultSet.getString("nombres"), resultSet.getString("apellidos"), resultSet.getBoolean("vip"));
                    clientes.add(cliente);
                    clienteMap.put(clienteId, cliente);
                }

                int automotorId = resultSet.getInt("automotor_id");
                if (automotorId > 0) {
                    Automotor automotor = new Automotor(automotorId, clienteId, resultSet.getString("marca"), resultSet.getString("modelo"), (Integer) resultSet.getObject("year"));
                    boolean exists = false;
                    for (Automotor existingAutomotor : cliente.getAutomotores()) {
                        if (existingAutomotor.getId() == automotorId) {
                            exists = true;
                            break;
                        }
                    }
                    if (!exists) {
                        cliente.agregarAutomotor(automotor);
                    }
                }

                int servicioId = resultSet.getInt("servicio_id");
                if (servicioId > 0) {
                    Servicio servicio = new Servicio(servicioId, resultSet.getString("servicio_tipo"), resultSet.getDouble("servicio_precio"));
                    boolean exists = false;
                    for (Servicio existingServicio : cliente.getServicios()) {
                        if (existingServicio.getId() == servicioId) {
                            exists = true;
                            break;
                        }
                    }
                    if (!exists) {
                        cliente.agregarServicio(servicio);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnection.closeResultSet(resultSet);
            DatabaseConnection.closeStatement(statement);
            DatabaseConnection.closeConnection(connection);
        }
        return clientes;
    }

    @Override
    public Cliente obtenerClientePorId(int id) {
        Cliente cliente = null;
        String sql = "SELECT id, nombres, apellidos, vip FROM clientes WHERE id = ?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnection.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                cliente = new Cliente();
                cliente.setId(resultSet.getInt("id"));
                cliente.setNombres(resultSet.getString("nombres"));
                cliente.setApellidos(resultSet.getString("apellidos"));
                cliente.setVip(resultSet.getBoolean("vip"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseConnection.closeResultSet(resultSet);
            DatabaseConnection.closeStatement(preparedStatement);
            DatabaseConnection.closeConnection(connection);
        }
        return cliente;
    }
}