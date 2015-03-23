/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Apollo
 */
public class Account {
    String name;
    String email;
    Connection conn = null;

    public Account(){
        try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:project");
        }catch(Exception ex){
            
        }
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
    
    public ResultSet getAllAccount(){
        ResultSet rs = null;
        try{
            String sqlSelect = "Select * from User_Account";
            Statement st = conn.createStatement();
            rs = st.executeQuery(sqlSelect);
        }catch(Exception ex){
                
        }
        return rs;
    }
    
    public String getPassword(){
        ResultSet rs = null;
        try{
            String sqlSelect = "Select * from User_Account where User_Name='"+name+"'";
            Statement st = conn.createStatement();
            rs = st.executeQuery(sqlSelect);
            return rs.getString(5);
        }catch(Exception ex){
               return null; 
        }
    }
}
