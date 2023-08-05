<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.empmodel.*"%>

<% //見com.emp.controller.EmpServlet.java第238行存入req的empVO物件 (此為輸入格式有錯誤時的empVO物件)
   EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>

<!DOCTYPE HTML PUBLIC>
<HTML>
<HEAD>
<TITLE>管理員資料新增</TITLE>
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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>
</HEAD>
<BODY>
<table id="empTable-1">
<FORM METHOD="post" ACTION="insertEmp">
<table>
   <tr>
        <td>管理員名稱:</td>
        <td><input type="TEXT" name="name" value="<%= (empVO==null)? "吳永志" : empVO.getEmpName()%>" size="45"/></td>

   </tr>
   <tr>
        <td>管理員帳號:</td>
   </tr>
   <tr>
        <td>管理員密碼:</td>

   </tr>
   <tr>

        <td>管理員信箱:</td>

   </tr>
   <tr>

        <td>管理員狀態:</td>

   </tr>


</table>
</FORM>
</BODY>
</HTML>