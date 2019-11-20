package com.barbaro.store.util;

import java.util.ArrayList;
import java.util.List;

import com.barbaro.store.models.Product;

public class DatabaseManager {
	
	public static List<Product> getProducts(){
		List<Product> products = new ArrayList<Product>();
		Product nintentoSwitch = new Product(100, "Nintendo Switch", "Consola de videojuegos", 8530);
		Product legendOfZelda = new Product(85, "Legend of Zelda", "Cartucho de videojuegos", 1200);
		Product superMario = new Product(73, "Super Mario Bros", "Cartucho de videojuegos", 1000);
		Product cargador = new Product(42, "Cargador electrico", "Cargador electrico para los controles", 500);
		Product chamarra = new Product(15, "Chamarra negra", "Chamarra color negro Legend of Zelda", 500);
		
		products.add(nintentoSwitch);
		products.add(legendOfZelda);
		products.add(superMario);
		products.add(cargador);
		products.add(chamarra);
		
		return products;
	}
	
	
	public static Product getProduct(String id) {
		List<Product> products = getProducts();
		Product product = null;
		
		for(Product p: products) {
			if(p.getId()==Integer.parseInt(id)) {
				product = p;
				break;
			}
		}
		
		return product;
	}
	
}
