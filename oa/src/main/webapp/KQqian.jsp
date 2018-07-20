<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>华天协同OA平台</title>
		<link rel="stylesheet" type="text/css" href="/oa/css/public.css" />
		<link rel="stylesheet" type="text/css" href="/oa/css/KQdemon1.css" />
		<script type="text/javascript" src="/oa/js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
		  $(function() {
			  click();
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
		  
		  
		  function addSign(tag){
			  $(".qianspan1").html("");
			  $.ajax({
				  type:"post",
				  data:{
					  signTag:tag,
					  signDesc:$(".table10").val()
				  },
				  dataType:"json",
				  url:"/oa/sign/addSign.do",
				  success:function(data){ 
					    
					     $(".table10").val("");
						 $(".input10").attr("value",data['role_name']);
						 $(".input11").attr("value",data['user_name']);
						 $(".input12").attr("value",data['depart_name']);
						 $(".input13").attr("value",data['BranchName']);
						 var sp = "<span>"+data['sign_time']+"</span>";
						 $(".qianspan1").append(sp);
						 $(".text20").val(data['sign_desc']);
				  },
				  error:function(){
					  alert("失败");
				  }
			  })
		  }
		  
		  function addSigntui(tagtui){
			  $(".qianspan2").html("");
			  $.ajax({
				  type:"post",
				  data:{
					  signTag:tagtui,
					  signDesc:$(".table10").val()
				  },
				  dataType:"json",
				  url:"/oa/sign/addSign.do",
				  success:function(data){
					     
					     $(".table10").val("");
						 $(".input20").attr("value",data['role_name']);
						 $(".input21").attr("value",data['user_name']);
						 $(".input22").attr("value",data['depart_name']);
						 $(".input23").attr("value",data['BranchName']);
						 var sp = "<span>"+data['sign_time']+"</span>";
						 $(".qianspan2").append(sp);
						 $(".texttui").val(data['sign_desc']);	 
				  },
				  error:function(){
					  alert("失败");
				  }
			  })
		  }
			
		  
		 
		  function dao(){
			  $(".f_right_body_two").show();
			  $(".f_right_body_three").hide();
		  }
		  function tui(){
			  $(".f_right_body_two").hide();
			  $(".f_right_body_three").show();
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
					<p>员工签到</p>
				</div>

				<p class="f_right_biao">员工签到，签退</p>
				<div class="f_right_body">
					<p>员工填写区</p>
					<form class="f_right_body_from">
						<p>
							<input type="button" value="签到" onclick="addSign(1);dao()" /> <input
								type="button" value="签退" onclick="addSigntui(0);tui()" />
						</p>

						<p>签到备注：</p>
						<textarea class="table10" name="beizhu" rows="7" cols="50"
							style="resize: none;"></textarea>
					</form>
					<div class="f_right_body_weizhi">地图</div>
				</div>

				<div class="f_right_body_two">
					<p>您的签到信息</p>
					<form class="f_right_body_from_two">
						<p>
							<span class="f_right_body_from_two_1">用</span>户：<input
								class="input10" name="sucessid" type="text" /> <span
								class="f_right_body_from_two_2">姓</span>名：<input class="input11"
								name="sucessname" type="text" />
						</p>
						<p>
							<span class="f_right_body_from_two_3">所属部门：</span><input
								class="input12" name="sucessid" type="text" /> <span
								class="f_right_body_from_two_4">所属公司： </span> <input
								class="input13" name="sucessname" type="text" />
						</p>
						<p class="qiandaot">
							<span>您的签到时间：</span> <span class="qianspan1"></span>
						</p>
						<p>
							<span>您的地址：</span>
						</p>

						<p>签到备注：</p>
						<textarea class="text20" name="beizhu" rows="5" cols="30"
							style="resize: none;"></textarea>
					</form>
				</div>


				<div class="f_right_body_three">
					<p>您的签退信息</p>
					<form action="#" method="get" class="f_right_body_from_three">
						<p>
							<span class="f_right_body_from_three_1">用</span>户：<input
								class="input20" name="sucessid" type="text" /> <span
								class="f_right_body_from_three_2">姓</span>名：<input
								class="input21" name="sucessname" type="text" />
						</p>
						<p>
							<span class="f_right_body_from_three_3">所属部门：</span><input
								class="input22" name="sucessid" type="text" /> <span
								class="f_right_body_from_three_4">所属公司：</span> <input
								class="input23" name="sucessname" type="text" />
						</p>
						<p class="qiandaotuit">
							<span>您的签退时间：</span> <span class="qianspan2"></span>
						</p>
						<p>
							<span>您的地址：</span>
						</p>

						<p>签到备注：</p>
						<textarea class="texttui" name="beizhu" rows="5" cols="30"
							style="resize: none;"></textarea>
					</form>
				</div>

			</div>
	</section>
		<footer>

		</footer>

</body>
</html>