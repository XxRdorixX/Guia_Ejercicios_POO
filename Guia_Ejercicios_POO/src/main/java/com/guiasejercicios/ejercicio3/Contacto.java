/**
 * Clase que representa un contacto en la agenda
 * Autor: Rodrigo Ernesto Escobar Rivas
 * Fecha: 25/4/2025
 */

package com.guiasejercicios.ejercicio3;

public class Contacto {
    private int id;             // ID único en la BD
    private String nombre;      // Nombre del contacto
    private String telefono;    // Teléfono
    private String email;       // Email

    public Contacto() {
    }
    // Constructor con parámetros
    public Contacto(String nombre, String telefono, String email) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.email = email;
    }

    // --- Getters y Setters ---
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
