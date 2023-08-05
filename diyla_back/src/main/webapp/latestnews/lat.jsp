<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/index.html"/>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link rel="stylesheet" href="../css/style.css">
    <style>
      body {
                background-color: white;
            }
 h1.h1 {
            width: 100%;
            height: 100px;
            background-color: #b45f06;
            font-size: 50px;
            text-align: center;
            color: #fce5cd;
        }

        div.lathome{
            width: calc(100% - 300px);
            margin-left: 300px;
            padding: 0;
        }
         ul.ul {
                    list-style: none;
                    padding: 0;
                    font-size: 24px;
                    text-align: center;
                    line-height: 60px;
                }

                ul.ul>li.li {
                    height: 60px;
                    background-color: #fce5cd;
                    color: #b45f06;
                }

                ul.ul>li.li a.a {
                    text-decoration: none;
                    color: #b45f06;

                }

                ul.ul li.li>form input {
                    vertical-align: middle;
                    width: 100px;
                }

                .a {
                    width: 100%;
                }
       </style>
</head>

<body>
    <h1 class="h1">最新公告</h1>

    <div class="lathome">
    <ul>
        <li class="li"><a class="a" href='getlistone.jsp'>查詢全部最新公告</a><br><br></li>

        <li class="li">
            <FORM METHOD="post" ACTION="latServlet">
                輸入公告編號 (如1):<input type="text" name="newsNO">
                <input type="hidden" name="action" value="getOne_For_Display">
                <input type="submit" value="送出">
            </FORM>
        </li>

        <li class="li"><a class="a" href='addlat.jsp'>新增最新公告</a><br><br></li>

    </ul>
    </div>
</body>

</html>