<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,pojo.User"%>
<%
	User user=new User();
	if(session.getAttribute("user")!=null){
		user=(User)session.getAttribute("user");
	}
%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->

<head>
	<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
	<script type="text/javascript">
		function loginCheck()
        {
			var a=new Array(4);
			a[2]="账号";
			a[3]="密码";
			for(var i=2;i<document.loginform.elements.length-1;i++)
			{
				 if(document.loginform.elements[i].value=="")
				 {
				   alert(a[i]+"不能为空！");
				   document.loginform.elements[i].focus();
				   return false;
				 }
			}
			return true;
        }
		
		function send(){
			$.ajax({  
				url: "sendMsg",  
				type: "post",  
				dataType: "json",  
				data: {'value': $("input[name='userId_2']").val()},
			});  
		}
    </script>

	<!-- Basic Page Needs
================================================== -->
	<meta charset="utf-8">
	<title>寻味环游记</title>

	<!-- Mobile Specific Metas
================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
================================================== -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/colors/green.css" id="colors">
	<link href="css/login.css" rel="stylesheet" type="text/css" />

	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

</head>

<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header
================================================== -->
		<header id="header">
		
			<!-- Container -->
			<div class="container">

				<!-- Logo / Mobile Menu -->
				<div class="three columns">
					<div id="logo">
						<h1>
							<a href="index.html">
								<img src="images/logo.png" alt="寻味环游记" />
							</a>
						</h1>
					</div>
				</div>


				<!-- Navigation
================================================== -->
				<div class="thirteen columns navigation">

					<nav id="navigation" class="menu nav-collapse">
						<ul>
							<li>
								<a href="index.jsp">主页</a>
							</li>

							<li>
								<a href="recipe.jsp">食谱</a>
							</li>

							<li>
								<a href="material.jsp">食材</a>
							</li>

							<li>
								<a href="#">话题</a>
							</li>

							<li>
								<a href="shop.jsp">购物</a>
							</li>

							<li>
								<a href="recipe_submit.jsp">上传食谱</a>
								<ul>
									<li><a href="contact.jsp">联系我们</a></li>
								</ul>
							</li>
							
							<li>
								<a href="login.jsp" id="current">登录/注册</a>
							</li>
						</ul>
					</nav>

				</div>

			</div>
			<!-- Container / End -->
		</header>
	
		<div class="container">
		
					<!-- Masonry -->
					<div class="twelve columns">
						<div class="clearfix"></div>
		
						<!-- Isotope -->
						<div class="isotope">
		
		<div class="login" style="margin-top:50px;">
		    
		    <div class="header">    
		        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
					<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
		        </div>
		    </div>    
		  
		    
		    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">    
		
		            <!--登录-->
		            <div class="web_login" id="web_login">
		               
		               
		               <div class="login-box">
		    
		            
					<div class="login_form">
						<form action="LoginAct" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm" method="post"  onSubmit="return loginCheck();">
							<input type="hidden" name="did" value="0"/>
		               		<input type="hidden" name="to" value="log"/>
		                <div class="uinArea" id="uinArea">
			                <label class="input-tips" for="u">账号：</label>
			                <div class="inputOuter" id="uArea">
			                    <input type="text" id="u" name="userId" class="inputstyle"  placeholder="手机号码"/>
			                </div>
		                </div>
		                <div class="pwdArea" id="pwdArea">
			                <label class="input-tips" for="p">密码：</label> 
			                <div class="inputOuter" id="pArea">
			                    <input type="password" id="p" name="userPsd" class="inputstyle"/>
			                </div>
		                </div>
		                <div style="padding-left:50px;margin-top:20px;">
		                	<input type="submit" value="登 录" style="width:150px;" class="button_blue"/>
		                </div>
		              </form>
		           </div>
		           
		            	</div>
		               
		            </div>
		            <!--登录end-->
		  </div>
		
		  <!--注册-->
		    <div class="qlogin" id="qlogin" style="display: none; ">
		   
		    <div class="web_login"><form  action="RegisterAct" name="form2" id="regUser" accept-charset="utf-8" method="post">
			      <input type="hidden" name="to" value="reg"/>
				      		       <input type="hidden" name="did" value="0"/>
		        <ul class="reg_form" id="reg-ul">
		        		<div id="userCue" class="cue">快速注册请注意格式</div>
		                <li>
		                    <label for="user"  class="input-tips2">手机号：</label>
		                    <div class="inputOuter2">
		                        <input type="text" id="user" name="userId_2" maxlength="16" class="inputstyle2"/>
		                    </div>
		                </li>
										
										<li>
												<div class="inputArea">
														<input type="button" onclick="send()" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="发送验证码"/> 
												</div>
												
										</li><div class="cl"></div>
										
										<li>
												<label for="user"  class="input-tips2">验证码：</label>
												<div class="inputOuter2">
														<input type="text" id="user" name="vali" maxlength="16" class="inputstyle2"/>
												</div>
										</li>
		                
		                <li>
		                <label for="passwd" class="input-tips2">密码：</label>
		                    <div class="inputOuter2">
		                        <input type="password" id="passwd"  name="userPsd" maxlength="16" class="inputstyle2"/>
		                    </div>
		                    
		                </li>
		                <li>
		                <label for="passwd2" class="input-tips2">确认密码：</label>
		                    <div class="inputOuter2">
		                        <input type="password" id="passwd2" name="userPsd_2" maxlength="16" class="inputstyle2" />
		                    </div>
		                    
		                </li>
		                
		                
		                <li>
		                    <div class="inputArea">
		                        <input type="submit" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="同意协议并注册"/> <a href="#" class="zcxy" target="_blank">注册协议</a>
		                    </div>
		                    
		                </li>
		                <div class="cl"></div>
		            </ul>
	            </form>
		    </div>
		   
		    
		    </div>
		    <!--注册end-->
		</div>
						</div>
					</div>
		</div>
		
	</div>

	<!-- Java Script
