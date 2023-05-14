package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDaoImpl implements UserDAO {
	
	private static final String TABLE = "utente";
	
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
	public int saveUser(UserBean user) throws SQLException {
        Connection connection = null;  		
        PreparedStatement preparedStatement = null;
        int result;

        String insertSQL = "INSERT INTO " + UserDaoImpl.TABLE
                           + " (nome, cognome, dataNascita, CF, numTelefono, email, psw)"
                           + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
        	connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);

            preparedStatement.setString(1, user.getNome());
            preparedStatement.setString(2, user.getCognome());
            preparedStatement.setString(3, user.getDataNascita().toString());
            preparedStatement.setString(4, user.getCodF());
            preparedStatement.setString(5, user.getNumTelefono());
            preparedStatement.setString(6, user.getEmail());
 
            result = preparedStatement.executeUpdate();
            connection.commit();

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
	public int deleteUser(UserBean user) throws SQLException {
		
		
		Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        String selectSQL = "DELETE * FROM " + TABLE + " WHERE id = ?";
        
        int result;
        
        try
        {
        	connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            
            preparedStatement.setInt(1, user.getId());
  
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
	
public UserBean findByCred(String email, String password) throws SQLException {
		
		Connection connection = null;
        PreparedStatement preparedStatement = null;

        String selectSQL = "SELECT * FROM " + TABLE + " WHERE email = ? AND psw = ?";
        UserBean user = null;

        try {
        	connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet rs = preparedStatement.executeQuery();
            if(!rs.isBeforeFirst()) return null;
            
            user = new UserBean();
           
           while (rs.next()) {

                user.setEmail(rs.getString("email"));
                user.setCodF(rs.getString("CF"));
                user.setNome(rs.getString("nome"));
                user.setCognome(rs.getString("cognome"));
                user.setNumTelefono(rs.getString("numTelefono"));
                user.setId(rs.getInt("ID"));
                user.setPassword(rs.getString("psw"));
                user.setTipo(rs.getString("tipo"));
                user.setDataNascita(LocalDate.parse(rs.getDate("dataNascita").toString()));
               
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
        
        return user;
	}
}
