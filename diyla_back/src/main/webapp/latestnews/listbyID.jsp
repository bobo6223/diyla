<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>

<%
  LatestnewsVO latVO = (LatestnewsVO) request.getAttribute("latVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>


</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneEmp.jsp</h3>
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