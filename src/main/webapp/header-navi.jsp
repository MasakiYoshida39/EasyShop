<%@ page pageEncoding="UTF-8"%>
<%@ page import="model.Cart" %>
<%@ page import="model.Store" %>

	<%-- 店舗名・ユーザIDの表示 --%>
	<% 
		Store storeHdr = (Store) session.getAttribute("store");
		Cart cartHdr = (Cart) session.getAttribute("cart");
		if ((storeHdr == null) || cartHdr == null) {
			request.setAttribute("errorMsg", "再ログインをお願いします。");	
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
	%>
			<h1><%=storeHdr.getName() %></h1>
			<hr>
			ユーザID：<%=cartHdr.getUserId() %>
			<hr>

			<%-- ナビ表示 --%>
			｜<a href="select.jsp">商品選択</a>
			｜<a href="cart.jsp">カート内一覧</a>
			｜<a href="logout-servlet">ログアウト</a>｜
			<hr>
	<%
		}
	%>
