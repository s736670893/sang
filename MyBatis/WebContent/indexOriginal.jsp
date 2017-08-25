<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "com.action.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript">
	function f_DL(){
	//s="fileUploadAction!download.action?filePath="+"localhost:8080/fileUploadandDownload/file/log4j-core-2.7.jar";
    window.location.href="downloadAction";
	}
	function ajaxFileUpload()
    {
        $.ajaxFileUpload
        (
            {
                url:'fileUploadAction.action',//用于文件上传的服务器端请求地址
                secureuri:false,//一般设置为false
                fileElementId:'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'json',//返回值类型 一般设置为json
                success: function (data, status)  //服务器成功响应处理函数
                {
                    alert(data.message);//从服务器返回的json中取出message中的数据,其中message为在struts2中action中定义的成员变量
                    
                    if(typeof(data.error) != 'undefined')
                    {
                        if(data.error != '')
                        {
                            alert(data.error);
                        }else
                        {
                            alert(data.message);
                        }
                    }
                },
                error: function (data, status, e)//服务器响应失败处理函数
                {
                    alert(e);
                }
            }
        )
        return false;
    }
		
		
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