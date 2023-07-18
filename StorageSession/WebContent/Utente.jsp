<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="it.unisa.model.UserDaoImpl" %>
<%@ page import="it.unisa.model.UserBean" %>
<%@ page import="java.util.List" %>
<%@ page import="it.unisa.model.AddressBean" %>
<%@ page import="it.unisa.model.OrderBean" %>
<%@ page import="it.unisa.control.AddressControl" %>
<%@ page import="it.unisa.model.AddressDaoImpl" %>
<%@ page import="it.unisa.control.OrderControl" %>

<%
   // Controllo se l'utente è loggato
   String user = (String) request.getSession().getAttribute("user");
   if (user == null) {
      response.sendRedirect("./ProductView.jsp");
      return;
   }

   UserDaoImpl userDao = new UserDaoImpl();
   UserBean utente = userDao.findByCred(user, (String) session.getAttribute("psw"));

   AddressDaoImpl addressDao = new AddressDaoImpl();
   List<AddressBean> indirizzi = addressDao.findByID(utente.getId());

   OrderControl orderControl = new OrderControl();
   List<OrderBean> ordini = orderControl.getOrdersByUser(utente.getId());
%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Dettagli Utente</title>
   </head>
   <body>
      <%@include file="Header.jsp"%>

      <h1>Dettagli Utente</h1>

      <p>Benvenuto, <%= utente.getEmail() %>!</p>
      <p>Nome: <%= utente.getNome() %></p>
      <p>Cognome: <%= utente.getCognome() %></p>
      <p>Data di nascita: <%= utente.getDataNascita() %></p>
      <p>Numero di telefono: <%= utente.getNumTelefono() %></p>
      
      <br>

      <h2>Indirizzi</h2>
      <table>
         <thead>
            <tr>
               <th>Indirizzo</th>
               <th>Città</th>
               <th>Provincia</th>
            </tr>
         </thead>
         <tbody>
            <% for (AddressBean indirizzo : indirizzi) { %>
               <tr>
                  <td><%= indirizzo.getIndirizzo() %></td>
                  <td><%= indirizzo.getCitta() %></td>
                  <td><%= indirizzo.getProvincia() %></td>
               </tr>
            <% } %>
         </tbody>
      </table>

      <br>

      <h2>Ordini Effettuati</h2>
      <table>
         <thead>
            <tr>
               <th>ID Ordine</th>
               <th>Data Ordine</th>
               <th>Totale</th>
            </tr>
         </thead>
         <tbody>
            <% for (OrderBean ordine : ordini) { %>
               <tr>
                  <td><%= ordine.getId() %></td>
                  <td><%= ordine.getDataOrdine() %></td>
                  <td><%= ordine.getTotale() %></td>
               </tr>
            <% } %>
         </tbody>
      </table>

      <br>

      <button onclick="location.href='ModifyPsw.jsp'">Modifica Password</button>

      <%@include file="Footer.jsp"%>
   </body>
</html> --%>