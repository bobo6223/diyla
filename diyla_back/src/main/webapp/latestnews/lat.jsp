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
    <h1>最新消息</h1>
    <ul>
        <li>
        <FORM METHOD="post" ACTION="latServlet" >
            <b>輸入員工編號 (如7001):</b>
            <input type="text" name="newsNo">
            <input type="hidden" name="action" value="getOne_For_Display">
            <input type="submit" value="送出">
        </FORM>
        </li>
        <li>
            <FORM METHOD="post" ACTION="latServlet" >
              <b>選擇最新消息:</b>
              <select size="1" name="newsNo">
                <c:forEach var="newsNo" items="${latSvc.all}" >
                 <option value="${lat.....VO.newsNo}">${newsNo.newsContext}
                </c:forEach>
              </select>
              <input type="hidden" name="action" value="getOne_For_Display">
              <input type="submit" value="送出">
            </FORM>
         </li>
    </ul>
</body>
</html>