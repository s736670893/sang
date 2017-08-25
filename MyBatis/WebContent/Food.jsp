<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery.js"></script>
<title>查看结果</title>
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
					<li><a class="active">查询结果</a></li>
					<li><a href="index.jsp">首页</a></li>
					<li><a href="chooseElement.jsp">查询</a></li>
					<li><a href="managerLogin.jsp">管理员登录</a></li>
					<li><a href="contactUs.jsp">联系我们</a></li>
				</ul>	
				<div class="clearfix"> </div>	
			</div>
		</nav>
	</div>
</div>
<!-- header -->
</head>
<style>
        .city{
            display: none;;
        }
        .city_first {
            display: block;
        }
    </style>
<script type="text/javascript" src="echarts-2.2.7/build/dist/echarts.js"></script>   
<script src="js/jquery.min.js"></script>
<script type="text/JavaScript" src="js/jquery.js"></script>
<script>
      
        
        
      //echarts start
   	 require.config({
               paths: {
                   echarts: 'echarts-2.2.7/build/dist'
               }
           });
           
           // 使用
           require(
               [
                   'echarts',
                   'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
               ],
               function (ec) {
                   // 基于准备好的dom，初始化echarts图表
                   var array = new Array();//食物类型  
                   array=["粮谷类","豆类","蔬菜类","乳制品","饮料及水","茶叶及相关制品","酒类","水果类","蛋类","肉类","水产类","糖类"];
                   /*
                   <c:forEach items="${foodTypeList}" var="item" varStatus="status" >  
                       array.push("${item}");
                   </c:forEach> 
                    */                      				
    			 
                   //图一start
                   var diva = ["diva1","diva2","diva3","diva4","diva5","diva6","diva7","diva8","diva9"];
                   var array1 = new Array();//存grapgone的纵坐标值 contaver
                   var array2 = new Array();//存grapgone的lkj 
                   var ele;
                   var radioName;
                   <c:forEach items="${graphOne}" var="itemSum" varStatus="statusa" > 
    				<c:forEach items="${itemSum.graphOneModel}" var="item" varStatus="status" >  
        				for (var i=0;i<array.length;i++)
        				{
        					if("${item.foodType}" == array[i])
        						{
        							array1[i] = "${item.contaver}";
        							array2[i] = "${item.LKJ}";
        							radioName = "${item.radio}";
        						}
        				}
    				</c:forEach>
                    ele=document.getElementById("diva${statusa.count}");//这里第9个不出结果
                    ele.style.display= "block";
                    var myChart = ec.init(ele); 
                    var ifExceedSum = "${itemSum.graphOneHead.ifExceedSum}";
                    var ifExceedSumString;
                    if(ifExceedSum<1){
                    	ifExceedSumString = "   总值="+ifExceedSum+" < 1,符合国家标准";
                    }else{
                         ifExceedSumString = "   总值="+ifExceedSum+" > 1,超出国家标准";
                    }
                    var option = {
                 		   title : {
                 		        text: radioName+"检测结果",
                 		        subtext: "${itemSum.graphOneHead.unit}"+ifExceedSumString,
                 		        textStyle:{
                 		        	fontSize: 18,
                 		            fontWeight: 'bolder',
                 		            color: '#89cff0',
                 		            fontStyle:'normal'
                 		        },
                 		   subtextStyle:{
                 			   color: 'gray'
                 		   }
                 		    },
                 		   tooltip: {
                            show: true
                        },
                        legend: {
                     	   
                     	   data: [
                                {
                                    name:'检测结果',
                                    //icon : 'image://../asset/ico/favicon.png',
                                    textStyle:{fontWeight:'bold', color:'#89cff0'}
                                },
                                {
                                    name:'国标线',
                                    textStyle:{fontWeight:'bold', color:'orange'}
                                }
                                
                            ]
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                dataView : {show: true, readOnly: false},
                                saveAsImage : {show: true}
                            }
                        },
                        /*
                        title: {  
                            text: radioName,  
                            style: {  
                                margin: '10px 100px 0 0' ,// center it  
                            }  
                        }, 
                        */
                        xAxis : [
                            {
                         	   name:  "类型",
                         	   type : 'category',
                                data : array
                            
                            }
                        ],
                        yAxis : [
                            {
                                type : 'value'
                            }
                        ],
                        series : [
                            {
                         	   "name":'检测结果',
                         	   "type":"bar",
                                "data":array1,
                                itemStyle: {  
                                    normal: {  
                                        color: '#89cff0'
                                    }  
                                }
                            ,
                            markPoint:{
                         	   itemStyle: {  
                                    normal: {  
                                        color:'#FA8565',  
                                        label: {  
                                            formatter: '{c}'  
                                        }  
                                    }  
                                     },
                                     data : [
                                         {name: '国标线', value: array2[0], xAxis: 0, yAxis: array2[0]},      // 当xAxis为类目轴时，数值1会被理解为类目轴的index
                                         //{name: '国标线', value: 0.034, xAxis: '水果类', yAxis: 0.034} // 当xAxis为类目轴时，字符串'周三'会被理解为与类目轴的文本进行匹配
                                         {name: '国标线', value: array2[1], xAxis: 1, yAxis: array2[1]},
                                         {name: '国标线', value: array2[2], xAxis: 2, yAxis: array2[2]},
                                         {name: '国标线', value: array2[3], xAxis: 3, yAxis: array2[3]},
                                         {name: '国标线', value: array2[4], xAxis: 4, yAxis: array2[4]},
                                         {name: '国标线', value: array2[5], xAxis: 5, yAxis: array2[5]},
                                         {name: '国标线', value: array2[6], xAxis: 6, yAxis: array2[6]},
                                         {name: '国标线', value: array2[7], xAxis: 7, yAxis: array2[7]},
                                         {name: '国标线', value: array2[8], xAxis: 8, yAxis: array2[8]},
                                         {name: '国标线', value: array2[9], xAxis: 9, yAxis: array2[9]},
                                         {name: '国标线', value: array2[10], xAxis: 10, yAxis: array2[10]},
                                         {name: '国标线', value: array2[11], xAxis: 11, yAxis: array2[11]}
                                         
                                     ]
                            } 
                                
                            }
                            
                        ]
                        
                    };
                    myChart.setOption(option); 
    			   </c:forEach>                  
                   //图一end
                   
                   //图二start
                   var divb = ["divb1","divb2","divb3","divb4","divb5","divb6","divb7","divb8","divb9","divb10","divb11","divb12","divb13","divb14","divb15","divb16","divb17","divb18","divb19","divb20","divb21","divb22","divb23","divb24","divb25","divb26","divb27","divb28","divb29","divb30"];
                   var arraySVT = new Array();//存grapgtwo的纵坐标值 SVT
                   var radioName;
                   var eleb;
                   <c:forEach items="${graphTwo}" var="itemSumb" varStatus="statusb" >
                   //alert("${statusb.count}");
    				<c:forEach items="${itemSumb.SVTModel}" var="itemb" varStatus="statusc" >  
        				for (var i=0;i<array.length;i++)
        				{
        					if("${itemb.foodType}" == array[i])
        						{
        							arraySVT[i] = "${itemb.SVT}";
        							radioName = "${itemb.radio}"+"   "+"${itemb.age}"+"岁   ";
        						}
        				}
    				</c:forEach>
    				eleb=document.getElementById("divb${statusb.count}");
                    eleb.style.display= "block";
                   var myChartx = ec.init(eleb);
                   var optionx = {
                		   title : {
               		        text: radioName+"的Sv计算结果",
               		        subtext: " SVT="+"${itemSumb.graphTwoHead.SVTRA}" ,
               		        textStyle:{
               		        	fontSize: 18,
               		            fontWeight: 'bolder',
               		            color: '#82cff0',
               		            fontStyle:'normal'
               		        },
               		   subtextStyle:{
               			   color: 'gray'
               		   }
               		    },
                       tooltip: {
                    	   show:true
                       },
                       legend: {
                           data:['Sv计算结果']
                       },
                       toolbox: {
                           show : true,
                           feature : {
                               dataView : {show: true, readOnly: false},
                               saveAsImage : {show: true}
                           }
                       },
                       xAxis : [
                           {
                        	   name:  "类型",
                        	   type : 'category',
                               data : array
                           
                           }
                       ],
                       yAxis : [
                           {
                               type : 'value'
                           }
                       ],
                       series : [
                           {
                        	   "name":'Sv计算结果',
                        	   "type":"bar",
                               "data":arraySVT,
                               itemStyle: {  
                                   normal: {  
                                       color: '#82cff0'
                                   }  
                               }
                           }
                           
                           
                       ]
                   };
                   myChartx.setOption(optionx);
   				</c:forEach>
                 //图二end
               }
           );
   	//echarts end
    </script>
