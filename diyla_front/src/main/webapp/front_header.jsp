<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>
    <!-- Basic -->
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- Site Metas -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png" type="image/x-icon">

    <title>
        DIYLA
    </title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="${ctxPath}/css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="${ctxPath}/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="${ctxPath}/css/responsive.css" rel="stylesheet"/>
</head>

<body>
<div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="${ctxPath}/index.jsp">
                <img src="${ctxPath}/images/DIYLA_LOGO.png" alt="DIYLA!" class="logo-image">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class=""></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav  ">
                    <li class="nav-item ">
                        <a class="nav-link" href="${ctxPath}/aboutus/aboutus.jsp">關於我們
                            <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="index.jsp">
                            DIY體驗
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="index.jsp">
                            甜點課程
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${ctxPath}/shop/CommodityController?action=listAll">
                            商店
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="${ctxPath}/art/art.jsp">
                            社群分享
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="${ctxPath}/pbm/pbm.jsp">
                            常見問題
                        </a>
                    </li>
                    <li class="nav-item">
                        <%--可自行更改href連結--%>
                        <a class="nav-link" href="${ctxPath}/memberOrder/OrderController?action=listOrder&memId=${memId}" id="myOrder">
                            我的訂單
                        </a>
                    </li>
                </ul>
                <div class="user_option">
                    <c:choose>
                        <c:when test="${empty memVO}">
                            <a href="${ctxPath}/member/mem_login.jsp">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <span>登入</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${ctxPath}/member/mem_update.jsp">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <span>${memVO.memName}你好</span>
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <%--可自行更改href連結--%>
                    <form class="form-inline ">
                    </form>
                    <c:choose>
                    <c:when test="${shoppingCartList==null||shoppingCartList.size()==0}">
                    <a href="${ctxPath}/shop/ShoppingCartServlet?action=getAll&memId=${memId}" id="shoppingcart">
                        <svg fill="#fce5cd" height="28px" width="28px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512.004 512.004" xml:space="preserve" stroke="#fce5cd"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <g> <circle cx="153.6" cy="448.004" r="12.8"></circle> </g> </g> <g> <g> <circle cx="409.6" cy="448.004" r="12.8"></circle> </g> </g> <g> <g> <path d="M499.2,435.204h-26.889c-5.931-29.21-31.744-51.2-62.711-51.2c-30.959,0-56.781,21.99-62.711,51.2H216.277 c-5.726-28.015-29.824-49.229-59.179-50.85l-42.035-283.827c-0.401-2.722-1.673-5.222-3.61-7.177l-89.6-89.6 C16.853-1.25,8.755-1.25,3.754,3.75c-5,5-5,13.099,0,18.099l86.613,86.596l41.421,279.62 c-24.559,8.951-42.189,32.29-42.189,59.938c0,35.345,28.655,64,64,64c30.959,0,56.781-21.99,62.711-51.2h130.577 c5.931,29.21,31.753,51.2,62.711,51.2s56.781-21.99,62.711-51.2H499.2c7.074,0,12.8-5.726,12.8-12.8 C512,440.93,506.274,435.204,499.2,435.204z M153.6,486.404c-21.171,0-38.4-17.229-38.4-38.4c0-21.171,17.229-38.4,38.4-38.4 c21.171,0,38.4,17.229,38.4,38.4C192,469.175,174.771,486.404,153.6,486.404z M409.6,486.404c-21.171,0-38.4-17.229-38.4-38.4 c0-21.171,17.229-38.4,38.4-38.4s38.4,17.229,38.4,38.4C448,469.175,430.771,486.404,409.6,486.404z"></path> </g> </g> <g> <g> <path d="M506.837,138.185c-4.838-6.409-12.407-10.18-20.437-10.18H171.52c-7.424,0-14.473,3.217-19.337,8.823 s-7.057,13.047-5.999,20.395l25.6,179.2c1.792,12.612,12.595,21.982,25.335,21.982H435.2c11.426,0,21.478-7.578,24.619-18.569 l51.2-179.2C513.22,152.913,511.675,144.602,506.837,138.185z M435.2,332.804H197.12l-25.6-179.2H486.4L435.2,332.804z"></path> </g> </g> </g></svg>
                    </a>
                    </c:when>
                    <c:otherwise>
                    	<a href="${ctxPath}/shop/ShoppingCartServlet?action=getAll&memId=${memId}" id="shoppingcart">
							<svg fill="#c8ff00" height="28px" width="28px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512.004 512.004" xml:space="preserve" stroke="#ff0000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <g> <circle cx="153.598" cy="448.004" r="12.8"></circle> </g> </g> <g> <g> <circle cx="409.598" cy="448.004" r="12.8"></circle> </g> </g> <g> <g> <path d="M499.198,435.204h-26.889c-5.931-29.21-31.744-51.2-62.711-51.2c-30.959,0-56.781,21.99-62.711,51.2H216.275 c-5.726-28.015-29.824-49.229-59.179-50.85l-42.035-283.827c-0.401-2.722-1.673-5.222-3.61-7.177l-89.6-89.6 C16.851-1.25,8.753-1.25,3.752,3.75c-5,5-5,13.099,0,18.099l86.613,86.596l41.421,279.62 c-24.559,8.951-42.189,32.29-42.189,59.938c0,35.345,28.655,64,64,64c30.959,0,56.781-21.99,62.711-51.2h130.577 c5.931,29.21,31.753,51.2,62.711,51.2s56.781-21.99,62.711-51.2h26.889c7.074,0,12.8-5.726,12.8-12.8 C511.998,440.93,506.272,435.204,499.198,435.204z M153.598,486.404c-21.171,0-38.4-17.229-38.4-38.4 c0-21.171,17.229-38.4,38.4-38.4c21.171,0,38.4,17.229,38.4,38.4C191.998,469.175,174.769,486.404,153.598,486.404z M409.598,486.404c-21.171,0-38.4-17.229-38.4-38.4c0-21.171,17.229-38.4,38.4-38.4s38.4,17.229,38.4,38.4 C447.998,469.175,430.769,486.404,409.598,486.404z"></path> </g> </g> <g> <g> <path d="M506.835,138.193c-4.838-6.417-12.407-10.189-20.437-10.189v-102.4h-128v-25.6h-128v76.8h-51.2v51.2h-7.68 c-7.424,0-14.473,3.217-19.337,8.823s-7.057,13.047-5.999,20.395l25.6,179.2c1.792,12.612,12.595,21.982,25.335,21.982h238.08 c11.426,0,21.478-7.578,24.619-18.569l51.2-179.2C513.227,152.913,511.673,144.602,506.835,138.193z M358.398,51.204h102.4v76.8 h-102.4V51.204z M255.998,25.604h76.8v102.4h-25.6v-51.2h-51.2V25.604z M204.798,102.404h76.8v25.6h-76.8V102.404z M435.198,332.804h-238.08l-25.6-179.2h314.88L435.198,332.804z"></path> </g> </g> </g></svg>
                    	</a>
                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>
    </header>

    <!-- end header section -->
