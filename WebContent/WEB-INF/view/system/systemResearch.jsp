<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>员工行为分析调查</title>
		<%@include file="/commons/include/system.jsp"%>
	</head>
	<body>
		<div style="width:500px;margin-left:auto;margin-right:auto;">
			<form style="width:100%;">
				<h2 style="text-align:center;">员工行为分析调查</h2>
				<c:forEach items="${researchList}" var="research">
	 				<div>${research.question}</div>
	 				<input class="mini-texbox" name="${research.researchId}" required="true" style="width:100%;"/>	     	
	 			</c:forEach>
				<div style="text-align:center;padding:10px;">               
		            <a class="mini-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
		            <a class="mini-button" onclick="onCancel" style="width:60px;">取消</a>       
		        </div>  
			</form>
		</div>
	</body>
</html>