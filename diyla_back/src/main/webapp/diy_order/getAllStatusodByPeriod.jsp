<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/index.jsp" />
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<title>訂單列表 for Period</title>
<style type="text/css">
body {
	margin-left: 280px;
	font-size: 0;

}

div#padding{
padding: 40px;
}

header {
	background-color: rgb(243, 151, 5);; /* 背景顏色 */
	color: white; /* 文字顏色 */
	padding: 10px 0; /* 上下內邊距 10px，左右內邊距 0 */
	text-align: center; /* 文字置中 */
}

/* Header 標題樣式 */
.header-title {
	font-size: 1.5rem;
	margin: 0;
}

/* Header 子標題樣式 */
.header-subtitle {
	font-size: 16px;
	margin: 0;
	margin-left: 90%;
	gap:10px
}

h1 {
	font-size: 1.5rem;
}

li>a {
	font-size: 1rem;
	text-decoration: none;
}



table {
	border-collapse: collapse; /* 合併邊框 */
	width: 100%; /* 設定表格寬度 */
	font-family: Arial, sans-serif; /* 設定字體 */
	border: 1px solid black; /* 設定邊框 */
	font-size: 0.8rem;
	
}

th, td {
	border: 1px solid black; /* 設定儲存格邊框 */
	padding: 8px; /* 設定內邊距 */
	text-align: center; /* 設定文字對齊 */
	
}

td#inn{
display: flex;
/* padding: 0px; */
/* width: 90px; */
/* height: 10px 0; */
}

th {
	background-color: #f2f2f2; /* 設定表頭背景顏色 */
}

tr:nth-child(even) {
	background-color: #f2f2f2; /* 設定奇數行背景顏色 */
}

/* 設定表格間距 */
.table-container {
	margin-top: 20px;
}

div.inline {
 	display: flex;
	gap: 8px;
}

.pennyrequest1{
margin-top: 20px;
}


</style>
</head>
<body>

	<header>
		<span>
			<h1 class="header-title">
			以下為 ${diyReserveDate}
			
<%-- 			<c:choose> --%>
<%-- 					<c:when test="${diyOrderVO.diyPeriod == 0}"> --%>
<!-- 						<span> 上午</span> -->
<%-- 					</c:when> --%>
<%-- 					<c:when test="${diyOrderVO.diyPeriod == 1}"> --%>
<!-- 						<span> 下午</span> -->
<%-- 					</c:when> --%>
<%-- 					<c:when test="${diyOrderVO.diyPeriod == 2}"> --%>
<%-- 					<span> ${diyPeriod}</span> --%>
<%-- 					</c:when>	 --%>
<%-- 			</c:choose> --%>
			<span> ${diyPeriod}</span>
			的所有訂單列表(By Period)
			</h1>
		</span>
	</header>
	
	
	--${diyOrderVO1.diyReserveDate}--
	--${diyOrderVO1.diyPeriod}--


	<input type="hidden" class="uuu" value="${uuu}">
<div id="padding">

	<table>
		<tr>
			<th>DIY訂單編號</th>
			<th>會員編號</th>
			<th>DIY品項編號</th>
			<th>聯絡人</th>
			<th>聯絡電話</th>
			<th>預約人數</th>
			<th>預約時段</th>
			<th>DIY預約日期</th>
			<th>預約單建立時間</th>
			<th>預約狀態</th>
			<th>付款狀態</th>
			<th>DIY訂單金額</th>
		</tr>
		
		<c:forEach var="DiyOrderVO" items="${diyOrderList}">

			<tr>

				<td>${DiyOrderVO.diyOrderNo}</td>
				<td>${DiyOrderVO.memId}</td>

				<c:forEach var="DiyCateEntity" items="${diyCateList}">
					<c:choose>
							<c:when test="${DiyOrderVO.diyNo == DiyCateEntity.diyNo}">
								<td id="diyNo">${DiyCateEntity.diyName}</td>
							</c:when>
					</c:choose>			
			</c:forEach>

				<td>${DiyOrderVO.contactPerson}</td>
				<td>${DiyOrderVO.contactPhone}</td>
				<td>${DiyOrderVO.reservationNum}</td>

				<c:choose>
					<c:when test="${DiyOrderVO.diyPeriod == 0}">
						<td>上午</td>
					</c:when>
					<c:when test="${DiyOrderVO.diyPeriod == 1}">
						<td>下午</td>
					</c:when>
					<c:when test="${DiyOrderVO.diyPeriod == 2}">
						<td>晚上</td>
					</c:when>
				</c:choose>

				<td>${DiyOrderVO.diyReserveDate}</td>
				<td id="createTime11"><fmt:formatDate value="${DiyOrderVO.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

				<c:choose>
					<c:when test="${DiyOrderVO.reservationStatus == 0}">
						<td>訂位完成</td>
					</c:when>
					<c:when test="${DiyOrderVO.reservationStatus == 1}">
						<td>訂位已取消，尚未退款完成</td>
					</c:when>
					<c:when test="${DiyOrderVO.reservationStatus == 2}">
						<td>退款完成</td>
					</c:when>
					<c:when test="${DiyOrderVO.reservationStatus == 3}">
						<td>當日未到</td>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${DiyOrderVO.paymentStatus == 0}">
						<td>已付款</td>
					</c:when>
					<c:when test="${DiyOrderVO.paymentStatus == 1}">
						<td>已完成訂單</td>
					</c:when>
					<c:when test="${DiyOrderVO.paymentStatus == 2}">
						<td>已失效訂單</td>
					</c:when>
					<c:when test="${DiyOrderVO.paymentStatus == 3}">
						<td>已退款訂單</td>
					</c:when>
				</c:choose>

				<c:forEach var="DiyCateEntity" items="${diyCateList}">
						<c:choose>
								<c:when test="${DiyOrderVO.diyNo == DiyCateEntity.diyNo}">
									<td id="diyPrice">${DiyCateEntity.amount}</td>
								</c:when>
						</c:choose>			
					</c:forEach>


