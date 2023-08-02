<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>最新公告</h1>
    <ul>
        <li><a href='getlistone.jsp'>最新公告</a><br><br></li>

        <li>
        <FORM METHOD="post" ACTION="latServlet" >
            <b>輸入公告編號 (如1):</b><input type="text" name="newsNO">
            <input type="hidden" name="action" value="getOne_For_Display">
            <input type="submit" value="送出">
        </FORM>
        </li>

    </ul>
</body>
</html>