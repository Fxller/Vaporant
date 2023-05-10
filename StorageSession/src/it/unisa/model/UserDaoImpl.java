package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class UserDaoImpl implements UserDAO {
	
	private static final String TABLE = "utente";
    
	@Override
	public int saveUser(UserBean user) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int result;

        String insertSQL = "INSERT INTO " + UserDaoImpl.TABLE
                           + " (nome, cognome, dataNascita, CF, numTelefono, email, psw, citta, provincia, cap, via, numCivico,"
                           + "stato) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);

            preparedStatement.setString(1, user.getNome());
            preparedStatement.setString(2, user.getCognome());
            preparedStatement.setString(3, user.getDataNascita().toString());
            preparedStatement.setString(4, user.getCodF());
            preparedStatement.setString(5, user.getNumTelefono());
            preparedStatement.setString(6, user.getEmail());
            preparedStatement.setString(7, user.getPassword());
            preparedStatement.setString(8, user.getCitta());
            preparedStatement.setString(9, user.getProvincia());
            preparedStatement.setString(10, Integer.toString(user.getCap()));
            preparedStatement.setString(11, user.getVia());
            preparedStatement.setInt(12, user.getNumCivico());
            preparedStatement.setString(13, user.getStato());

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
            if(!rs.isBeforeFirst()) return null;
            
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
