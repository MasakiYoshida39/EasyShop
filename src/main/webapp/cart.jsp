<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Cart" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カート内一覧</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@include file = "header-navi.jsp"%>


	<h2>カート内一覧</h2>

	<%
		List<Product> listProd;
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			listProd = new ArrayList<Product>();
		} else {
			listProd = cart.getListProd();
		}
		if (listProd.size() > 0) {
	%>
			<table class="cart-list">
			<tr>
				<th></th><th>商品ID</th><th>商品名</th><th>価格</th>
			</tr>
	<%
			for (int idx = 0; idx < listProd.size(); idx++) {
				Product prod = listProd.get(idx);
	%>
				<tr>
					<td>
						<form action="remove-prod-servlet" method="POST">
						    <!-hiddenは隠す意味 -->
							<input type="hidden" name="idx" value="<%=idx%>">
							<input type="submit" value="削除">
						</form>
					</td>
					<td><%=prod.getId() %></td>
					<td><%=prod.getName() %></td>
					<td><%=prod.getPriceString() %></td>
				</tr>			
	<%
			}
	%>
			</table>
			<br>
			<form action="pay-servlet" method="post">
				<input type="submit" value="精算"><br>
			</form>
				
	<%
		} else {
	%>
			<p>カートの中は空です。</p>
	<%
		}
	%>

</body>
</html>