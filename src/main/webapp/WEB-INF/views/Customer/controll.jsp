<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  	<link rel="stylesheet" href=".././css/animate.css">
  	<link rel="stylesheet" href=".././css/Chart.css">
  	
  	<script src=".././js/Chart.js"></script>
  	<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/dashboard/">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
 	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 	 <link rel="stylesheet" href=".././css/a.css">
</head>
<%@include file=".././menu/headC.jsp"%>
<style>
 #cctv {
 	height: 500px;
 	width: 600px;
 	align-self:center;
 	display: inline-block;
 }
 #cctvcontent img{
 	text-align: center;
 }
 #cctvcontent h1{
 	text-align: center;
 }
 .btnimg{
 	height: 50px;
 	width: 60px;
 }
 img {
 	display:block;
 }

</style>
    
	<!-- 여기부터가 페이지 내용관리하는 부분 여기 밑에다 정리 부탁드립니다 -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="row" id="main" >
                <div class="col-sm-12 col-md-12 well" id="content" style="margin-bottom: 70px;">
                	<!-- 여기는 제목을 담다하는 부분 -->
                    <h1>감지사진</h1>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- 여기에서 작업하기 -->
        <div class="col-sm-12 col-md-12 well" id="cctvcontent">
	        <!-- 여기는 제목을 담다하는 부분 -->
	        		<div class="col-sm-12 col-md-12" style="border: 1px; border-style: solid;margin-bottom: 20px;">
                    	<h1>동작중인 CCTV</h1>
                    </div>
                    
                    <div class="cap col-sm-12 col-md-12"  style="text-align: center; align-content: center;align-items: center;">
	                    <img alt="cctv" id="cctv">
	                </div>
	                <div class="cap col-sm-12 col-md-12" style="text-align: center;align-content: center;">
							<div class="col-sm-12 col-md-12 well" style="margin: 10px;">
					        	<button class="up" onclick="tcp(this)">UP</button>
					        	<button class="Right" onclick="tcp(this)">Right</button>
					        	<button class="Left" onclick="tcp(this)">Left</button>
					        	<button class="Down" onclick="tcp(this)">Down</button>
					        </div>
						</div>
					<div>
						<ul class="pagination" >
		                    		<script>
		                    			var ipd;
			                    		var i = 1;
			                    		console.log("시작됨");
			                    		var data = new Array();
			                    		$(document).ready(function () 
			                    				{
			                    				    $('#cctv').attr("src","http://${first.r_ip}:8090/?action=stream");
			                    				});
			                    			<c:forEach items="${data}" var="dota" >
			                    			console.log("제발");
			                    				data.push("${dota.r_ip}");
				                    			document.write("<li><button class=\""+i+" btnimg\" onclick=\"changeip\(this\)\"><img src=\"http://${dota.r_ip}:8090/?action=stream\"></button></li>");
				                    			i++;
			                    			</c:forEach>
			                    			function changeip(button) {
			                    				$('#cctv').removeAttr('src')
			                    					var id = button.className;
			                    					var dot = id.split('');
			                    					ipd=data[dot[0]-1]
			                    					console.log(dot)
			                    				 	$('#cctv').attr("src","http://"+data[dot[0]-1]+":8090/?action=stream");
			        
			                    				}
			                    			function tcp(button){
			                    				var data = button.className;
			                    				var net= "192.168.0.7";
			                    				console.log("수고링");
			                    				console.log(ipd);
			                    				var zip = {"data":data,"ip":net};
			                    				
			                    			    $.ajax({
			                    			        url:"url.do",
			                    			        type:'post',
			                    			        data: zip,
			                    			        success:function(data){
			                    			            alert("완료!");
			                    			            
			                    			            
			                    			        },
			                    			        error:function(jqXHR, textStatus, errorThrown){
			                    			            
			                    			            self.close();
			                    			        }
			                    			    });
			                    			}
		                    		</script>
							</ul>
					</div>
        </div>
        
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->
<script>




</script>

</body>

</html>