/**
 * Autor: Edgar José Mejia Hernández
 * Fecha: 27/4/2025
 */
package com.guiasejercicios.ejercicio5.model;

import java.util.ArrayList;
import java.util.List;

public class Cliente implements ITotalPago {
    private int id;
    private String nombres;
    private String apellidos;
    private boolean vip;
    private List<Automotor> automotores = new ArrayList<>();
    private List<Servicio> servicios = new ArrayList<>();

    public Cliente() {
    }

    public Cliente(int id, String nombres, String apellidos, boolean vip) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.vip = vip;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public boolean isVip() {
        return vip;
    }

    public void setVip(boolean vip) {
        this.vip = vip;
    }

    public List<Automotor> getAutomotores() {
        return automotores;
    }

    public void setAutomotores(List<Automotor> automotores) {
        this.automotores = automotores;
    }

    public List<Servicio> getServicios() {
        return servicios;
    }

    public void setServicios(List<Servicio> servicios) {
        this.servicios = servicios;
    }

    public void agregarAutomotor(Automotor automotor) {
        this.automotores.add(automotor);
    }

    public void agregarServicio(Servicio servicio) {
        this.servicios.add(servicio);
    }

    @Override
    public double totalPago(double precioServicio) {
        if (this.vip) {
            return precioServicio * 0.85;
        } else {
            return precioServicio;
        }
    }
}