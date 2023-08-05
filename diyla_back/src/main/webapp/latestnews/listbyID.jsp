<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>

<%
  LatestnewsVO latVO = (LatestnewsVO) request.getAttribute("latVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>



</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3></h3>
		 <h4><a href="select_page.jsp"></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>公告編號</th>
		<th>公告內容</th>
		<th>公告圖片</th>
		<th>公告狀態</th>
		<th>發布時間</th>
	</tr>
	<tr>
		<td><%=latVO.getNewsNo()%></td>
		<td><%=latVO.getNewsContext()%></td>
		<td><%=latVO.getAnnPic()%></td>
		<td><%=latVO.getAnnStatus()%></td>
		<td><%=latVO.getAnnTime()%></td>
	</tr>
</table>

</body>
</html>