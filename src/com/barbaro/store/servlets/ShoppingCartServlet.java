package com.barbaro.store.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.barbaro.store.models.Cart;
import com.barbaro.store.models.Product;
import com.barbaro.store.util.DatabaseManager;

@WebServlet(name="ShoppingCart", urlPatterns = {"/cart"})
public class ShoppingCartServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("cart.jsp").forward(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// Obtener el id del producto
		String txtId = req.getParameter("txtId");
		String eliminar = req.getParameter("txtEliminar");
		String reducir = req.getParameter("txtReducir");
		String limpiar = req.getParameter("txtLimpiar");
		
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		
		if(session.getAttribute("cart")==null) {
			cart = new Cart(new HashMap<Product, Integer>());
		}	
		
		if(txtId!=null) {
			Product product = DatabaseManager.getProduct(txtId);
			cart.agregarElemento(product);
			session.setAttribute("cart", cart);
		} else if(eliminar!=null) {
			Product product = DatabaseManager.getProduct(eliminar);
			cart.eliminarElemento(product);
		} else if (reducir!=null) {
			Product product = DatabaseManager.getProduct(reducir);
			cart.reducirElemento(product);
		} else if (limpiar!=null) {
			cart.limpiar();
		}
		
		// Obtener el producto por id
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/");
		dispatcher.forward(req, resp);
		
		// String context = getServletContext().getContextPath();
		//resp.sendRedirect("context"); //Otra opcion sin utilizar el dispatcher
		
		//Falta regresarlo de nuevo a la lista de productos
		
	}
}
