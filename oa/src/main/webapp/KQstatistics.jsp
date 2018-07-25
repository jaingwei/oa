<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>华天协同OA平台</title>
		<link rel="stylesheet" type="text/css" href="/oa/css/public.css" />
		<link rel="stylesheet" type="text/css" href="/oa/css/KQstatistics.css" />
		<script type="text/javascript" src="/oa/js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
		 $(function() {
			  click();
			  getSign();
			  getDeparts();
			  getUser();
			 
			  role();
			  roleclick();
			 
           })
           

			function click(){
				$('.h_click_li_return').click(function() {
					$('.h_over').toggle();
				})
				$('.s_left_1_hui').click(function(){
					var index = $('.s_left_1_hui').index($(this));
					$('.s_left_1_hui_ul').eq(index).toggle();
				})
		
				$('.h_head>ul>li').mouseover(function(){
					$(this).css('background-color','#3A5FCD')
				}).mouseout(function(){
					$(this).css('background-color','#039adf')
				})
			}
		//获取菜单
			function role(){
				$.ajax({
					type:"post",
					data:{
						
					},
					dataType:"json",
					url:"/oa/role/getsys.do",
					success:function(data){
						var num=0;
						var i1 =0;
						var i2 =0;
						var i3 =0;
						var i4 =0;
						var i5 =0;
						var i6 =0;
						var roleul=$(".s_left_1_ul");
						$.each(data,function(i,v){
							if (v['parent_order']==1 && i1==0) {
								var li1 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i1++;
								num++;
								roleul.append(li1);
							}
							if (v['parent_order']==1 && i1==1) {
								var li11 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+ "</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li11);
							}
							
							if (v['parent_order']==2 && i2==0) {
								var li2 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i2++;
								num++;
								roleul.append(li2);
							}
							if (v['parent_order']==2 && i2==1) {
								var li22 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+ "</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li22);
							}
							
							if (v['parent_order']==3 && i3==0) {
								var li3 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i3++;
								num++;
								roleul.append(li3);
							}
							
							if (v['parent_order']==3 && i3==1) {
								
								var li33 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+ "</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li33);
							}
							
							if (v['parent_order']==4 && i4==0) {
								var li4 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i4++;
								num++;
								roleul.append(li4);
							}
							
							if (v['parent_order']==4 && i4==1) {
								
								var li33 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+ "</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li33);
							}
							
							if (v['parent_order']==5 && i5==0) {
								var li3 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i5++;
								num++;
								roleul.append(li3);
							}
							
							if (v['parent_order']==5 && i5==1) {
								
								var li33 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+ "</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li33);
							}
							
							if (v['parent_order']==6 && i6==0) {
								var li3 = "<li>"+v['parent_name']
								+ "<ul></ul>"
								+ "</li>"
								i6++;
								num++;
								roleul.append(li3);
							}
							
							if (v['parent_order']==6 && i6==1) {
								
								var li33 = "<li><a href= "+v['node_url']+">"+v['display_name']
								+"</a></li>";
								$(".s_left_1_ul>li:nth-of-type("+num+")>ul").append(li33);
							}
							
						})
					},
					error:function(){
						
					}
					
				})
			
			
			}
			function roleclick(){
				$(document).on("click",".s_left_1_ul>li",function(){
					$(this).find('ul').toggle();
				})
			}
		 //拿取签到信息
		   function getSign(i){
			   
			   $(".table10").html("");
				  $.ajax({
					  type:"post",
					  data:{
						 name:$(".select10>option:selected").val(),
						 depart:$(".select11>option:selected").val()
					  },
					  dataType:"json",
					  url:"/oa/sign/getsignNum.do",
					  success:function(data){ 
						   $.each(data,function(i,v){
							   var tr ="<tr>"
							   +"<td>"+v['username']+"</td>"
							   +"<td>"+v['attendance']+"</td>"
							   +"<td>"+v['late']+"</td>"
							   +"<td>"+v['early']+"</td>"
							   +"<td>"+v['noday']+"</td>"
							   +"<td>"+v['depart']+"</td>"
							   +"<td>"+v['branch']+"</td>"
							   +"</tr>";
							   $(".table10").append(tr);
						   })
  
					  },
					  error:function(){
						  alert("失败");
					  }
				  }) 
		   }
		   
		   //拿取所有人员信息（根据部门中）
		 function getUser(){
	      $(".table").html("");
	       $.ajax({
		     type:"post",
		        data:{
		  },
		  dataType:"json",
		  url:"/oa/user/getUserName.do",
		  success:function(data){ 
			   $.each(data,function(i,v){
				   var bu ="<option  value='"+v['user_id']+"'>"+v['user_name']+"</option>";
				   $(".select10").append(bu);
			   })
			   
		  },
		  error:function(){
			  alert("失败");
		  }
	  })
    }
		   //拿取所有部门信息
		   function getDeparts(){
			  $.ajax({
				  type:"post",
				  data:{
					 
				  },
				  dataType:"json",
				  url:"/oa/depart/getDeparts.do",
				  success:function(data){ 
					  $.each(data,function(i,v){
						  var bu ="<option  value='"+v['depart_id']+"'>"+v['depart_name']+"</option>";
						  $(".select11").append(bu);
						 
						  
					   })
				  },
				  error:function(){
					  alert("失败");
				  }
			  })
		  }
		   //时间格式化
           function formatDate(time){
            var date = new Date(time);

             var year = date.getFullYear(),
              month = date.getMonth() + 1,//月份是从0开始的
              day = date.getDate(),
              hour = date.getHours(),
              min = date.getMinutes(),
              sec = date.getSeconds();
              var newTime = year + '-' +
              month + '-' +
              day + ' ' +
              hour + ':' +
              min + ':' +
              sec;
               return newTime;         
              }
		   
		</script>
