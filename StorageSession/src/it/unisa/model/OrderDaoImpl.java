package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderDaoImpl implements OrderDAO {

  private static final String TABLE = "Ordine";
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
  public int saveOrder(OrderBean ordine) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    int result;

    String insertSQL =
      "INSERT INTO " +
      OrderDaoImpl.TABLE +
      " (ID_Utente, ID_Indirizzo, prezzoTot, dataAcquisto, metodoPagamento)" +
      " VALUES (?, ?, ?, ?, ?)";

    try {
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(insertSQL);

      preparedStatement.setInt(1, ordine.getId_utente());
      preparedStatement.setInt(2, ordine.getId_indirizzo());
      preparedStatement.setDouble(3, ordine.getPrezzoTot());
      preparedStatement.setString(4, ordine.getDataAcquisto().toString());
      preparedStatement.setString(5, ordine.getMetodoPagamento());

      result = preparedStatement.executeUpdate();

    } finally {
      try {
        if (preparedStatement != null) preparedStatement.close();
      } finally {
        if (connection != null) connection.close();
      }
    }

    return result;
  }

  @Override
  public int deleteOrder(OrderBean ordine) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    String selectSQL = "DELETE * FROM " + TABLE + " WHERE ID_Ordine= ?";

    int result;

    try {
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(selectSQL);

      preparedStatement.setInt(1, ordine.getId_ordine());

      result = preparedStatement.executeUpdate();

    } finally {
      try {
        if (preparedStatement != null) preparedStatement.close();
      } finally {
        if (connection != null) {
          connection.close();
        }
      }
    }

    return result;
  }

  @Override
  public OrderBean findByKey(int id) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    String selectSQL = "SELECT * FROM " + TABLE + " WHERE ID_Ordine = ?";
    OrderBean ordine = null;

    try {
      connection = ds.getConnection();
      preparedStatement = connection.prepareStatement(selectSQL);
      preparedStatement.setInt(1, id);

      ResultSet rs = preparedStatement.executeQuery();
      if (!rs.isBeforeFirst()) return null;

      ordine = new OrderBean();

      while (rs.next()) {
        ordine.setId_ordine(rs.getInt("ID_Ordine"));
        ordine.setId_utente(rs.getInt("ID_Utente"));
        ordine.setId_indirizzo(rs.getInt("ID_Indirizzo"));
        ordine.setPrezzoTot(rs.getDouble("prezzoTot"));
        ordine.setDataAcquisto(
          LocalDate.parse(rs.getDate("dataAcquisto").toString())
        );
        ordine.setMetodoPagamento(rs.getString("metodoPagamento"));
      }
    } finally {
      try {
        if (preparedStatement != null) preparedStatement.close();
      } finally {
        if (connection != null) {
          connection.close();
        }
      }
    }

    return ordine;
  }

  @Override
  public int getIdfromDB() throws SQLException {
    Connection connection = null;
    Statement statement = null;
    int id = -1;

    try {
      connection = ds.getConnection();
      statement = connection.createStatement();

      ResultSet rs = statement.executeQuery(
        "SELECT * FROM " + OrderDaoImpl.TABLE
      );

      if (rs.last()) {
        id = rs.getInt("ID_Ordine");
      }

      return id;
    } finally {
      try {
        if (statement != null) statement.close();
      } finally {
        if (connection != null) {
          connection.close();
        }
      }
    }
  }
  
  public ArrayList<OrderBean> findByIdUtente(int id) throws SQLException{
	  Connection connection = null;
	  PreparedStatement preparedStatement = null;
	  ArrayList<OrderBean> ordini = new ArrayList<OrderBean>();

	  String selectSQL = "SELECT * FROM " + TABLE + " WHERE ID_Utente = ?";

	  try {
	    connection = ds.getConnection();
	    preparedStatement = connection.prepareStatement(selectSQL);
	    preparedStatement.setInt(1, id);

	    ResultSet rs = preparedStatement.executeQuery();
	    if (!rs.isBeforeFirst()) return null;

	    while (rs.next()) {
	        OrderBean ordine = new OrderBean();
	        ordine.setId_ordine(rs.getInt("ID_Ordine"));
	        ordine.setId_utente(rs.getInt("ID_Utente"));
	        ordine.setId_indirizzo(rs.getInt("ID_Indirizzo"));
	        ordine.setPrezzoTot(rs.getDouble("prezzoTot"));
	        ordine.setDataAcquisto(
	        LocalDate.parse(rs.getDate("dataAcquisto").toString()));
	        ordine.setMetodoPagamento(rs.getString("metodoPagamento"));
	        ordini.add(ordine);
	    }
	  } finally {
	    try {
	      if (preparedStatement != null) preparedStatement.close();
	    } finally {
	      if (connection != null) {
	        connection.close();
	      }
	    }
	  }
	  return ordini;
	}
}
