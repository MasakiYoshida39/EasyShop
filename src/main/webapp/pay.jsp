<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Cart" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>精算完了</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%@include file = "header-navi.jsp"%>

	<h2>精算完了</h2>

	<p>お買い上げ ありがとうございました。</p>

	<%
		List<Product> listProd;
		Cart payData = (Cart) session.getAttribute("pay");
		if (payData == null) {
			listProd = new ArrayList<Product>();
		} else {
			listProd = payData.getListProd();
		}
		if (listProd.size() > 0) {
	%>
			<table class="pay-list">
			<tr>
				<th>商品ID</th><th>商品名</th><th>価格</th>
			</tr>
	<%
			for (Product prod : listProd) {
	%>
				<tr>
					<td><%=prod.getId() %></td>
					<td><%=prod.getName() %></td>
					<td><%=prod.getPriceString() %></td>
				</tr>			
	<%
			}
	%>
			</table>
			<br>
			<p>合計：<%=payData.getTotalPriceString() %> になります。</p>

	<%
			session.removeAttribute("pay");			// 精算済情報の削除
		} 
	%>

</body>
</html>