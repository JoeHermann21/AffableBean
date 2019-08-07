/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author e.andre.germano
 */
public class ConectaBanco {

//    public Statement stm_mysql;
//    public ResultSet rs_mysql;
//    public Integer contact_mysql;    

    public static Connection getConexao() {

        Connection conexao = null;

        try {
//            Class.forName("com.mysql.jdbc.Driver");

            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/affablebean?"
                    + "useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&"
                    + "useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "123456");
//        } catch (ClassNotFoundException erro1) {
//            throw new RuntimeException(erro1);
        } catch (SQLException erro2) {
            throw new RuntimeException(erro2.getMessage());
        }
        return conexao;
    }

//    public void executaSQL(String sql) {
//        Connection conexao = null;
//        try {
//            stm_mysql = conexao.createStatement(rs_mysql.TYPE_SCROLL_INSENSITIVE, rs_mysql.CONCUR_READ_ONLY);
//            rs_mysql = stm_mysql.executeQuery(sql);
//            contact_mysql = 1;
//        } catch (SQLException ex) {
//            contact_mysql = 0;
//            //JOptionPane.showMessageDialog(null, "Erro de ExecutaSQL!\nERRO:" + ex.getMessage());
//        }
//
//    }

}
