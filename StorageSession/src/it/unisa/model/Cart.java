package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private ArrayList<ProductBean> products;
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public void addProduct(ProductBean product) {
		if (!products.isEmpty() && containsProduct(product)) {
			int index = 0;
			for (index = 0; index < products.size(); index++) {
				if (products.get(index).toStringProduct().compareTo(product.toStringProduct()) == 0) {
					break;
				}
			}
			products.get(index).setQuantity(products.get(index).getQuantity()+1);
		} else {
			products.add(product);
		}
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
	
	public boolean containsProduct(ProductBean product) {
			for (ProductBean pb : products) {
				if (pb.toStringProduct().compareTo(product.toStringProduct()) == 0) {
					return true;
				}
			}
			return false;
	}
}
