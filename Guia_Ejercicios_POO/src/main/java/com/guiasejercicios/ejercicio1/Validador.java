/**
 * Clase para validar los datos del estudiante
 * Autor: Gladis DEl carmen Rivas Miranda
 * Fecha: 27/4/2025
 */

package com.guiasejercicios.ejercicio1;

public class Validador {

    /**
     * Valida todos los campos del estudiante
     * @param estudiante Objeto Estudiante a validar
     * @throws Exception con mensaje de error si la validación falla
     */
    public static void validarEstudiante(Estudiante estudiante) throws Exception {
        if (estudiante == null) {
            throw new Exception("El estudiante no puede ser nulo");
        }

        validarCarnet(estudiante.getCarnet());
        validarNombres(estudiante.getNombres());
        validarApellidos(estudiante.getApellidos());
        validarDireccion(estudiante.getDireccion());
        validarTelefono(estudiante.getTelefono());
        validarEmail(estudiante.getEmail());
        validarFechaNacimiento(estudiante.getFechaNacimiento());
    }

    /**
     * Valida el formato del carnet (2 letras + 4 números)
     */
    public static void validarCarnet(String carnet) throws Exception {
        if (carnet == null || carnet.trim().isEmpty()) {
            throw new Exception("El carnet es requerido");
        }
        if (!carnet.matches("^[A-Za-z]{2}\\d{4}$")) {
            throw new Exception("El carnet debe tener 2 letras seguidas de 4 números");
        }
    }

    /**
     * Valida los nombres (máximo 25 caracteres)
     */
    public static void validarNombres(String nombres) throws Exception {
        if (nombres == null || nombres.trim().isEmpty()) {
            throw new Exception("Los nombres son requeridos");
        }
        if (nombres.length() > 25) {
            throw new Exception("Los nombres no pueden exceder los 25 caracteres");
        }
    }

    /**
     * Valida los apellidos (máximo 25 caracteres)
     */
    public static void validarApellidos(String apellidos) throws Exception {
        if (apellidos == null || apellidos.trim().isEmpty()) {
            throw new Exception("Los apellidos son requeridos");
        }
        if (apellidos.length() > 25) {
            throw new Exception("Los apellidos no pueden exceder los 25 caracteres");
        }
    }

    /**
     * Valida la dirección (máximo 255 caracteres)
     */
    public static void validarDireccion(String direccion) throws Exception {
        if (direccion == null || direccion.trim().isEmpty()) {
            throw new Exception("La dirección es requerida");
        }
        if (direccion.length() > 255) {
            throw new Exception("La dirección no puede exceder los 255 caracteres");
        }
    }

    /**
     * Valida el teléfono (formato 0000-0000)
     */
    public static void validarTelefono(String telefono) throws Exception {
        if (telefono == null || telefono.trim().isEmpty()) {
            throw new Exception("El teléfono es requerido");
        }
        if (!telefono.matches("^\\d{4}-\\d{4}$")) {
            throw new Exception("El teléfono debe tener el formato 0000-0000");
        }
    }

    /**
     * Valida el email (formato válido)
     */
    public static void validarEmail(String email) throws Exception {
        if (email == null || email.trim().isEmpty()) {
            throw new Exception("El email es requerido");
        }
        if (!email.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            throw new Exception("El email no tiene un formato válido");
        }
    }

    /**
     * Valida la fecha de nacimiento (formato DD/MM/YYYY)
     */
    public static void validarFechaNacimiento(String fecha) throws Exception {
        if (fecha == null || fecha.trim().isEmpty()) {
            throw new Exception("La fecha de nacimiento es requerida");
        }
        if (!fecha.matches("^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/(19|20)\\d{2}$")) {
            throw new Exception("La fecha debe tener el formato DD/MM/YYYY");
        }
    }
}