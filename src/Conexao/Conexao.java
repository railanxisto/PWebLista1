package Conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
	
	public Connection getConnection() throws SQLException{
        return DriverManager.getConnection(
                "jdbc:mysql://localhost/lista1","root","admin");
    }
	
//	public Connection getConnection() {
//	    // strings de conexão
//	    String databaseURL = "jdbc:postgresql://localhost/findtdcl_argoUML";
//	    String usuario = "findtdcl_findtd";
//	    String senha = "findtd8662@@";
//	    String driverName = "org.postgresql.Driver";
		
//		String databaseURL = "jdbc:postgresql://localhost/findtdcl_argoUMLPlanilha";
//	    String usuario = "findtdcl";
//	    String senha = "eJ-24%#8Wr!";
//	    String driverName = "org.postgresql.Driver";
	    
//		String databaseURL = "jdbc:postgresql://localhost/findtdcl_jfreechart";
//	    String usuario = "findtdcl";
//	    String senha = "eJ-24%#8Wr!";
//	    String driverName = "org.postgresql.Driver";
////	    
////	    
////	    String databaseURL = "jdbc:postgresql://localhost/ArgoPlanilha";
////	    String usuario = "postgres";
////	    String senha = "admin";
////	    String driverName = "org.postgresql.Driver";
//	    
//	    try {
//	      Class.forName(driverName).newInstance();
//	      Connection conn = DriverManager.getConnection(databaseURL, usuario, senha);
//	      return conn;
//	    }
//	    catch (SQLException ex) {
//	      System.out.println("SQLException: " + ex.getMessage());
//	      System.out.println("SQLState: " + ex.getSQLState());
//	      System.out.println("VendorError: " + ex.getErrorCode());
//		  return null;
//	    }
//	    catch (Exception e) {
//	      System.out.println("Problemas ao tentar conectar com o banco de dados: " + e);
//		  return null;
//	    }  
//	  }
		
		// Carrega driver JDBC
	    
	 
	    //Obtem conexao com banco de dados
	    
//	}
}
