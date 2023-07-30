<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  LatVo latVO = (LatVo) request.getAttribute("latVO");
%>

<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneEmp.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>員工編號</th>
		<th>員工姓名</th>
		<th>職位</th>
		<th>雇用日期</th>
		<th>薪水</th>
		<th>獎金</th>
		<th>部門</th>
	</tr>
	<tr>
	    <td><%=latVO.getnewsNo()%></td>
	</tr>
</table>

</body>
</html>