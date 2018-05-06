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
		<div class="header" >        
	        <div style="height:40px;line-height:40px;padding-left:15px;font-family:Tahoma;font-size:16px;font-weight:bold;background-color: #3498DB;color:white;">
	            	员工行为分析系统
	            	<a href="${ctx}/system/logout.do" style="width:100px;text-decoration:none;font-size:12px;float:right;margin-right:20px;cursor:pointer;color:white;">退出系统</a>       
	        </div>
    	</div>
		<div class="mini-fit">
			<div style="width:500px;margin-left:auto;margin-right:auto;">
				<h2 style="text-align:center;">员工行为分析调查</h2>
				<form style="width:100%;" id="research-form">
					<c:forEach items="${researchList}" var="research">
		 				<div style="font-weight: bold;">${research.question}</div>
		 				<div id="rbl" class="mini-radiobuttonlist" 
						    textField="text" name="researchReply${research.researchId}" valueField="id" 
						    url="${ctx}/tree/answer.do" 
						    style="margin-top:10px;margin-bottom:15px;">
						</div>       	
		 			</c:forEach>
		 			<input class="mini-hidden" name="staffId"  value="${staff.staffId}" />	     	
					<div style="text-align:center;padding:10px;">               
			            <a class="mini-button" onclick="onOk" style="width:100px;margin-right:20px;position:absolute;bottom:30px;">提交问卷调查</a>       
			        </div>  
				</form>
			</div>
		</div>
		<div style="line-height:28px;text-align:center;cursor:default">Copyright ©  graduation project by sdongwan from WuYi University  </div>
		<script type="text/javascript">
			mini.parse();
			var form = new mini.Form("research-form");
			function onOk() {
				SaveData();		
			}
			
			function SaveData() {
			    var data = form.getData();  
			    console.log(data);
			    form.validate();
			    if (form.isValid() == false) {
			    	return;
			    }
	            var url = "${ctx}/researchResult/addResearchResult.do";
	            $.post(url,data,function(r){
	          	if (r == "ok") {
	          		mini.alert("问卷调查提交成功");
			    } else {
			    	mini.alert("问卷调查提交失败");
				}
       		 });
	       }
			
			function onExit() {
				window.location = "${ctx}/console/logout.do" ;
			}
		</script>
	</body>
</html>