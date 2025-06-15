<%@ page pageEncoding="UTF-8"%>

	<%-- エラーメッセージ表示 --%>
	<% 
		String errorMsg = (String)request.getAttribute("errorMsg");
		if (errorMsg != null) {
	%>
			<p class="error-msg"><%= errorMsg %></p>
	<%
		} 
	%>
