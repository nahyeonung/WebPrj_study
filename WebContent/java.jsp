<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="packages.EmpDAO, java.util.Random" %>
<%
	EmpDAO dao = new EmpDAO();
	String empIdStr = request.getParameter("empid");
	int empid = Integer.parseInt(empIdStr);
	String name = dao.getEmpNameById(empid);
	out.print(name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script>
$(function() {
	var inputEl = $("[name=empid]");
	//var searchEl = $("input[value=Search]");
	var spanEl = $(".empname");
	$("input[value=Search]").click(function(event){
		let empid = inputEl.val();
		//{} => 자바스크립트에서 객체를 포현하는 방법(key: value)
		$.ajax({
			type: "GET",
			url: "res.jsp?empid=" + imputEl.val(),
			success: function(result, status){
				spanEl.text(result);
			}
		});
	});
})
</script>
</head>
<body>
<p>사원의 이름을 조회하려면 사원번호를 입력하세오. </p>
<p>사원번호 <input type="text" name="empid">
		<input type="button" value="Search"></p>
<p>조회한 사원의 이름: <span class="empname"></span></p>
</body>
</html>