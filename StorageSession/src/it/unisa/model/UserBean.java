package it.unisa.model;

import java.time.LocalDate;

public class UserBean {
	
	private String nome, cognome, numTelefono, email, codF, password, citta;

	private String provincia, via, stato, tipo;
	private LocalDate dataNascita;
	private int id, cap, numCivico;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getNumTelefono() {
		return numTelefono;
	}
	public void setNumTelefono(String numTelefono) {
		this.numTelefono = numTelefono;
	}
	public String getCodF() {
		return codF;
	}
	public void setCodF(String codF) {
		this.codF = codF;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCitta() {
		return citta;
	}
	public void setCitta(String citta) {
		this.citta = citta;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getVia() {
		return via;
	}
	public void setVia(String via) {
		this.via = via;
	}
	public String getStato() {
		return stato;
	}
	public void setStato(String stato) {
		this.stato = stato;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public LocalDate getDataNascita() {
		return dataNascita;
	}
	public void setDataNascita(LocalDate dataNascita) {
		this.dataNascita = dataNascita;
	}
	public int getCap() {
		return cap;
	}
	public void setCap(int cap) {
		this.cap = cap;
	}
	public int getNumCivico() {
		return numCivico;
	}
	public void setNumCivico(int numCivico) {
		this.numCivico = numCivico;
	}
	
	public String toString() {
		
		String s = "";
		
		s += id;
		s += " - "; 
		
	    s += nome;
		s += " - "; 

		s += cognome;
		s += " - "; 
		
	    s += dataNascita;
		s += " - "; 
		
		s += codF;
		s += " - "; 
		
	    s += numTelefono;
		s += " - "; 
		
		s += email;
		s += " - "; 
		
	    s += password;
		s += " - "; 
		
		s += citta;
		s += " - "; 
		
	    s += provincia;
		s += " - "; 
		
	    s += cap;
		s += " - "; 
		
		s += via;
		s += " - "; 
		
	    s += numCivico;
		s += " - "; 
		
		s += stato;
		s += " - "; 
		
	    s += tipo;
		s += "\n"; 
		
		return s;
	}

}
