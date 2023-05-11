package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private ArrayList<ProductBean> products;
	private double prezzoTotale = 0;

	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public double getPrezzoTotale() {
		return prezzoTotale;
	}

	public void setPrezzoTotale(double prezzoTotale) {
		this.prezzoTotale = prezzoTotale;
	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
	
	public void addProduct(ProductBean product) {
		if (!products.isEmpty() && containsProduct(product)) {
		} else {
			products.add(product);
			setPrezzoTotale(prezzoTotale += product.getPrice());
		}

	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
					setPrezzoTotale(prezzoTotale -= prod.getPrice()*prod.getQuantity());
					products.remove(prod);
					
				break;
			}
		}
 	}
	
	public boolean containsProduct(ProductBean product) {
			for (ProductBean pb : products) {
				if (pb.toStringProduct().compareTo(product.toStringProduct()) == 0) {
					return true;
				}
			}
			return false;
	}

	public void aggiorna(ProductBean product, int quantita) {
				
		int index;
		for (index = 0; index < products.size(); index++) {
			if (products.get(index).toStringProduct().compareTo(product.toStringProduct()) == 0) {
				
				setPrezzoTotale(prezzoTotale -= products.get(index).getPrice() * (products.get(index).getQuantity()) );
				
				products.get(index).setQuantity(quantita);
				setPrezzoTotale(prezzoTotale += products.get(index).getPrice() * (quantita) );
				
				break;
			}
		}


	}


}
