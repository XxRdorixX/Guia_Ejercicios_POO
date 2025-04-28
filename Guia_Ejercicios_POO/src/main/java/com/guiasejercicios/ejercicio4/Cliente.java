/**
 * Autor: Yeymi Johana De Paz Fernández
 * Fecha: 27/4/2025
 */
package com.guiasejercicios.ejercicio4;

public class Cliente {
    private String nombreCompleto;
    private String sexo;

    public Cliente(String nombreCompleto, String sexo) {
        if (nombreCompleto == null || nombreCompleto.isEmpty()) {
            throw new IllegalArgumentException("El nombre no puede estar vacío");
        }
        if (sexo == null || (!sexo.equalsIgnoreCase("masculino") && !sexo.equalsIgnoreCase("femenino"))) {
            throw new IllegalArgumentException("Sexo inválido. Debe ser 'masculino' o 'femenino'");
        }
        this.nombreCompleto = nombreCompleto;
        this.sexo = sexo;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public String getSexo() {
        return sexo;
    }

    @Override
    public String toString() {
        return "Cliente: " + nombreCompleto + " (" + sexo + ")";
    }
}