<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>华天协同OA平台</title>
		<link rel="stylesheet" type="text/css" href="/oa/css/public.css" />
		<link rel="stylesheet" type="text/css" href="/oa/css/sys.css"/>
		<script type="text/javascript" src="/oa/js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function() {
				click();
				getrole();
			})
			function click(){
				$('.h_click_li_return').click(function() {
					$('.h_over').toggle();
				})
				$('.s_left_1_hui').click(function() {
					var index = $('.s_left_1_hui').index($(this));
					$('.s_left_1_hui_ul').eq(index).toggle();
				})
				$('.h_head>ul>li').mouseover(function() {
					$(this).css('background-color', '#3A5FCD')
				}).mouseout(function() {
					$(this).css('background-color', '#039adf')
				})
				
				$(".system_permission_not>p:nth-of-type(1)>input").click(function(){
					$(".system_permission").hide();
				})

			}
			
			function clickdiv(){
				$(".system_permission").show();
			}
			
			function getrole(){
				$(".system_bg_table>tbody").html("");
				$.ajax({
					type:"post",
					data:{},
					dataType:"json",
					url:"/oa/role/getrole.do",
					success:function(data){
						$.each(data,function(i,v){
						   var tr ="<tr>"
							+ "<td>"+v['role_name']+"</td>"
							+ "<td>"+v['role_desc']+"</td>"
							+ "<td><a href='javascript:void(0)' onclick='getrole1("+v['role_id']+")'>修改</a></td>"
							+ "<td><a href='javascript:void(0)' onclick='removerole("+v['role_id']+")'>删除</a></td>"
							+ "<td><a href='javascript:void(0)' onclick='getAlreadySys("+v['role_id']+");getNotSys("+v['role_id']+");clickdiv()'>分配权限</a></td>"
						    + "</tr>";
						 $(".system_bg_table>tbody").append(tr);
						})
						
					},
					error:function(){
						 $(".system_bg_table").append("<tr><td>导入失败</td></tr>");
					}
				})
			}
			function getrole1(id){
				$(".system_bd_p").html("");
				 $(".system_bg_p").html("");
				$.ajax({
					type:"post",
					data:{
						roleid:id
					},
					dataType:"json",
					url:"/oa/role/getrole.do",
					success:function(data){
						 $(".system_bd_input").html("");
						 $(".system_bd_text").html("");
						$.each(data,function(i,v){
							var name=v['role_name'];
							var desc=v['role_desc'];
							
						  $(".system_bd_input").attr("value",name);
						  $(".system_bd_text").append(desc);
						  $(".button2").css("background-color","red");
						})
						
					},
					error:function(){
					
					}
				})
			}
			
			function updaterole(){
				 $(".system_bd_p").html("");
				 $(".system_bg_p").html("");
				$.ajax({
					type:"post",
					data:{
						name:$(".system_bd_input").val(),
						desc:$(".system_bd_text").val()
					},
					dataType:"json",
					url:"/oa/role/updaterole.do",
					success:function(data){
						 $(".system_bd_p").append(data);
						 if (data=="修改信息成功") {
							 $(".system_bd_input").attr("value","");
							 $(".system_bd_text").html("");
							 $(".button2").css("background-color","#1B6D85");
							 getrole();
						 }
					},
					error:function(){
					
					}
				})
			}
			
			function addrole(){
			    $(".system_bd_p").html("");
			    $(".system_bg_p").html("");
				$.ajax({
					type:"post",
					data:{
						name:$(".system_bd_input").val(),
						desc:$(".system_bd_text").val()
					},
					dataType:"json",
					url:"/oa/role/addrole.do",
					success:function(data){
						 $(".system_bd_p").append(data);
						 if (data=="修改信息成功") {
							 $(".system_bd_input").attr("value","");
							 $(".system_bd_text").html("");
							 getrole();
						 }
					},
					error:function(){
					
					}
				})
			}
			function removerole(id){
			    $(".system_bd_p").html("");
			    $(".system_bg_p").html("");
			    if (confirm("确认删除")) {
			    	$.ajax({
						type:"post",
						data:{
							roleid:id
						},
						dataType:"json",
						url:"/oa/role/removerole.do",
						success:function(data){
							getrole(); 
							$(".system_bg_p").html(data);
						},
						error:function(){
							
						}
					})
				}
			}
			
			
			function getAlreadySys(id){
			    $(".system_bd_p").html("");
			    $(".system_bg_p").html("");
			    $(".system_permission_have div").html("");
			    $.ajax({
					type:"post",
					data:{
						roleid:id
					},
					dataType:"json",
					url:"/oa/role/getAlreadySys.do",
					success:function(data){
						$.each(data,function(i,v){
							var sys = "<p>"
							+v['display_name']
							+"<a onclick='removeSys("+v['node_id']+","+v['role_id']+")'>删除</a> "
							+"</p>";	
							$(".system_permission_have div").append(sys);
						})
					},
					error:function(){
						
					}
				})
			}
			
			function getNotSys(id){
			    $(".system_bd_p").html("");
			    $(".system_bg_p").html("");
			    $(".system_permission_not div").html("");
			    $.ajax({
					type:"post",
					data:{
						roleid:id
					},
					dataType:"json",
					url:"/oa/role/getNotSys.do",
					success:function(data){
						$.each(data,function(i,v){
							var sys ="<p>"
							+v['display_name']
							+"<a onclick='addSys("+v['node_id']+","+v['id']+")'>添加</a> "
							+"</p>";	
							$(".system_permission_not div").append(sys);
						})
					},
					error:function(){
						
					}
				})
			}
			
			function addSys(nodeid,roleid){
				
			    $(".system_bd_p").html("");
			    $(".system_bg_p").html("");
			    $(".system_permission_not div").html("");
			    $(".system_permission_have div").html("");
			    $.ajax({
					type:"post",
					data:{
						nodeid:nodeid,
						roleid:roleid
					},
					dataType:"json",
					url:"/oa/role/addSys.do",
					success:function(data){
						getNotSys(roleid);
						getAlreadySys(roleid);
					},
					error:function(){
						
					}
				})
			}
			
			function removeSys(nodeid,roleid){
				
			    $(".system_bd_p").html("");
			    $(".system_bg_p").html("");
			    $(".system_permission_not div").html("");
			    $(".system_permission_have div").html("");
			    $.ajax({
					type:"post",
					data:{
						nodeid:nodeid,
						roleid:roleid
					},
					dataType:"json",
					url:"/oa/role/removeSys.do",
					success:function(data){
						getNotSys(roleid);
						getAlreadySys(roleid);
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
					欢迎：
					<a href="#">姜伟</a>
				</div>

				<p class="f_head_tubiao">
					<a href="#"></a>
					<a href="first.html"></a>
					<a href="#"></a>
					<a href="#"></a>
					<a href="#"></a>
					<a href="#"></a>
				</p>
			</div>

		</header>
		<section>
			<div class="section">
				<div class="s_left">
					<div class="s_left_1">
						<ul>
							<li>
								<a href="#">快捷方式</a>
							</li>
							<li>
								<a href="#">消息提醒</a>
							</li>
							<li>
								<a href="#">我的信息</a>
							</li>
							<li>
								<a href="#">我的流程</a>
							</li>
							<li class="s_left_1_all">
								<a href="#" class="s_left_1_hui">我的行政</a>
								<ul class="s_left_1_hui_ul">
									<li>
										<a href="#">会议日历</a>
									</li>
									<li>
										<a href="#">会议发起</a>
									</li>
									<li>
										<a href="#">我的用车</a>
									</li>
									<li>
										<a href="#">用车日历</a>
									</li>
									<li>
										<a href="#">用品领取</a>
									</li>
									<li>
										<a href="#">我的考勤</a>
									</li>
									<li>
										<a href="#">考勤申请记录</a>
									</li>
									<li>
										<a href="#">我的图书</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="#">文件柜</a>
							</li>
							<li>
								<a href="#">通讯录</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="section_1"></div>
				<div class="f_right">
					<div class="system">
						<h1>角色管理</h1><br />
						<hr />
						<div class="system_bd">
							<ul>
								<li><span>角色名称</span></li>
								<li><input type="text" name="userName" style="width: 300px;height: 25px;" class="system_bd_input" /></li>
								<li><span>角色说明</span></li>
								<li><textarea name="userdesc" style="resize: none; width: 300px; height: 100px;" class="system_bd_text"></textarea></li>
							</ul>
							<p class="system_bd_p"></p>
							<button class="button1" onclick="addrole()"  >添加</button>
							<button class="button2" onclick="updaterole()">保存修改</button>
						</div>
						<div class="system_bg">
							<table border="1" cellspacing="0" class="system_bg_table">
								<thead>
								<tr>
									<th>角色名称</th>
									<th>角色说明</th>
									<th>修改</th>
									<th>删除</th>
									<th>分配角色权限</td>
								</tr>
								</thead>
								<tbody></tbody>
							</table>
							<p class="system_bg_p"></p>
						</div>
						<div class="system_permission">
							<div class="system_permission_have">
								<p>
									已有权限
								</p>
								<hr color="black"/>
								<div></div>
							</div>
							<div class="system_permission_not">
								  <p>
								  	 未添加权限
								  	 <input type="button" value="关闭" />
								  </p>  
								   <hr  color="black"/>
								   <div></div>
							</div>
						</div>
					</div>
				</div>
		</section>
		<footer>

		</footer>

</body>
</html>