package it.unisa.model;

import java.sql.SQLException;

public interface UserDAO {
	
	public int saveUser(UserBean user) throws SQLException; // salva utente
	
	public int deleteUser(UserBean user) throws SQLException; // delete utente
	
	public UserBean findByCred(String email, String password) throws SQLException; // utente con le credenziali

	boolean isEmailPresente(String email) throws SQLException;
	
}
