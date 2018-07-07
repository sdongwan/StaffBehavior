<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>员工行为分析系统</title>
		<%@include file="/commons/include/system.jsp"%>
		<script src="${ctx}/assets/miniui/echarts.min.js" type="text/javascript"></script>
		<style type="text/css">
			body{
			    	width:100%;
			    	height:100%;
			    	margin:0;
			    	overflow:hidden;
		    }
		    
		    table tr td{
		    	padding-left:10px;
		    	padding-right:10px;
		    }
		    
		    table{
		    	margin-left: auto;
		    	margin-right:auto;
    			margin-top: 25px;	
		    }
		    
		    .mini-button{
		    	color:#ffffff;
		    	background-color:#3498DB;
		    	border-color:#3498DB;
		    }
		    
		    .mini-button:active,.mini-button:hover{
		    	color:#3498DB;
		    	background-color:#ffffff;
		    	border-color:#ffffff;
		    }
		    
		    #win1{
		    	margin-top:30px;
		    	margin-left:auto;
		    	margin-right:auto;
		    }
		</style>
		<script type="text/javascript">
			
	        
		</script>
	</head>
	<body>
		<table>
			<tr>
				<td>部门<input id="deptCombo" class="mini-combobox" style="width:160px;" textField="departName" valueField="departId" 
					        onvaluechanged="onDeptChanged" url="${ctx}/depart/getDepartList.do"
					        showNullItem="true" emptyText="请选择部门"
					         />     
	            </td>
				<td>
					职位
					<input id="positionCombo" onvaluechanged="onPositionChanged" class="mini-combobox" style="width:160px;" textField="jobName"  valueField="jobId" emptyText="请选择职位"/> 
				</td>
				<td>
					员工
					<input id="staffCombo" class="mini-combobox" style="width:160px;" textField="staffName" valueField="staffId" emptyText="请选择员工"/> 
				</td>
				<td>
					<a class="mini-button" iconCls="fa fa-balance-scale" style="width:100px;" onclick="buildChart()">行为评估</a>
				</td>
			</tr>
		</table>
		
	    <div id="win1" style="width:580px;height:450px;"
	         showModal="true" allowResize="true">
	        <div class="ct" id="chart1" style="height:100%;width:100%;">></div>
	    </div>
	    
		<script type="text/javascript">
			mini.parse();
			
		    var deptCombo = mini.get("deptCombo");
		    var positionCombo = mini.get("positionCombo");
	        var staffCombo = mini.get("staffCombo");
	        
			var option = {
		        color: ['#3398DB'],
		        tooltip: {
		            trigger: 'axis',
		            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
		                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		            }
		        },
		        grid: {
		            left: '3%',
		            right: '4%',
		            bottom: '3%',
		            containLabel: true
		        },
		        yAxis: {
	                min:0,
	                max:5,
	                axisLabel:{
	                    formatter: function (value) {
							var texts = [];
							if(value == 1){
								texts.push('非常不同意');
							} else if (value == 2) {
								texts.push('比较不同意');
							} else if (value == 3) {
								texts.push('一般');
							} else if (value == 4){
								texts.push('比较同意');
							} else if (value == 5){
								texts.push('非常同意');
							} else {
								texts.push('0');
							}
							return texts;
	                    }
	                }
                }
		    };

		    function buildChart() {
		    	var factor = [];
		        var factorRatArray = [];
		        var allFactor ;
		        var chart1 = echarts.init(document.getElementById('chart1'));
		        var staffName = staffCombo.getText();
		        var staffId = staffCombo.getValue();
		        var title = staffName+"行为评估分析"
		        
		        $.get("${ctx}/factor/listFactor.do",function(r){
		        	allFactor = r;
		        	
					for( var i=0;i<r.length;i++) {
			        	var factorRatio = {};
						factor.push(r[i].factorName);
						factorRatio.name = r[i].factorName;
		        		factorRatio.value = i;
		        		factorRatArray.push(factorRatio);
					}  
					
					option.xAxis = [
			            {
			                type: 'category',
			                data: factor,
			                axisTick: {
			                    alignWithLabel: true
			                }
			            }
			        ];
					 
		        	$.post("${ctx}/researchResult/getResultByStaffId.do",{staffId:staffId},function(r){
		        		var data = [];
		        		for(var i=0;i<r.length;i++){
		        			data.push(r[i].researchReply);
		        		}
		        		
		        		option.series = [
				            {
				                name: '分数',
				                type: 'bar',
				                barWidth: '40%',
				                data: data
				            }
				         ];
						
		        		var result =0;
		        		for(var i=0;i<allFactor.length;i++) {
		        			result += data[i]* (allFactor[i].factorRatio)  			
		        		}
		        		
		        		var analyzeResult = "评估通过";
		        		if ( result >= allFactor.length*0.6 ) {
		        			analyzeResult = "评估通过";
		        		} else {
		        			analyzeResult = "评估不合格";
		        		}
		        		
		 		        option.title = { 
		 	        		text: title,
		 		            subtext: analyzeResult,
		 		            x: 'center'
		 	            };
		        		chart1.setOption(option);
		        		
		        	});
		        	
		        	
		    	});
		    }	
		    
		    buildChart();

	        function onDeptChanged(e) {
	            var departId = deptCombo.getValue();
	            var url = "${ctx}/job/getJobNameAndId.do?departId=" + departId;
	            positionCombo.setValue("");
	            positionCombo.setUrl(url);
	        }
		    
		    function onPositionChanged(e) {
	    	  	var jobId = positionCombo.getValue();
	            var url = "${ctx}/staff/getStaffByJobId.do?jobId=" + jobId;
	            staffCombo.setValue("");
	            staffCombo.setUrl(url);
	            staffCombo.select(0);
		    }
		    
		</script>
	</body>
</html>