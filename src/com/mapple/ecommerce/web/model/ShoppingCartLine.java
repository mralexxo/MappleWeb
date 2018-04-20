package com.mapple.ecommerce.web.model;

import com.mapple.ecommerce.model.Producto;

public class ShoppingCartLine {
	
	private Producto product = null;
    private double precioTotal;
	
	public ShoppingCartLine() {
	}

	public Producto getProduct() {
		return product;
	}

	public void setProduct(Producto product) {
		this.product = product;
	}

	public double getPrecioTotal() {
		return precioTotal;
	}

	public void setPrecioTotal(double precioTotal) {
		this.precioTotal = precioTotal;
	}
	
}
