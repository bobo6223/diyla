<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<h1>��J�ةM���s�d��</h1>

    <form action="your_action_url" method="post">

        <label for="input1">�|���s��: </label>
        <input type="text" name="input1" id="memId"><br>

        <label for="input2">DIY�~���s��: </label>
        <input type="text" name="input2" id="diyNo"><br>

        <label for="input3">�p���H: </label>
        <input type="text" name="input3" id="contactPerson"><br>

        <label for="input4">�p���q��: </label>
        <input type="text" name="input4" id="contactPhone"><br>

        <label for="selectNumber">�w���H��: </label>
        <select name="selectNumber" id="diyPersonCou">
            <option value="1">1�H</option>
            <option value="2">2�H</option>
            <option value="3">3�H</option>
            <option value="4">4�H</option>
            <option value="5">5�H</option>
            <option value="6">6�H</option>
            <option value="7">7�H</option>
            <option value="8">8�H</option>
        </select><br>

        <label for="selectNumber">�w���ɬq: </label>
        <select name="selectNumber" id="diyPeriod">
            <option value="0">�W��</option>
            <option value="1">�U��</option>
            <option value="2">�ߤW</option>
        </select><br>
        
        <label for="dateInput">��ܹw������G</label>
    	<input type="date" id="dateInput" name="dateInput"><br>

        <label for="selectNumber">�w�����A: </label>
        <select name="selectNumber" id="diyStatus">
            <option value="0">�ݼf��</option>
            <option value="1">�q�짹��</option>
            <option value="2">�q�����</option>
            <option value="3">��饼��</option>
        </select><br>
        
        <label for="selectNumber">�I�ڪ��A: </label>
        <select name="selectNumber" id="diyPayStatus">
            <option value="0">���I��</option>
            <option value="1">�w�I��</option>
            <option value="2">�w�h��</option>
            <option value="3">�S���q��-���h��</option>
        </select><br>
        
        <label for="input4">DIY�q����B </label>
        <input type="text" name="input4" id="diyPrice"><br>

        <button type="submit" name="button1" value="submit1">�s�WOrder���Ӹ��</button>
        

    </form>
</body>
</html>