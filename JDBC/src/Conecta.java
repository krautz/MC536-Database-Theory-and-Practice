import java.sql.*;
import javax.swing.JOptionPane;

// Classe para estabelecer conexao ao banco de dados
public class Conecta {   
    public static Connection getConnection() { 
    	
    	// Constantes para conexao com o banco de dados
    	final String DriverURL = "com.mysql.jdbc.Driver";
    	final String usuario = "ra177012";  
    	final String endereco = "jdbc:mysql://sql.lab.ic.unicamp.br:3306/db_" + usuario;
    	final String senha = "gee3oChi";

        java.sql.Connection Conexao = null;
        
          try {
        	  
        	  // Driver JDBC
              Class.forName(DriverURL);
              
              // Conexao ao banco
              Conexao = DriverManager.getConnection(endereco,usuario,senha);
              return  Conexao;
              
          } catch (Exception e) {   
                 JOptionPane.showMessageDialog(null, e, "ERRO", JOptionPane.ERROR_MESSAGE);    
          }  
         return  Conexao;       
    }   
    
}


			
                       