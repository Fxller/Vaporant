package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ContenutoDaoImpl implements ContenutoDAO{
	private static final String TABLE = "Contenuto";
	@Override
	public int saveContenuto(ContenutoBean contenutoOrdine) throws SQLException {
		Connection connection = null;
        PreparedStatement preparedStatement = null;
        int result;

        String insertSQL = "INSERT INTO " + ContenutoDaoImpl.TABLE
                           + " (ID_Ordine, ID_Prodotto, quantita, prezzoAcquisto, ivaAcquisto)"
                           + " VALUES (?, ?, ?, ?, ?)";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);

            preparedStatement.setInt(1, contenutoOrdine.getId_ordine());
            preparedStatement.setInt(2, contenutoOrdine.getId_prodotto());
            preparedStatement.setInt(3, contenutoOrdine.getQuantita());
            preparedStatement.setFloat(4, contenutoOrdine.getPrezzoAcquisto());
            preparedStatement.setInt(5, contenutoOrdine.getIvaAcquisto());



            result = preparedStatement.executeUpdate();
            
            connection.commit();

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
                
            } finally {
                
            	DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        
        return result;
	}

	@Override
	public int deleteContenuto(ContenutoBean contenutoOrdine) throws SQLException {
		Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        String selectSQL = "DELETE * FROM " + TABLE + " WHERE ID_Ordine = ? AND ID_Prodotto = ?";
        
        int result;
        
        try
        {
        	connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            
            preparedStatement.setInt(1, contenutoOrdine.getId_ordine());
            preparedStatement.setInt(2, contenutoOrdine.getId_prodotto());
            result = preparedStatement.executeUpdate();   
            
            connection.commit();
        	
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
            	
               DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        
        return result;
	}

	@Override
	public ContenutoBean findByKey(int id_ordine, int id_prodotto) throws SQLException {
		Connection connection = null;
        PreparedStatement preparedStatement = null;

        String selectSQL = "SELECT * FROM " + TABLE + " WHERE ID_Ordine = ? AND ID_Prodotto = ?";
        ContenutoBean contenutoOrdine = null;

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            
            preparedStatement.setInt(1, id_ordine);
            preparedStatement.setInt(2, id_prodotto);

            
            ResultSet rs = preparedStatement.executeQuery();
            if(!rs.isBeforeFirst()) return null;
            
            contenutoOrdine = new ContenutoBean();
           
           while (rs.next()) {
        	   contenutoOrdine.setId_ordine(rs.getInt("ID_Ordine"));
        	   contenutoOrdine.setId_prodotto(rs.getInt("ID_Prodotto"));
        	   contenutoOrdine.setIvaAcquisto(rs.getInt("ivaAcquisto"));
        	   contenutoOrdine.setPrezzoAcquisto(rs.getFloat("prezzoAcquisto"));
        	   contenutoOrdine.setQuantita(rs.getInt("quantita"));
            }
            
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        
        return contenutoOrdine;
	}
	
}
