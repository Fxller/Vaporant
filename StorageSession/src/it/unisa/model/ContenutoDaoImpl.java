package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ContenutoDaoImpl implements ContenutoDAO{
	private static final String TABLE = "Contenuto";
    private static DataSource ds;

    
	//connessione al database
	static {
	    try {
	        Context initCtx = new InitialContext();
	        Context envCtx = (Context) initCtx.lookup("java:comp/env");
	
	        ds = (DataSource) envCtx.lookup("jdbc/storage");
	
	    } catch (NamingException e) {
	        System.out.println("Error:" + e.getMessage());
	    }
	}
	

	@Override
	public int saveContenuto(ContenutoBean contenutoOrdine) throws SQLException {
		Connection connection = null;
        PreparedStatement preparedStatement = null;
        int result;

        String insertSQL = "INSERT INTO " + ContenutoDaoImpl.TABLE
                           + " (ID_Ordine, ID_Prodotto, quantita, prezzoAcquisto, ivaAcquisto)"
                           + " VALUES (?, ?, ?, ?, ?)";

        try {
        	connection = ds.getConnection();
        	preparedStatement = connection.prepareStatement(insertSQL);

            preparedStatement.setInt(1, contenutoOrdine.getId_ordine());
            preparedStatement.setInt(2, contenutoOrdine.getId_prodotto());
            preparedStatement.setInt(3, contenutoOrdine.getQuantita());
            preparedStatement.setFloat(4, contenutoOrdine.getPrezzoAcquisto());
            preparedStatement.setInt(5, contenutoOrdine.getIvaAcquisto());



            result = preparedStatement.executeUpdate();            
            updateStorage(contenutoOrdine.getId_prodotto(), contenutoOrdine.getQuantita());

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
                
            } finally {
            	if(connection != null) {
            		connection.close();
            	}
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
        	connection = ds.getConnection();
        	preparedStatement = connection.prepareStatement(selectSQL);
            
            preparedStatement.setInt(1, contenutoOrdine.getId_ordine());
            preparedStatement.setInt(2, contenutoOrdine.getId_prodotto());
            result = preparedStatement.executeUpdate();   
                    	
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
            	if(connection != null) {
            		connection.close();
            	}
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

        	connection = ds.getConnection();
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
            
            	if(connection != null) {
            		connection.close();
            	}
            }
        }
        
        return contenutoOrdine;
	}
	
	private int updateStorage(int id, int quant) throws SQLException {
		Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        String selectSQL = "UPDATE prodotto SET quantita = quantita - ? WHERE ID = ?";
        
        int result;
        
        try
        {
        	connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2, quant);
            result = preparedStatement.executeUpdate();   
                    	
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
            	if(connection != null) {
            		connection.close();
            	}
            	
            }
        }
		return result;
	}
}
