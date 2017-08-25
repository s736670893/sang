<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "com.action.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
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
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp">首页</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="codes.jsp" class="active">Short Codes</a></li>
					<li><a href="managerLogin.jsp">管理员登录</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>	
				<div class="clearfix"> </div>	
			</div>
			<input type="button" onclick="window.location.href='index.jsp'" value="首页">
			<input type="button" onclick="window.location.href='managerLogin.jsp'" value="管理员界面">
	<br>
	<button onclick="selectAllRadio();">全选核素</button>
	<button onclick="inverseRadio();">反选核素</button>
	<button onclick="selectAllAge();">全选年龄</button>
	<button onclick="inverseAge();">反选年龄</button>
	
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
				<input type="submit" value="查看结果">
			</td>
			
	    </tr>	
	       
	</table>
	</form>
	
</body>
</html>