/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pollapp.dao;
 
import com.pollapp.model.Users;
import java.sql.*;
import java.util.*;
public class UsersDao {
    
    private Connection con;
    
    public UsersDao(Connection con){
        this.con = con;
    }
    
  public boolean checkAD(String email) {
    String qr = "SELECT * FROM users WHERE email = ? AND role = 'admin'";
    try {
        PreparedStatement pr = con.prepareStatement(qr);
        pr.setString(1, email);
        ResultSet rs = pr.executeQuery();
        return rs.next(); // agar result mila to true
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
     
         public boolean registerUser(Users user) {
              
             // this query is set data in Users table 
             String sql = "INSERT INTO users (name, email, password, role, salt) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());
            ps.setString(5, user.getSal());
            return ps.executeUpdate()>0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
       
       }
         
         
         public Users LoginDao(String email){
       System.out.println("hello,........");
     Users st=null;
   
     String qr = "SELECT * FROM users WHERE email = ?";
     try{
        
         PreparedStatement prstmt = con.prepareStatement(qr);
         prstmt.setString(1,email);

         ResultSet rs = prstmt.executeQuery();
         if(rs.next()){ 
             st = new Users();
             st.setId(rs.getInt("id"));
         st.setName(rs.getString("name"));
         st.setRole(rs.getString("role"));
         st.setSal(rs.getString("salt"));
         st.setPassword(rs.getString("password"));
         }
         else{
         st = null;
         }
         
     }catch(Exception e){
       
      e.printStackTrace();
     }
     
     return st;
 }
         
         
         public List<Users> getAllUsers() {
    List<Users> users = new ArrayList<>();
    String sql = "SELECT * FROM users WHERE role = 'user'";
    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Users user = new Users();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setRole(rs.getString("role"));
            users.add(user);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return users;
}

}
