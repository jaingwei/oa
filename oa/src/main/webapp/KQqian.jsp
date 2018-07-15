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
		  function addSign(tag){
			  
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
						 $(".qiandaot").append(sp);
						 $(".text20").val(data['sign_desc']);
				  },
				  error:function(){
					  alert("失败");
				  }
			  })
		  }
		  
		  function addSigntui(tagtui){
			  
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
						 $(".qiandaotuit").append(sp);
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
								<p>考勤管理</p>
							</li>
							<li>
								<a href="#">员工签到</a>
							</li>
							<li>
								<a href="#">考勤历史查询</a>
							</li>
							<li>
								<a href="#">考勤统计</a>
							</li>
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
						<form  class="f_right_body_from">
							<p>
								<input type="button"  value="签到" onclick="addSign(1);dao()"/>
								<input type="button" value="签退" onclick="addSigntui(0);tui()"/>
							</p>

							<p>
								签到备注：
							</p>
							<textarea class="table10" name="beizhu" rows="7" cols="50" style="resize: none;"></textarea>
						</form>
						<div class="f_right_body_weizhi">
							地图

						</div>
					</div>

					<div class="f_right_body_two">
						<p>您的签到信息</p>
						<form  class="f_right_body_from_two">
							<p>
								<span class="f_right_body_from_two_1">用</span>户：<input class="input10" name="sucessid" type="text"/>
								<span class="f_right_body_from_two_2">姓</span>名：<input class="input11" name="sucessname" type="text"  />
							</p>
							<p>
								<span class="f_right_body_from_two_3">所属部门：</span><input class="input12" name="sucessid" type="text" />
								<span class="f_right_body_from_two_4">所属公司： </span> <input class="input13" name="sucessname" type="text" />
							</p>
							<p class="qiandaot">
								<span >您的签到时间：</span>
							</p>
							<p>
								<span>您的地址：</span>
							</p>

							<p>
								签到备注：
							</p>
							<textarea class="text20" name="beizhu" rows="5" cols="30" style="resize: none;"></textarea>
						</form>
					</div>
					
					
					<div class="f_right_body_three">
						<p>您的签退信息</p>
						<form action="#" method="get" class="f_right_body_from_three">
							<p>
								<span class="f_right_body_from_three_1">用</span>户：<input class="input20" name="sucessid" type="text" />
								<span class="f_right_body_from_three_2">姓</span>名：<input  class="input21" name="sucessname" type="text" />
							</p>
							<p>
								<span class="f_right_body_from_three_3">所属部门：</span><input  class="input22" name="sucessid" type="text" />
								<span class="f_right_body_from_three_4">所属公司：</span> <input  class="input23" name="sucessname" type="text"/>
							</p>
							<p class="qiandaotuit">
								<span>您的签退时间：</span>
							</p>
							<p>
								<span>您的地址：</span>
							</p>

							<p>
								签到备注：
							</p>
							<textarea class="texttui" name="beizhu" rows="5" cols="30" style="resize: none;"></textarea>
						</form>
					</div>

				</div>
		</section>
		<footer>

		</footer>

</body>
</html>