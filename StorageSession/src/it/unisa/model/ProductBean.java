package it.unisa.model;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int id;
	String name;
	String description;
	int price;
	int quantity, quantityStorage;
	String type;

	
	public ProductBean() {
		this.setQuantity(1);
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getCode() {
		return id;
	}

	public void setCode(int code) {
		this.id = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getQuantityStorage() {
		return quantityStorage;
	}

	public void setQuantityStorage(int quantityS) {
		this.quantityStorage = quantityS;
	}

	@Override
	public String toString() {
		return name + " (" + id + "), " + price + " " + quantity + ". " + description + " " + quantityStorage + " " + type;
	}
	
	public String toStringProduct() {
		return name + " (" + id + "), " + price + "  " + description + type;
	}
}