</div>
<script src="${ctxPath}/js/jquery-3.4.1.min.js"></script>
<%--<script src="js/bootstrap.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<script src="${ctxPath}/js/custom.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.all.min.js"></script>
	<script>
$("#shoppingcart").click(function(e){
	let memVO = <%=session.getAttribute("memVO")%>;
	  if (memVO == null) {
		  e.preventDefault();
	    Swal.fire({
	      icon: 'warning',
	      title: '請登入',
	      text: '您需要登入才能使用購物車。',
	      confirmButtonText: '前往登入',
	      allowOutsideClick: false  
	    }).then((result) => {
	      if (result.isConfirmed) {
	        window.location.href = './member/mem_login.jsp';
	      }
	    });
	  } 
});
$("#myOrder").click(function(e){
	let memVO = <%=session.getAttribute("memVO")%>;
	  if (memVO == null) {
		  e.preventDefault();
	    Swal.fire({
	      icon: 'warning',
	      title: '請登入',
	      text: '您需要登入才能查看訂單。',
	      confirmButtonText: '前往登入',
	      allowOutsideClick: false  
	    }).then((result) => {
	      if (result.isConfirmed) {
	        window.location.href = './member/mem_login.jsp';
	      }
	    });
	  } 
});
  
</script>
</body>

</html>
