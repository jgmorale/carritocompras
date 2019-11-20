package com.barbaro.store.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.barbaro.store.util.DatabaseManager;
import com.barbaro.store.models.Cart;
import com.barbaro.store.models.Product;

@WebServlet(name="ProductList", urlPatterns = {"/"})
public class ProductListServlets extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Obtener modelos de informacion
				List<Product> products = DatabaseManager.getProducts();
						
				if(req.getSession().getAttribute("cart") == null) {
					req.getSession().setAttribute("cart", new Cart(new HashMap<Product, Integer>()));
					//System.out.println("Si se creo el carrito");
				}
						
				req.setAttribute("products", products);
						
				RequestDispatcher dispatcher = req.getRequestDispatcher("productos.jsp");
				dispatcher.forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);		
	}

}
