<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>华天协同OA平台</title>
		<link rel="stylesheet" type="text/css" href="/oa/css/public.css" />
		<link rel="stylesheet" type="text/css" href="/oa/css/syslog.css"/>
		<script type="text/javascript" src="/oa/js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
		$(function() {
			  click();
			  role();
			  roleclick();
			  getLogin();
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
			//获取登录信息
		function getLogin(i){
			 $(".table10").html("");
			  $.ajax({
				  type:"post",
				  data:{
					 index:i,
					 end:$(".end").val(),
					 start:$(".start").val(),
					 timeType:$(".day:checked").val()
				  },
				  dataType:"json",
				  url:"/oa/login/getLogin.do",
				  success:function(data){ 
					   $.each(data['list'],function(i,v){
						   var tr ="<tr>"
						   +"<td>"+v['login_id']+"</td>"
						   +"<td>"+v['user_id']+"</td>"
						   +"<td>"+formatDate(v['login_time'])+"</td>"
						   +"<td>"+v['login_userIp']+"</td>"
						   +"<td>"+(v['if_success']==1?'成功':'失败')+"</td>"
						   +"<td>"+v['login_desc']+"</td>"
						   +"</tr>";
						  
						   $(".table10").append(tr);
					   })
			    var prePage= data['index']-1;
				var nextPage= data['index']+1;
				if(prePage<=0){
					prePage = 1;
				}
				if(nextPage>data['totalPage']){
					nextPage = data['totalPage'];
				}
				        var page = "<tr><td colspan=6>"
						+"<a href='javascript:void(0)' onclick='getLogin(1)' >首页</a>"
						+"<a href='javascript:void(0)' onclick='getLogin("+prePage+")'>上一页</a>"
						+"<a href='javascript:void(0)' onclick='getLogin("+nextPage+")'>下一页</a>"
						+"<a href='javascript:void(0)' onclick='getLogin("+data["totalPage"]+")'>末页</a>"
						+"&nbsp;&nbsp;&nbsp;<span>第："+data['index']+"页</span>"
						+"&nbsp;&nbsp;&nbsp;<span>共有："+data['totalPage']+"页</span>"
						+"</td></tr>";
						$(".table10").append(page);

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
			//删除登录信息
			function deletLogin() {
			        alert($(".check10:checked").val())
					$.ajax({
						type:"post",
						data:{
							id:$(".check10:checked").val()
						},
						dataType:"json",
						url:"/oa/login/removeLogin.do",
						success:function(data){
							alert(data)
							
						},
						error:function(){
						
						}
					})
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
					<div class="login">
					<h1>登陆日志</h1></br>
					<hr/>

					<div class="login_one">
						输入时间段: <input type="date" name="user_one" class="start" />--
						<input type="date" name="user_two" class="end" />
						<label for="radio1">本月</label><input type="radio" name="radio" value="1" class="day" />
						<label for="radio2">本周</label><input type="radio" name="radio" value="2" class="day" />
						<label for="radio3">本日</label><input type="radio" name="radio" value="3" class="day" />
						<button type="button" style="width: 150px;height: 30px;" onclick="getLogin(1)">搜索一下~</button>
					</div>
					<div class="login_two">
						<div class="all">
							
						</div>
						
						<table border="1" cellspacing="0"  class="table1">
							<tr>
								<td>序号</td>
								<td>登陆用户</td>
								<td>登陆时间</td>
								<td>IP地址</td>
								<td>是否成功</td>
								<td>登陆备注</td>
							</tr>
							<tbody class="table10"></tbody>
							
						</table>
					</div>
				</div>
		</section>
		<footer>

		</footer>
</body>
</html>