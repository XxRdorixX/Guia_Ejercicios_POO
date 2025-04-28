/**
 * Autor: Yeymi Johana De Paz Fernández
 * Fecha: 27/4/2025
 */
package com.guiasejercicios.ejercicio4;

public class Vehiculo {
    private String marca;
    private int year;
    private double precio;

    public Vehiculo(String marca, int year, double precio) {
        if (marca == null || (!marca.equalsIgnoreCase("Nissan") && !marca.equalsIgnoreCase("Toyota") && !marca.equalsIgnoreCase("Kia"))) {
            throw new IllegalArgumentException("Marca inválida. Debe ser 'Nissan', 'Toyota' o 'Kia'");
        }
        if (year < 2000 || year > 2025) {
            throw new IllegalArgumentException("El año debe estar entre 2000 y 2025");
        }
        if (precio <= 0) {
            throw new IllegalArgumentException("El precio debe ser mayor a 0");
        }
        this.marca = marca;
        this.year = year;
        this.precio = precio;
    }

    public String getMarca() {
        return marca;
    }

    public int getYear() {
        return year;
    }

    public double getPrecio() {
        return precio;
    }

    @Override
    public String toString() {
        return "Vehículo: " + marca + " (" + year + ") - Precio: $" + precio;
    }
}