================================================== -->
	<script src="scripts/jquery-1.11.0.min.js"></script>
	<script src="scripts/jquery-migrate-1.2.1.min.js"></script>
	<script src="scripts/jquery.superfish.js"></script>
	<script src="scripts/jquery.royalslider.min.js"></script>
	<script src="scripts/responsive-nav.js"></script>
	<script src="scripts/hoverIntent.js"></script>
	<script src="scripts/isotope.pkgd.min.js"></script>
	<script src="scripts/chosen.jquery.min.js"></script>
	<script src="scripts/jquery.tooltips.min.js"></script>
	<script src="scripts/jquery.magnific-popup.min.js"></script>
	<script src="scripts/jquery.pricefilter.js"></script>
	<script src="scripts/custom.js"></script>
	
	<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="js/login.js"></script>


	<!-- Style Switcher
================================================== -->
	<script src="scripts/switcher.js"></script>

	<div id="style-switcher">
			<h2>切换风格
				<a href="#"></a>
			</h2>
	
			<div>
				<h3>预定义颜色</h3>
				<ul class="colors" id="color1">
					<li>
						<a href="#" class="green" title="Green"></a>
					</li>
					<li>
						<a href="#" class="blue" title="Blue"></a>
					</li>
					<li>
						<a href="#" class="orange" title="Orange"></a>
					</li>
					<li>
						<a href="#" class="navy" title="Navy"></a>
					</li>
					<li>
						<a href="#" class="yellow" title="Yellow"></a>
					</li>
					<li>
						<a href="#" class="peach" title="Peach"></a>
					</li>
					<li>
						<a href="#" class="beige" title="Beige"></a>
					</li>
					<li>
						<a href="#" class="purple" title="Purple"></a>
					</li>
					<li>
						<a href="#" class="celadon" title="Celadon"></a>
					</li>
					<li>
						<a href="#" class="pink" title="Pink"></a>
					</li>
					<li>
						<a href="#" class="red" title="Red"></a>
					</li>
					<li>
						<a href="#" class="brown" title="Brown"></a>
					</li>
					<li>
						<a href="#" class="cherry" title="Cherry"></a>
					</li>
					<li>
						<a href="#" class="cyan" title="Cyan"></a>
					</li>
					<li>
						<a href="#" class="gray" title="Gray"></a>
					</li>
					<li>
						<a href="#" class="darkcol" title="Dark"></a>
					</li>
				</ul>
	
			</div>
	
			<div id="reset">
				<a href="#" class="button color">重置</a>
			</div>
	
		</div>
</body>

</html>