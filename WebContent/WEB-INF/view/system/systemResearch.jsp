<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>员工行为分析调查</title>
		<%@include file="/commons/include/system.jsp"%>
		<style type="text/css">
			.header{
		   		height:40px;
		   		line-height:40px;
		   		padding-left:15px;
		   		font-family:Tahoma;
		   		font-size:16px;
		   		font-weight:bold;
		   		background-color: #ffffff;
		   		color:#3498DB;
		   		box-shadow:-1px 0px 1px rgba(0, 0, 0, .04),0px 1px 1px rgba(0, 0, 0, .13),1px 0px 2px rgba(0, 0, 0, .05);
		   }
		   
		   #exit{
		   		float:right;
		   		margin-right:15px;
		   		margin-top:7px;
		   		border:none;
		   		padding:2px;
		   		background-color:#ffffff;
		   		color:#3498DB;
		   }
		   
		   #exit:hover{
		  		float:right;
		   		margin-right:15px;
		   		margin-top:7px;
		   		border:none;
		   		padding:2px;
		   		background-color:#3498DB;
		   		color:#ffffff;
		   }
		   
		   .mini-radiobuttonlist-item{
		   		width:100px;
		   		margin-right:0px;
		   }
		   
		   #research-container{
		        margin-right: auto;
		        margin-left: auto;
			    max-width: 900px;
			    height:600px;
			    padding: 40px;
			    background-color: #ffffff;
			    margin-left: auto;
			    margin-right: auto;
			    border-radius: 4px;
			    overflow-x: hidden;
			    box-sizing: border-box;
			    padding: 2.5em;
				border-radius: 0.3em;
				-webkit-border-radius: 0.3em;
				-o-border-radius: 0.3em;
				-moz-border-radius: 0.3em;
				box-shadow: 0px 0px 15px #545454;
				padding-right:10px;
		   }
		   
		   #submit-resear{
		   		border:solid 1px #3498DB;
		   		margin-top:25px;
		   		padding:2px;
		   		background-color:#3498DB;	
		   		color:#ffffff;
		   }
		   
		   #submit-resear:hover{
		   		margin-top:25px;
		   		border:solid 1px #3498DB;
		   		padding:2px;
		   		background-color:#ffffff;
		   		color:#3498DB;
		   }
		</style>
	</head>
	<body>
		<div class="header" >        
	        <div>
            	员工行为分析系统
            	<a href="${ctx}/system/logout.do" class="mini-button" id="exit">退出系统</a>       
	        </div>
    	</div>
		<div class="mini-fit">
			<h2 style="text-align:center;">员工行为评估问卷</h2>
			<div id="research-container">
				<form id="research-form" style="width:500px;margin-left:auto;margin-right:auto;">
					<c:forEach items="${researchList}" var="research">
		 				<span style="font-weight: bold;">${research.question}</span>
		 				<span id="rbl" class="mini-radiobuttonlist" 
						    textField="text" name="researchReply${research.researchId}" valueField="id" 
						    url="${ctx}/tree/answer.do" 
						    style="margin-top:10px;margin-bottom:15px;">
						</span>       	
		 			</c:forEach>
		 			<input class="mini-hidden" name="staffId"  value="${staff.staffId}" />	     	
				</form>
				<div style="width:100%;text-align:center;display:absolute;bottom:20px;">
					<a class="mini-button" onclick="onOk" id="submit-resear">提交问卷调查</a>       
				</div>
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