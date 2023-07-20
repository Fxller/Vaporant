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
                           + " (nome, cognome, dataNascita, CF, numTelefono, email, psw, indirizzoFatt)"
                           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
        	connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);

            preparedStatement.setString(1, user.getNome());
            preparedStatement.setString(2, user.getCognome());
            preparedStatement.setString(3, user.getDataNascita().toString());
            preparedStatement.setString(4, user.getCodF());
            preparedStatement.setString(5, user.getNumTelefono());
            preparedStatement.setString(6, user.getEmail());
            preparedStatement.setString(7, user.getPassword());
            preparedStatement.setString(8, user.getIndirizzoFatt());

 
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
               user.setIndirizzoFatt(rs.getString("indirizzoFatt"));
               
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

@Override
public UserBean findById(int ID) throws SQLException {
	
	Connection connection = null;
    PreparedStatement preparedStatement = null;

    String selectSQL = "SELECT * FROM " + TABLE + " WHERE ID = ?";
    UserBean user = null;

    try {
    	connection = ds.getConnection();
        preparedStatement = connection.prepareStatement(selectSQL);
        
        preparedStatement.setInt(1, ID);
     

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

@Override
public void modifyMail(UserBean user, String email) throws SQLException{
	Connection connection = null;
    PreparedStatement preparedStatement = null;
    String modify = "UPDATE utente SET email = ? "
    				+ " WHERE ID = ?";
    try {
    	connection = ds.getConnection();
        preparedStatement = connection.prepareStatement(modify);
        
        preparedStatement.setString(1, email);
        preparedStatement.setInt(2, user.getId());
        
        preparedStatement.executeUpdate();
          
        
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
}
@Override
public void modifyTelefono(UserBean user, String cell) throws SQLException{
	Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    
    String modify = "UPDATE utente SET numTelefono = ? "
    				+ " WHERE ID = ?";
    try {
    	connection = ds.getConnection();
        preparedStatement = connection.prepareStatement(modify);
        
        preparedStatement.setString(1, cell);
        preparedStatement.setInt(2, user.getId());
        
        preparedStatement.executeUpdate();
               
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
}

@Override
public int modifyPsw(String newPsw, String oldPsw, UserBean user) throws SQLException{
	Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    if(oldPsw.compareTo(user.getPassword()) != 0) {
    	return 0;
    }
    String modify = "UPDATE utente SET psw = ? "
			+ " WHERE ID = ? AND psw = ?";
    try {
    	connection = ds.getConnection();
        preparedStatement = connection.prepareStatement(modify);
        
        preparedStatement.setString(1, newPsw);
        preparedStatement.setInt(2, user.getId());
        preparedStatement.setString(3, oldPsw);

        
        preparedStatement.executeUpdate();
               
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
    return 1;
}
@Override
public void updateAddress(String address, UserBean user) throws SQLException {
    user.setIndirizzoFatt(address);

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    String updateSQL = "UPDATE " + TABLE + " SET indirizzoFatt = ? WHERE ID = ?";

    try {
        connection = ds.getConnection();
        preparedStatement = connection.prepareStatement(updateSQL);
        preparedStatement.setString(1, address);
        preparedStatement.setInt(2, user.getId());
        preparedStatement.executeUpdate();

    } finally {
        try {
            if (preparedStatement != null)
                preparedStatement.close();
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }
}
}
