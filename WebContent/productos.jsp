<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.barbaro.store.models.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.barbaro.store.models.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
	<div class= container">
		<div class="d-flex justify-content-around">
			<div class="font-italic">Game Store</div>
				<%
					int cantidad = 0;
					Cart cart = (Cart) request.getSession().getAttribute("cart");
					cantidad = cart.contarProductos();
				%>
			<ul class="nav nav-tabs">
  				<li class="nav-item dropdown">
    				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Carrito: <%=cantidad%> Total: $ <%=cart.calcularTotal() %></a>
    				<div class="dropdown-menu">
    					<table class="table">
    						<%
    							for(Product product: cart.listaElementos()) {
    								out.println("<tr>");
    								out.println("<td>");
    								out.println("<a class=\"dropdown-item\" href=\"#\">" + product.getNombre() + " : " + cart.cantidad(product) + " - Costo: $" + cart.subTotal(product)+ "</a>");
    								out.println("</td>");
    								out.println("<td>");
    								out.println("<form action=\"cart\" method = \"post\"><input type=\"hidden\" name=\"txtEliminar\" value=\""+ product.getId() +"\"><input type=\"submit\" class=\"btn btn-dark\" value=\"x\"></form>");
    								out.println("</td>");
    								//out.println("<td>");
    								//out.println("<td><form action=\"cart\" method = \"post\"><input type=\"hidden\" name=\"txtId\" value=\""+ product.getId() +"\"><input type=\"submit\" class=\"btn btn-dark\" value=\"+\"></form></td>");
    								//out.println("</td>");
    								out.println("<td>");
    								out.println("<form action=\"cart\" method = \"post\"><input type=\"hidden\" name=\"txtReducir\" value=\""+ product.getId() +"\"><input type=\"submit\" class=\"btn btn-dark\" value=\"-\"></form>");
    								out.println("</td>");
    								out.println("</tr>");
    								//System.out.println(product.getNombre());
    							}
								if(cart.contarProductos()!=0){
									out.println("<tr>");
									out.println("<td>");
									out.println("<form action=\"cart\" method=\"post\"><input type=\"hidden\" name=\"txtLimpiar\"><input type=\"submit\" class=\"btn btn-dark\" value=\"Vaciar carrito\"></form>");
									out.println("</td>");
									//out.println("<td>");
									//out.println("<form action=\"cart\" method=\"get\"><input type=\"hidden\" name=\"txtMostrar\"><input type=\"submit\" class=\"btn btn-dark\" value=\"Mostrar carrito\"></form>");
									//out.println("</td>");
									out.println("</tr>");	
								}
							%>
						</table>
    				</div>
  				</li>
			</ul>
		</div>
		<h4 class="m-2">Lista de productos</h4>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>id</th>
					<th>Nombre</th>
					<th>Descripcion</th>
					<th>Precio</th>
					<th>Accion</th>
				</tr>
			</thead>
			<%
				List<Product> products = (List<Product>) request.getAttribute("products");
				for(Product product: products){
					out.println("<tr>");
					out.println("<td>" + product.getId() + "</td>");
					out.println("<td>" + product.getNombre() + "</td>");
					out.println("<td>" + product.getDescripcion() + "</td>");
					out.println("<td>" + product.getPrecio() + "</td>");
					out.println("<td><form action=\"cart\" method = \"post\"><input type=\"hidden\" name=\"txtId\" value=\""+ product.getId() +"\"><input type=\"submit\" class=\"btn btn-dark\" value=\"Agregar\"></form></td>");
					out.println("</tr>");
				}
			%>
		</table>
		<form action="cart" method="get"><input type="submit" class="btn btn-dark" value="Mostrar carrito"></form>
	</div>
</body>
</html>