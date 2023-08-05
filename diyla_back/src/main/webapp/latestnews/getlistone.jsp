<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
     LatService latSvc = new LatService();
        List<LatestnewsVO> list = latSvc.getAll();
        pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>

<table>
	<tr>
		<th>員工編號${newsNo}</th>

	</tr>
	<tr>
<% List<LatestnewsVO> scvList = (List)pageContext.getAttribute("list");%>
<% if (scvList != null) { %>
            <% for (LatestnewsVO a : scvList) { %>
        <%--         <p>會員編號: <%= a.getNewsNo() %></p> --%>
                <p>商品編號: <%= a.getNewsContext() %></p>
                <p>商品數量: <%= a.getAnnTime() %></p>
                <hr>
                <% } %>
                <% } %>

</table>

</body>
</html>