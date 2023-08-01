<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.shoppongcart.*"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
List<ShoppingCartVO> scvList = (List)request.getAttribute("shoppingCartList"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<!DOCTYPE HTML PUBLIC>
<HTML>
<HEAD>
<TITLE>查詢結果</TITLE>
</HEAD>
<BODY>

	<table>
會員編號: ${memId} 的購物車列表
<tr>
<%-- <% List<ShoppingCartVO> scvList = (List<ShoppingCartVO>) request.getAttribute("shoppingCartList"); %> --%>
<% if (scvList != null && !scvList.isEmpty()) { %>
    <% for (ShoppingCartVO cartItem : scvList) { %>
<%--         <p>會員編號: <%= cartItem.getMemId() %></p> --%>
        <p>商品編號: <%= cartItem.getComNo() %></p>
        <p>商品數量: <%= cartItem.getComAmount() %></p>
        <hr>
    <% } %>
<% } else { %>
    <p>購物車為空</p>
<% } %>

		</tr>
	</table>

</BODY>
</HTML>