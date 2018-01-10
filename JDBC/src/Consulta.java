import java.sql.Connection;
import java.sql.SQLException;

public class Consulta {

	public static void main(String[] args) {

	    Connection Conexao;

		try {
			
			// Tenta criar conexao com o banco de dados MySQL
	    	Conexao= Conecta.getConnection();
	    	
	    	// Criacao de Statement e da String de consulta
            java.sql.Statement Comando = Conexao.createStatement();
        	
			Consulta1(Comando);
			Consulta2(Comando);
            Consulta3(Comando);
            Consulta4(Comando);
            Consulta5(Comando);
            
            // Fechamento das conexoes
            Comando.close();
            Conexao.close();
		}
		catch (SQLException excecao) {
			
			// Tratamento em caso de erro de conexao
			System.out.println("SQLException:" + excecao.getLocalizedMessage());
			System.out.println("Erro de conexão ao servidor do banco de dados" + 
     "de dados: " + excecao);
     		

		}
	}

	private static void Consulta5(java.sql.Statement Comando) throws SQLException {
		String query;
		java.sql.ResultSet rsRegistro;
		// Consulta 5
		query = "SELECT round(AVG(P.CarbohydrateFor100gPer100ml),2) AS AVG_Carbohydrate, Brand_name FROM Product AS P INNER JOIN Brand_has_Product AS B_Product ON P.Product_id = B_Product.Product_id INNER JOIN Brand AS B ON B.Brand_id = B_Product.Brand_id GROUP BY Brand_name HAVING AVG_Carbohydrate > 0 ORDER BY AVG_Carbohydrate desc";
		rsRegistro = Comando.executeQuery(query);
		
		System.out.println("Consulta 5:");

		
		while(rsRegistro.next()){
		    System.out.println("Average of Carbohydrate: " +rsRegistro.getFloat("AVG_Carbohydrate"));
		    System.out.println("Brand: " +rsRegistro.getString("Brand_name"));
		    System.out.println("-------------------------------------------");
		}
	}

	private static void Consulta4(java.sql.Statement Comando) throws SQLException {
		String query;
		java.sql.ResultSet rsRegistro;
		// Consulta 4
		query = "SELECT COUNT(P.Product_id) AS Number_of_Allergens, Brand_name FROM Product AS P INNER JOIN Brand_has_Product AS B_Product ON P.Product_id = B_Product.Product_id INNER JOIN Product_has_Allergen AS P_Allergen ON P.Product_id = P_Allergen.Product_id INNER JOIN Allergen AS A ON A.Allergen_id = P_Allergen.Allergen_id INNER JOIN Brand AS B ON B.Brand_id = B_Product.Brand_id GROUP BY Brand_name ORDER BY Number_of_Allergens desc";
		rsRegistro = Comando.executeQuery(query);
		
		System.out.println("Consulta 4:");

		while(rsRegistro.next()){
		    System.out.println("Number of Allergens: " +rsRegistro.getInt("Number_of_Allergens"));
		    System.out.println("Brand: " +rsRegistro.getString("Brand_name"));
		    System.out.println("-------------------------------------------");
		}
	}

	private static void Consulta3(java.sql.Statement Comando) throws SQLException {
		String query;
		java.sql.ResultSet rsRegistro;
		// Consulta 3
		query = "SELECT COUNT(Product_name) AS Number_of_Products, Brand_name FROM Product AS P INNER JOIN Brand_has_Product AS B_Product ON P.Product_id = B_Product.Product_id INNER JOIN Brand AS B ON B.Brand_id = B_Product.Brand_id GROUP BY Brand_name ORDER BY Number_of_Products desc";
		rsRegistro = Comando.executeQuery(query);
		
		System.out.println("Consulta 3:");
		
		while(rsRegistro.next()){
		    System.out.println("Number of Products: " +rsRegistro.getInt("Number_of_Products"));
		    System.out.println("Brand: " +rsRegistro.getString("Brand_name"));
		    System.out.println("-------------------------------------------");
		}
	}

	private static void Consulta2(java.sql.Statement Comando) throws SQLException {
		String query;
		java.sql.ResultSet rsRegistro;
		// Consulta 2
		query = "SELECT Store_name, Product_name FROM Product AS P INNER JOIN Store_has_Product AS S_Product ON S_Product.Product_id = P.Product_id INNER JOIN Store AS S ON S.Store_id = S_Product.Store_id ORDER BY (Store_name)";
		rsRegistro = Comando.executeQuery(query);
		
		System.out.println("Consulta 2:");
 
		while(rsRegistro.next()){
		    System.out.println("Store: " +rsRegistro.getString("Store_name"));
		    System.out.println("Product: " +rsRegistro.getString("Product_name"));
		    System.out.println("-------------------------------------------");
		}
	}

	private static void Consulta1(java.sql.Statement Comando) throws SQLException {
		String query;
		// Consulta 1
		query = "SELECT Purchase_place_name, Product_name FROM Product AS P INNER JOIN Product_has_Purchase_place AS P_Place ON P.Product_id = P_Place.Product_id INNER JOIN Purchase_place AS Place ON Place.Purchase_place_id = P_Place.Purchase_place_id ORDER BY (Product_name)";
		java.sql.ResultSet rsRegistro = Comando.executeQuery(query);
		           
		System.out.println("Consulta 1: ");
		
		while(rsRegistro.next()){
		    System.out.println("Purchase Place: " +rsRegistro.getString("Purchase_place_name"));
		    System.out.println("Product: " +rsRegistro.getString("Product_name"));
		    System.out.println("-------------------------------------------");
		}
	}
	
	
}
