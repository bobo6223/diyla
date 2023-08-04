<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<h1>輸入框和按鈕範例</h1>

    <form action="your_action_url" method="post">

        <label for="input1">會員編號: </label>
        <input type="text" name="input1" id="memId"><br>

        <label for="input2">DIY品項編號: </label>
        <input type="text" name="input2" id="diyNo"><br>

        <label for="input3">聯絡人: </label>
        <input type="text" name="input3" id="contactPerson"><br>

        <label for="input4">聯絡電話: </label>
        <input type="text" name="input4" id="contactPhone"><br>

        <label for="selectNumber">預約人數: </label>
        <select name="selectNumber" id="diyPersonCou">
            <option value="1">1人</option>
            <option value="2">2人</option>
            <option value="3">3人</option>
            <option value="4">4人</option>
            <option value="5">5人</option>
            <option value="6">6人</option>
            <option value="7">7人</option>
            <option value="8">8人</option>
        </select><br>

        <label for="selectNumber">預約時段: </label>
        <select name="selectNumber" id="diyPeriod">
            <option value="0">上午</option>
            <option value="1">下午</option>
            <option value="2">晚上</option>
        </select><br>
        
        <label for="dateInput">選擇預約日期：</label>
    	<input type="date" id="dateInput" name="dateInput"><br>

        <label for="selectNumber">預約狀態: </label>
        <select name="selectNumber" id="diyStatus">
            <option value="0">待審核</option>
            <option value="1">訂位完成</option>
            <option value="2">訂位取消</option>
            <option value="3">當日未到</option>
        </select><br>
        
        <label for="selectNumber">付款狀態: </label>
        <select name="selectNumber" id="diyPayStatus">
            <option value="0">未付款</option>
            <option value="1">已付款</option>
            <option value="2">已退款</option>
            <option value="3">沒收訂金-不退款</option>
        </select><br>
        
        <label for="input4">DIY訂單金額 </label>
        <input type="text" name="input4" id="diyPrice"><br>

        <button type="submit" name="button1" value="submit1">新增Order明細資料</button>
        

    </form>
</body>
</html>