package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class UserDaoImpl implements UserDAO {
	
	private static final String TABLE = "Utente";
    
	@Override
	public int saveUser(UserBean user) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int result;

        String insertSQL = "INSERT INTO " + UserDaoImpl.TABLE
                           + " (ID, nome, cognome, dataNascita, CF, numTelefono, email, psw, citta, provincia, cap, via, numCivico,"
                           + "stato, tipo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);

            preparedStatement.setInt(1, user.getId());
            preparedStatement.setString(2, user.getNome());
            preparedStatement.setString(3, user.getCognome());
            preparedStatement.setString(4, user.getDataNascita().toString());
            preparedStatement.setString(5, user.getCodF());
            preparedStatement.setString(6, user.getNumTelefono());
            preparedStatement.setString(7, user.getEmail());
            preparedStatement.setString(8, user.getPassword());
            preparedStatement.setString(9, user.getCitta());
            preparedStatement.setString(10, user.getProvincia());
            preparedStatement.setInt(11, user.getCap());
            preparedStatement.setString(12, user.getVia());
            preparedStatement.setInt(13, user.getNumCivico());
            preparedStatement.setString(14, user.getStato());
            preparedStatement.setString(15, user.getTipo());

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

	@Override
	public UserBean findByCred(String email, String password) throws SQLException {
		
		Connection connection = null;
        PreparedStatement preparedStatement = null;

        String selectSQL = "SELECT * FROM " + TABLE + " WHERE email = ? AND psw = ?";
        UserBean user = null;

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet rs = preparedStatement.executeQuery();
            if(!rs.next()) return null;
            
            user = new UserBean();
           
           while (rs.next()) {

                user.setEmail(rs.getString("email"));
                user.setCodF(rs.getString("CF"));
                user.setNome(rs.getString("nome"));
                user.setCognome(rs.getString("cognome"));
                user.setVia(rs.getString("via"));
                user.setCitta(rs.getString("citta"));
                user.setProvincia(rs.getString("provincia"));
                user.setCap(Integer.parseInt(rs.getString("cap")));
                user.setNumTelefono(rs.getString("numTelefono"));
                user.setStato(rs.getString("stato"));
                user.setId(Integer.parseInt(rs.getString("ID")));
                user.setPassword(rs.getString("psw"));
                user.setTipo(rs.getString("tipo"));
                user.setNumCivico(Integer.parseInt(rs.getString("numCivico")));
                user.setDataNascita(LocalDate.parse(rs.getDate("dataNascita").toString()));
               
            }
            
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        
        return user;
	}

}
