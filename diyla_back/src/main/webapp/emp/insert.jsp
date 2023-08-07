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
<table id="empTable-1"></table>
<FORM METHOD="post" ACTION="empInsert">
<table>
   <tr>
        <td>管理員名稱:</td>
        <td><input type="TEXT" name="name" value="<%= (empVO==null)? "請輸入管理員名稱" : empVO.getEmpName()%>" size="45"/></td>

   </tr>

           <!--input欄位要key in的內容要和inut欄位的name要有相對應關聯,才容易透過key的name得知該欄位的value內容-->


   <tr>
        <td>管理員密碼:</td>
        <td><input type="TEXT" name="password" value="<%= (empVO==null)? "請輸入管理員密碼" : empVO.getEmpPassword()%>" size="45"/></td>
   </tr>
   <tr>

        <td>管理員信箱:</td>
        <td><input type="TEXT" name="email" value="<%= (empVO==null)? "請輸入管理員信箱" : empVO.getEmpEmail()%>" size="45"/></td>
   </tr>
   <tr>

        <td>管理員狀態:</td>
        <td><input type="TEXT" name="status" value="<%= (empVO==null)? "請輸入管理員狀態" : empVO.getEmpStatus()%>" size="45"/></td>
   </tr>

    <tr>
    <td>
    <INPUT TYPE="SUBMIT">
    <td>
    </tr>

</table>
</FORM>
</BODY>
</HTML>