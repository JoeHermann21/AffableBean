package testeComClassesMainQuemPrecisaDeJUnit;


import java.sql.Connection;
import util.ConectaBanco;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author e.andre.germano
 */
public class TesteBanco {
    
    ConectaBanco cb = null;    
    
    public static void main(String[] args) {
        
        ConectaBanco.getConexao();
        
        if (ConectaBanco.getConexao()==null){
            System.out.println("nulo");
        }else{
            System.out.println("Deu certo!!!");
        }
    }
}
