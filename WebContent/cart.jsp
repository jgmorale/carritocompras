<%@page import="com.barbaro.store.models.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
			<div class="col-s4">
				<h4>Carrito al momento:</h4>
				<c:if test="${sessionScope.cart.contarProductos()==0}">
						<h4>Carrito vacio</h4>
				</c:if>
				<a href="<%= pageContext.getServletContext().getContextPath()%>">Regresar</a>
			</div>
		<div class="row">
			<div class="col-s8">
				<table class="table">
					<tr>
						<th>Id</th>
						<th>Nombre</th>
						<th>Descripcion</th>
						<th>Precio</th>
						<th>Cantidad</th>
						<th>Subtotal</th>
						<th>Total</th>
						<th>Acciones</th>
					</tr>
					<tr>
						<c:forEach var="product" items="${sessionScope.cart.getElementos().keySet()}">
							<tr>
								<td>${product.getId()}</td>
								<td>${product.getNombre()}</td>
								<td>${product.getDescripcion()}</td>
								<td>${product.getPrecio()}</td>
								<td>${sessionScope.cart.cantidad(product)}</td>
								<td>${sessionScope.cart.subTotal(product)}</td>
								<td>${sessionScope.cart.calcularTotal()}</td>
							</tr>
						</c:forEach>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>