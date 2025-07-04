/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pollapp.dao;
import java.sql.*;

public class connection {
    private Connection con;
    String url = "jdbc:mysql://localhost:3306/Poll_app";
    String pass = "1234";
    String name = "root";
    public connection(){
    }
    public Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,name,pass);
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
