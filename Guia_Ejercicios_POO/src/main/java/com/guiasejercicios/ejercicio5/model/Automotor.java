/**
 * Autor: Edgar José Mejia Hernández
 * Fecha: 27/4/2025
 */

package com.guiasejercicios.ejercicio5.model;

public class Automotor {
    private int id;
    private int clienteId;
    private String marca;
    private String modelo;
    private Integer year;

    public Automotor() {
    }

    public Automotor(int id, int clienteId, String marca, String modelo, Integer year) {
        this.id = id;
        this.clienteId = clienteId;
        this.marca = marca;
        this.modelo = modelo;
        this.year = year;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClienteId() {
        return clienteId;
    }

    public void setClienteId(int clienteId) {
        this.clienteId = clienteId;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }
}