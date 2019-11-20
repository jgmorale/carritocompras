package com.barbaro.store.models;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Cart {
	
	private Map<Product, Integer> elementos;
	
	public Cart(Map<Product, Integer> elementos) {
		this.elementos = elementos;
	}
	
	public Map<Product, Integer> getElementos(){
		return elementos;
	}
	
	public void setElementos(Map<Product, Integer> elementos) {
		this.elementos = elementos;
	}
	
	public void agregarElemento(Product product) {
		Set<Product> llaves = elementos.keySet();

		if (llaves.size() == 0) {
			elementos.put(product, 1);
		} else {
			for (Iterator<Product> it = llaves.iterator(); it.hasNext();) {
				Product p = it.next();
				if (product.getNombre().equals(p.getNombre())) {
					product = p;
					break;
				}
			}

			if (elementos.containsKey(product)) {
				elementos.put(product, elementos.get(product) + 1);
			} else {
				elementos.put(product, 1);
			}
		}

	}
	
	public void eliminarElemento(Product product) {
		Set<Product> llaves = elementos.keySet();

		for (Iterator<Product> it = llaves.iterator(); it.hasNext();) {
			Product p = it.next();
			if (product.getNombre().equals(p.getNombre())) {
				product = p;
				break;
			}
		}

		elementos.remove(product);
	}
	
	public int contarProductos() {
		int cantidad = 0;
		Collection<Integer> cantidades = elementos.values();
		for(Integer i: cantidades) {
			cantidad += i;
		}
		
		return cantidad;
	}
	
	public void reducirElemento(Product product) {
		Set<Product> llaves = elementos.keySet();

		for (Iterator<Product> it = llaves.iterator(); it.hasNext();) {
			Product p = it.next();
			if (product.getNombre().equals(p.getNombre())) {
				product = p;
				break;
			}
		}

		if (elementos.containsKey(product)) {
			if(elementos.get(product)>1) {
				elementos.put(product, elementos.get(product) - 1);
			} else {
				elementos.remove(product);
			}
		}
	}
	
	public void limpiar() {
		elementos.clear();
	}
	
	public float calcularTotal() {
		float total = 0;
		Set<Product> llaves = elementos.keySet();
		for(Product product: llaves) {
			total += product.getPrecio()*elementos.get(product);
		}
		return total;
	}
	
	public Set<Product> listaElementos() {
		Set<Product> lista = elementos.keySet();
		
		return lista;
	}
	
	public int cantidad(Product product) {
		if(elementos.containsKey(product)) {
			return elementos.get(product);
		} else {
			return 0;
		}
	}
	
	public float subTotal(Product product) {
		Set<Product> llaves = elementos.keySet();
		
		for (Iterator<Product> it = llaves.iterator(); it.hasNext();) {
			Product p = it.next();
			if (product.getNombre().equals(p.getNombre())) {
				product = p;
				break;
			}
		}

		return elementos.get(product) * product.getPrecio();
	}
	
}
