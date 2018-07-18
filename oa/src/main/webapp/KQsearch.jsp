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
			  getRole();
			 
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
		 //拿取签到信息
		   function getSign(i){
			 alert($(".day:checked").val());
			   $(".table10").html("");
				  $.ajax({
					  type:"post",
					  data:{
						 index:i,
						 end:$(".end").val(),
						 name:$(".select10>option:selected").val(),
						 depart:$(".select11>option:selected").val(),
						 timeType:$(".day:checked").val()
					  },
					  dataType:"json",
					  url:"/oa/sign/getSign.do",
					  success:function(data){ 
						   $.each(data['list'],function(i,v){
							   var tr ="<tr>"
							   +"<td>"+v['user_name']+"</td>"
							   +"<td>"+v['sign_time']+"</td>"
							   +"<td>"+(v['sign_tag']==1?'签到':'签退')+"</td>"
							   +"<td>"+v['sign_desc']+"</td>"
							   +"<td>"+v['depart_name']+"</td>"
							   +"<td>"+v['branch_name']+"</td>"
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
							+"<a href='javascript:void(0)' onclick='getSign(1)'>首页</a>"
							+"<a href='javascript:void(0)' onclick='getSign("+prePage+")'>上一页</a>"
							+"<a href='javascript:void(0)' onclick='getSign("+nextPage+")'>下一页</a>"
							+"<a href='javascript:void(0)' onclick='getSign("+data["totalPage"]+")'>末页</a>"
							+"&nbsp;&nbsp;&nbsp;<span>共有："+data['totalPage']+"页</span>"
							+"&nbsp;&nbsp;&nbsp;<span><input type= 'text' width='30px'/>"
							+ "&nbsp;&nbsp;<input type='button' value='GO' style='background-color: orange;' /></span>"
							+"</td></tr>";
							$(".table10").append(page);
					        
						   
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
		   //拿取权限信息
		  function getRole(){
	       $.ajax({
		     type:"post",
		        data:{
		  },
		  dataType:"json",
		  url:"/oa/user/getRole.do",
		  success:function(data){
			   if (data==1) {
				   $(".span10").hide();
				   $(".select10").hide();
				   $(".span11").hide();
				   $(".select11").hide();
			   }
			   if (data==2) {
				   $(".span10").show();
				   $(".select10").show();
				   $(".span11").hide();
				   $(".select11").hide();
			   }
			   if (data==3) {
				   $(".span10").show();
				   $(".select10").show();
				   $(".span11").show();
				   $(".select11").show();
			   }
		  },
		  error:function(){
			  alert("失败");
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
								<p>员工考勤统计</p>
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
						<p>员工考勤统计</p>
					</div>
					<p class="f_right_biao">员工考勤统计</p>
					<div class="f_right_body">
						<form>
							<p>
								<span>输入时间段:</span>
								<span>开始时间</span>
								<input name="startdate" type="date" class="start"/>
								<span>-------结束时间</span>
								<input name="endsate" type="date"  class="end"/>
								<span>本日</span><input type="radio" name="time" class="day" value="1"/>
								<span>本周</span><input type="radio" name="time" class="day" value="2"/>
								<span>本月</span><input type="radio" name="time" class="day" value="3"/>
							</p>

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
							</p>

							</p>
						</form>
						<div class="f_right_body_table">
							<table cellspacing="0" border="1" frame="void" width="100%">
								<tr>
									<th>签到员工</th>
									<th>签卡时间</th>
									<th>签卡标记</th>
									<th>签卡备注</th>
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
</body>
</html>