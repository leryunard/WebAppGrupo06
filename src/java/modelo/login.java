/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Carlos Rafaelano
 */
public class login {
//variables de la clase

    private String login;
    private String clave;
    private String nombre;
    private int nivel;

//constructor con parametros
    public login(String login, String clave, String nombre, int nivel) {
        this.login = login;
        this.clave = clave;
        this.nombre = nombre;
        this.nivel = nivel;
    }

//constructor sin parametros
    public login() {

    }

//setters y getters
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

}