<body>
		<br>
	  	  <div id="diva1" style="width:1250px;width:1250px;height:400px;display:none"></div>
	  	  <div id="diva2" style="width:1250px;height:400px;display:none"></div>
	  	  <div id="diva3" style="width:1250px;height:400px;display:none"></div>
	  	  <div id="diva4" style="width:1250px;height:400px;display:none"></div>
	  	  <div id="diva5" style="width:1250px;height:400px;display:none"></div>
	  	  <div id="diva6" style="width:1250px;height:400px;display:none"></div>
	  	  <div id="diva7" style="width:1250px;height:400px;display:none"></div>
	  	  <div id="diva8" style="width:1250px;height:400px;display:none"></div>	
	  	  <div id="diva9" style="width:1250px;height:400px;display:none"></div>
	  	  	  	  	  	    
	   	   <div id="divb1" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb2" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb3" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb4" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb5" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb6" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb7" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb8" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb9" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb10" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb11" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb12" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb13" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb14" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb15" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb16" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb17" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb18" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb19" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb20" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb21" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb22" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb23" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb24" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb25" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb26" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb27" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb28" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb29" style="width:1250px;height:400px;display:none"></div>
	   	   <div id="divb30" style="width:1250px;height:400px;display:none"></div>
	   	   
	   <!--   <s:checkboxlist list="ageList" name="ageList" label="年龄"></s:checkboxlist>
	   <br>
	   <s:checkboxlist list="radioList" name="radioList" label="核素"></s:checkboxlist>-->
	   
	    
</body>
</html>