</head>
<body>
<header>
			<div class="h_head">
				<div class="h_img">
					<img src="img/FILE1563454828253BH.png" height="28px" width="28px" />
					<p>
						<a href="#">管理员</a>
						<a href="#">办公室</a>
					</p>
				</div>
				<ul>
					<li>
						<a href="#"></a>
					</li>
					<li>
						<a href="#" class="h_top_a">快捷方式</a>
					</li>
					<li>
						<a href="#" class="h_top_a">个人办公</a>
					</li>
					<li>
						<a href="#" class="h_top_a">审批流程</a>
					</li>
					<li>
						<a href="#" class="h_top_a">工作中心</a>
					</li>
					<li>
						<a href="#" class="h_top_a">工作任务</a>
					</li>
					<li>
						<a href="#" class="h_top_a">内部邮件</a>
					</li>
					<li>
						<a href="#" class="h_top_a">文档中心</a>
					</li>
					<li>
						<a href="#" class="h_top_a">信息发布</a>
					</li>
					<li class="h_click_li" title="更多列表">
						<p class="h_click_li_return"></p>
						<div class="h_over">
							<ul>
								<li>
									<a href="#" class="h_top_a">公文发文</a>
								</li>
								<li>
									<a href="#" class="h_top_a">采购合同</a>
								</li>
								<li>
									<a href="#" class="h_top_a">设备管理</a>
								</li>
							</ul>
							<ul>
								<li>
									<a href="#" class="h_top_a">公文收文</a>
								</li>
								<li>
									<a href="#" class="h_top_a">人力资源</a>
								</li>
								<li>
									<a href="#" class="h_top_a">报表中心</a>
								</li>
							</ul>
							<ul>
								<li>
									<a href="#" class="h_top_a">客户管理</a>
								</li>
								<li>
									<a href="#" class="h_top_a">网上交流</a>
								</li>
								<li>
									<a href="#" class="h_top_a">工程管理</a>
								</li>
							</ul>
							<ul>
								<li>
									<a href="#" class="h_top_a">综合行政</a>
								</li>
								<li>
									<a href="#" class="h_top_a">电子邮件</a>
								</li>
							</ul>
							<ul>
								<li>
									<a href="#" class="h_top_a">考勤</a>
								</li>
								<li>
									<a href="#" class="h_top_a">系统管理</a>
								</li>
							</ul>

						</div>
					</li>
				</ul>

			<div class="f_head_msg">
		
			   欢迎： <a href="/oa/RSMmploye.jsp">${user.user_name}</a>
	     </div>
		<p class="f_head_tubiao">
		     
			<a href="#"></a> 
			<a href="/oa/first.jsp"></a> 
			<a href="#"></a> 
			<a href="/oa/first.jsp" onclick="removesession()" ></a>
		</p>
			</div>

		</header>
		<section>
			<div class="section">
				<div class="s_left">
				<div class="s_left_1">
					<ul class="s_left_1_ul">

					</ul>
				</div>
			</div>
				<div class="section_1"></div>
				<div class="f_right">
					<div class="f_right_top">
						<p>当前位置:</p>
						<p>员工考勤统计</p>
					</div>
					<p class="f_right_biao">员工考勤统计</p>
					<div class="f_right_body">
						<form>
					

							<p class="condition">

								<span class="span10">按姓名</span>
								<select class="select10">
								<option value="-1" selected='selected'>请选择———</option>
								</select>
								<span class="span11">按部门</span>
								<select class="select11">
								<option value="-1" selected='selected'>请选择———</option>
								</select>
								<input type="button" value="统计" class="tongji" onclick="getSign(1)" style="background-color: origen;"/>
							 <a href="##" id="Button1" onclick="javascript:method1('dataTable')">导出EXCEL</a>
							</p>

							</p>
						</form>
						<div class="f_right_body_table">
							<table cellspacing="0" border="1" frame="void" width="100%"  id="dataTable">
								<tr>
									<th>姓名</th>
									<th>出勤率</th>
									<th>迟到次数</th>
									<th>早退次数</th>
									<th>旷工次数</th>
									<th>所属部门</th>
									<th>所属公司</th>
								</tr>
								
                                 <tbody class="table10"></tbody>
								
							</table>

						</div>

					</div>

				</div>
		</section>
		<footer>

		</footer>
		<script type="text/javascript" language="javascript">
        var idTmr;
        function  getExplorer() {
            var explorer = window.navigator.userAgent ;
            //ie 
            if (explorer.indexOf("MSIE") >= 0) {
                return 'ie';
            }
            //firefox 
            else if (explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';
            }
            //Chrome
            else if(explorer.indexOf("Chrome") >= 0){
                return 'Chrome';
            }
            //Opera
            else if(explorer.indexOf("Opera") >= 0){
                return 'Opera';
            }
            //Safari
            else if(explorer.indexOf("Safari") >= 0){
                return 'Safari';
            }
        }
        function method1(tableid) {//整个表格拷贝到EXCEL中
            if(getExplorer()=='ie')
            {
                var curTbl = document.getElementById(tableid);
                var oXL = new ActiveXObject("Excel.Application");
 
                //创建AX对象excel 
                var oWB = oXL.Workbooks.Add();
                //获取workbook对象 
                var xlsheet = oWB.Worksheets(1);
                //激活当前sheet 
                var sel = document.body.createTextRange();
                sel.moveToElementText(curTbl);
                //把表格中的内容移到TextRange中 
                sel.select;
                //全选TextRange中内容 
                sel.execCommand("Copy");
                //复制TextRange中内容  
                xlsheet.Paste();
                //粘贴到活动的EXCEL中       
                oXL.Visible = true;
                //设置excel可见属性
 
                try {
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
                } catch (e) {
                    print("Nested catch caught " + e);
                } finally {
                    oWB.SaveAs(fname);
 
                    oWB.Close(savechanges = false);
                    //xls.visible = false;
                    oXL.Quit();
                    oXL = null;
                    //结束excel进程，退出完成
                    //window.setInterval("Cleanup();",1);
                    idTmr = window.setInterval("Cleanup();", 1);
 
                }
 
            }
            else
            {
                tableToExcel(tableid);
            }
        }
        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }
        var tableToExcel = (function() {
              var uri = 'data:application/vnd.ms-excel;base64,',
              template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><meta charset="UTF-8"><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
                base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
                format = function(s, c) {
                    return s.replace(/{(\w+)}/g,
                    function(m, p) { return c[p]; }) }
                return function(table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
                  document.getElementById("Button1").href = uri + base64(format(template, ctx));
                 document.getElementById("Button1").download = formatDate(new Date().getTime())+".xls";
              }
            })()
    </script>
		
</body>
</html>