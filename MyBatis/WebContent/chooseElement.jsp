<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "com.action.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询界面</title>
<!-- header -->
<div class="header_w3l">
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<h1><a  href="index.jsp">Welcome<span> Cal<span> Lab </span></a></h1>
			</div>
				<!-- top-nav -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp">首页</a></li>
					<li><a href="chooseElement.jsp" class="active">查询</a></li>
					<li><a href="managerLogin.jsp">管理员登录</a></li>
					<li><a href="contactUs.jsp">联系我们</a></li>
				</ul>	
			</div>
		</nav>
	</div>
</div>
<!-- header -->
</head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery.js"></script>
<style>
		.wrap {
            width: 100%;
            height: 303px;
            padding: -20px;                  
            opacity: 0.8;
            background: linear-gradient(to bottom right,#50a3a2,#53e3a6);
            background: -webkit-linear-gradient(to bottom right,#50a3a2,#53e3a6);
        }
		input[type="button"],input[type="submit"], button{
			text-decoration:none;
			border: none;
			background:#ffffff;
			color:#666666;			
			cursor: pointer;
			padding: 7px 30px 10px 30px;
			border-radius:5px;
			-webkit-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			-moz-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			box-shadow: 5px 5px 3px rgba(0,0,0,0.5);
			font: 20px/1 Tahoma,Helvetica,Arial,"\5b8b\4f53",sans-serif;
			font-weight:bold;
		}
		input[type='submit']:hover {
            cursor: pointer;
            width: 210px;
        }
        input [type="button"], button:hover {
            cursor: pointer;
            width: 70px;
        }
		input[type="submit"]{
			display:block;
			width:200px;

			margin-left:300px;
		}
		td{
			color: #FFFFFF;
			font:  12px/1.5 Tahoma,Helvetica,Arial,'å®ä½',sans-serif;
			font-weight:bold;
			font-size: 18px;
		}
		select{
			padding: 5px 10px 5px 10px;
			font-size: 18px;
		}
		tr{
			color: #FFFFFF;	
			width:710px;
			display:block ;
			margin-top: 10px;
			padding: 5px;
		}

		table{
			display: flex;
			border-collapse: collapse;
			align-items: center;
			justify-content: center;


		}

		input[type=checkbox]{
			width: 21px;
			height: 21px;
			background: #ddd;
			border-radius: 100%;
			position: relative;
			-webkit-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			-moz-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
		}
		input[type=checkbox] label{
			display: block;
			width: 30px;
			height: 30px;
			border-radius: 100px;
            color:green;
			-webkit-transition: all .5s ease;
			-moz-transition: all .5s ease;
			-o-transition: all .5s ease;
			-ms-transition: all .5s ease;
			transition: all .5s ease;
			cursor: pointer;
			position: absolute;
			top: 5px;
			left: 5px;
			z-index: 1;

			background: #333;

			-webkit-box-shadow:inset 0px 1px 3px rgba(0,0,0,0.5);
			-moz-box-shadow:inset 0px 1px 3px rgba(0,0,0,0.5);
			box-shadow:inset 0px 1px 3px rgba(0,0,0,0.5);
		}
		input[type=checkbox]:checked + label {
			color:#FFF937;
		}
		.last{
			border: none;
		}
		.last td{
			width:111px;
		}
		.tdLabel{
			width:100px;
			font-size: 24px;
			color:#FFFFFF;
			font-weight:bold;
			text-shadow: 0 -1px 0 rgba(1.3,1.3,1.3,1.3);			
		}
		tr:first-child{
			border-bottom:none;
		}
		.quanxuanh{
			padding: 0;
			width: 65px;
			height: 35px;
			color:#666666;
			background:#FFFFFF;
			font-size: 12px;
			position: absolute;
			top:376px;
			left:1005px;
			-webkit-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			-moz-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			box-shadow: 3px 3px 3px rgba(0,0,0,0.5);
			font: 13px/1 Tahoma,Helvetica,Arial,"\5b8b\4f53",sans-serif;
			font-weight:bold;
			text-shadow: 0 -1px 0 rgba(0,0,0,0.2);
		}
		.fanxuanh{
			padding: 0;
			width: 65px;
			height: 35px;
			color:#666666;
			background:#FFFFFF;
			font-size: 12px;
			position: absolute;
			top:376px;
			left:1086px;
			-webkit-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			-moz-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			box-shadow: 3px 3px 3px rgba(0,0,0,0.5);
			font: 13px/1 Tahoma,Helvetica,Arial,"\5b8b\4f53",sans-serif;
			font-weight:bold;
			text-shadow: 0 -1px 0 rgba(0,0,0,0.2);
		}
		.fanxuann{
			padding: 0;
			width: 65px;
			height: 35px;
			color:#666666;
			background:#FFFFFF;
			font-size: 12px;
			position: absolute;
			top:512px;
			left:1086px;
			-webkit-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			-moz-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			box-shadow: 3px 3px 3px rgba(0,0,0,0.5);
			font: 13px/1 Tahoma,Helvetica,Arial,"\5b8b\4f53",sans-serif;
			font-weight:bold;
			text-shadow: 0 -1px 0 rgba(0,0,0,0.2);
		}
		.quanxuann{
			padding: 0;
			width: 65px;
			height: 35px;
			color:#666666;
			background:#FFFFFF;
			font-size: 12px;
			position: absolute;
			top:512px;
			left:1005px;
			-webkit-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			-moz-box-shadow: 0px 1px 3px rgba(0,0,0,0.5);
			box-shadow: 3px 3px 5px rgba(0,0,0,0.5);
			font: 13px/1 Tahoma,Helvetica,Arial,"\5b8b\4f53",sans-serif;
			font-weight:bold;
			text-shadow: 0 -1px 0 rgba(0,0,0,0.2);
		}
	.showResult{
			padding: 0;
			width: 105px;
			height: 35px;
			position: absolute;
			top:443px;
			left:690px;
			text-shadow: 0 -1px 0 rgba(0,0,0,0.3);
		}
	</style>
<script type="text/javascript">
	
		function selectAllAge() {  
            var ages = document.getElementsByName("ageList");  
              
            for (var i=0; i < ages.length; i++) {  
                var age = ages[i];  
                age.checked = true;  
            }             
        }
		function inverseAge() {  
            var ages = document.getElementsByName("ageList");  
              
            for (var i=0; i < ages.length; i++) {  
                var age = ages[i];  
                  
                if(age.checked) {  
                    age.checked = false;  
                }else {  
                    age.checked = true;  
                }  
            }  
        } 
		function selectAllRadio() {  
            var radios = document.getElementsByName("radioList");  
              
            for (var i=0; i < radios.length; i++) {  
                var radio = radios[i];  
                radio.checked = true;  
            }             
        }
		function inverseRadio() {  
            var radios = document.getElementsByName("radioList");  
              
            for (var i=0; i < radios.length; i++) {  
                var radio = radios[i];  
                  
                if(radio.checked) {  
                    radio.checked = false;  
                }else {  
                    radio.checked = true;  
                }  
            }  
        } 
	</script>
<body>	
<img src="images/indexAd.JPG" alt="Smiley face"  style="max-width:100%;">			
<div class="wrap">
	<br>
	<button class="quanxuanh" onclick="selectAllRadio();">全选核素</button>
	<button class="fanxuanh" onclick="inverseRadio();">反选核素</button>
	<button class="quanxuann" onclick="selectAllAge();">全选年龄</button>
	<button class="fanxuann" onclick="inverseAge();">反选年龄</button>
	
	<form action="getE" name="getAgeForm" method="post">
	<table>	
	    <tr>
			<td>
				<s:checkboxlist list="{'210Po','226Ra','238U','232Th'}" id="radioList" name="radioList" label="自然核素"> </s:checkboxlist>
				<s:checkboxlist list="{'89Sr','90Sr','131I','137Cs','239Pu'}" id="radioList" name="radioList" label="人工核素"> </s:checkboxlist>				
			</td>
			<td>
				<s:checkboxlist list="{'2-7','8-12','13-17(M)','13-17(F)','18-50(M)','18-50(F)','51-65(M)','51-65(F)','>65(M)','>65(F)'}" id="ageList" name="ageList" label="年龄"> </s:checkboxlist>
			</td>
	    </tr>
	    <tr>
			
			<td>
				<input type="submit" class="showResult" value="查 询 结 果">
			</td>
			
	    </tr>	
	       
	</table>
	</form>
</div>
</body>
</html>