<!-- 				<td id="inn"> -->
<!-- 					<div class="inline"> -->
<!-- 						<FORM METHOD="post" ACTION="DiyOrderController" -->
<!-- 							style="margin-bottom: 0px;"> -->
<!-- <!-- 							<input type="submit" value="修改">  --> -->
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${(DiyOrderVO.paymentStatus) == 1}"> --%>
<!-- 									<input type="submit" value="實到" disabled>  -->
<%-- 								</c:when> --%>
<%-- 								<c:when test="${(DiyOrderVO.paymentStatus) == 2}">  --%>
<!-- 									<input type="submit" value="實到" disabled>   -->
<%-- 								</c:when>  --%>
<%--  								<c:when test="${(DiyOrderVO.paymentStatus) == 3}">  --%>
<!--  									<input type="submit" value="實到" disabled>    -->
<%--  								</c:when>  --%>
<%-- 								<c:otherwise> --%>
<!-- 									<input type="submit" value="實到" >  -->
<%-- 								</c:otherwise>		 --%>
<%-- 							</c:choose> --%>
							
<%-- 							<input type="hidden" name="diyOrderNo" value="${DiyOrderVO.diyOrderNo}"> --%>
<%-- 							<input type="hidden" name="diyReserveDate" value="${DiyOrderVO.diyReserveDate}"> --%>
<%-- 							<input type="hidden" name="diyPeriod" value="${DiyOrderVO.diyPeriod}"> --%>
<!-- 							<input type="hidden" name="result" value="0"> -->
<!-- 							<input type="hidden" name="action" value="comeORnot"> -->
<!-- 						</FORM> -->
<!-- 						<FORM METHOD="post" ACTION="DiyOrderController" -->
<!-- 							style="margin-bottom: 0px;"> -->
							
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${(DiyOrderVO.paymentStatus) == 1}"> --%>
<!-- 									<input type="submit" value="未到" disabled>  -->
<%-- 								</c:when> --%>
<%-- 								<c:when test="${(DiyOrderVO.paymentStatus) == 2}">  --%>
<!-- 									<input type="submit" value="未到" disabled>   -->
<%-- 								</c:when>  --%>
<%--  								<c:when test="${(DiyOrderVO.paymentStatus) == 3}">  --%>
<!--  									<input type="submit" value="未到" disabled>    -->
<%--  								</c:when>  --%>
<%-- 								<c:otherwise> --%>
<!-- 									<input type="submit" value="未到" >  -->
<%-- 								</c:otherwise>		 --%>
<%-- 							</c:choose> --%>
							
<%-- 							<input type="hidden" name="diyOrderNo" value="${DiyOrderVO.diyOrderNo}">  --%>
<%-- 							<input type="hidden" name="diyReserveDate" value="${DiyOrderVO.diyReserveDate}"> --%>
<%-- 							<input type="hidden" name="diyPeriod" value="${DiyOrderVO.diyPeriod}"> --%>
<!-- 							<input type="hidden" name="result" value="1"> -->
<!-- 							<input type="hidden" name="action" value="comeORnot"> -->
<!-- 						</FORM> -->
						
<!-- 						<p style="color:red;font-weight: bold;font-size:2rem;"></p> -->
						
<!-- 					</div> -->
<!-- 				</td> -->



			</tr>

		</c:forEach>

	</table>

	<div class="pennyrequest1">
		<li><a href='getodByPeriod_front.jsp'>返回點名系統首頁</a></li>
	</div>

	<div class="pennyrequest1">
		<li><a href='diyorderfront.jsp'>返回DIY後台管理首頁</a></li>
	</div>
	
	


</div>	

  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">


window.onload=function(){
	 const uuu = document.querySelector('.uuu');
	 console.log(uuu);
	 if(uuu.value === '404'){
		console.log(uuu.value);
		 	swal('已無訂單資料！','${errorMsgs.diyOrderList}' , 'error').then(function () {
		        window.location.href = "getodByPeriod_front.jsp"
		    });
	 }	 
}
</script>

</body>
</html>