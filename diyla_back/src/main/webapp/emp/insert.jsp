<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.empmodel.*"%>
<jsp:include page="/index.jsp"/>
<% //見com.emp.controller.EmpServlet.java第238行存入req的empVO物件 (此為輸入格式有錯誤時的empVO物件)
   EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>

<!DOCTYPE HTML PUBLIC>
<HTML>
<HEAD>
<link rel="stylesheet" href="../css/style.css">
<TITLE>管理員資料新增</TITLE>
<style>
body {
    margin-left :500px;
}
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

    <style>
      form {
        width: 300px; /* 設定表單的寬度 */
        margin: 0 auto; /* 水平置中表單 */
      }

      table {
        width: 100%; /* 將表格寬度設為容器的 100% */
      }

      td {
        text-align: left; /* 將表格內容左對齊 */
      }

      input[type="text"] {
        width: 20%; /* 將文字輸入欄位佔據整個儲存格的寬度 */
        box-sizing: border-box; /* 包含 padding 與 border 在內的寬度計算 */
      }

      input[type="submit"] {
        display: block; /* 讓提交按鈕顯示在新的一行 */
        margin: 10px auto; /* 將提交按鈕置中於表單 */
      }
    </style>

</style>
</HEAD>
<BODY>
<table id="empTable-1"></table>
<FORM METHOD="post" ACTION="empInsert">
<table>
   <tr>
        <td>管理員名稱:</td>
        <td><input type="TEXT" name="name" value="<%= (empVO==null)? "" : empVO.getEmpName()%>" placeholder ="請輸入管理員名稱" size="30" /></td>

   </tr>

           <!--input欄位要key in的內容要和inut欄位的name要有相對應關聯,才容易透過key的name得知該欄位的value內容-->


   <tr>
        <td>管理員密碼:</td>
        <td><input type="TEXT" name="password" value="<%= (empVO==null)? "" : empVO.getEmpPassword()%>" placeholder ="請輸入管理員密碼" size="35"/></td>
   </tr>
   <tr>

        <td>管理員信箱:</td>
        <td><input type="TEXT" name="email" value="<%= (empVO==null)? "" : empVO.getEmpEmail()%>" placeholder ="請輸入管理員信箱" size="30"/></td>
   </tr>
   <tr>

        <td>管理員狀態:</td>
        <td><input type="TEXT" name="status" value="<%= (empVO==null)? "" : empVO.getEmpStatus()%>" placeholder ="請輸入管理員狀態" size="30"/></td>
   </tr>

   <tr>
   <!--TODO 1.先在insert.jsp 做下拉式選單  (功能類別)-->
    <td><label for="funccategory_id">權限類別&nbsp  &nbsp  :&nbsp </label></td>
    <td><select id="funccategory_id" name="funcClass">
    <option select="selected" value="SHOP">商店管理員</option>
    <option value="CLASS">課程管理員</option>
    <option value="MASTER">師傅</option>
    <option value="MEMADMIN">會員權限管理人員</option>
    <option value="STORADMIN">倉儲管理人員</option>
    <option value="CUSTORSERVICE">客服人員</option>
    <option value="BACKADMIN">後台管理員</option>
   </select></td>


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