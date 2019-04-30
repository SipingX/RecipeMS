<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,pojo.User"
%>
<%
	User user=new User();
	if(session.getAttribute("user")!=null){
		user=(User)session.getAttribute("user");
	}else{
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
	<!--<![endif]-->
	<head>

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

		<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

		<script type="text/javascript">
			var step = 3;

			function addText() {
				var table = document.getElementById("step");
				table.innerHTML += "<tr class='ingredients-cont'>" +
										"<td class='label'><label for='8'>第" + step + "步</label></td>" +
										"<td><input id='8' name='step' type='text' /></td>" +
										"<td class='action'><span onclick='deleteText(this)'><i class='fa fa-remove'></i></span></td>" +
									"</tr>";
				step++;
			}

			function deleteText(This) {
				//获取删除按钮的父元素 的 父元素 利用 爷爷元素 删除
				This.parentNode.parentNode.parentNode.removeChild(This.parentNode.parentNode);
				step--;
			}
			
			function addIngredient() {
				var table = document.getElementById("ingredients-sort");
				table.innerHTML += "<tr class='ingredients-cont ing'>" +
										"<td class='icon'><i class='fa fa-arrows'></i></td>" +
										"<td>" +
//											 "<div class='select'>" + 
												"<select name='ingredient_name'>" +
													"<option value='1'>牛腩</option>" +
													"<option value='2'>植物油</option>" +
													"<option value='3'>洋葱</option>" +
													"<option value='4'>香粉</option>" +
													"<option value='5'>黑胡椒</option>" +
													"<option value='6'>土豆</option>" +
													"<option value='7'>胡萝卜</option>" +
													"<option value='8'>芹菜</option>" +
													"<option value='9'>娃娃菜</option>" +
													"<option value='10'>西兰花</option>" +
												"</select>" +
//											"</div>" +
										"</td>" +
										"<td><input name='ingredient_note' tabindex='6' type='text' placeholder='备注(用量，其它信息)' /></td>" +
										"<td class='action'><span onclick='deleteIngredient(this)'><i class='fa fa-remove'></i></span></td>" +
									"</tr>";	
			}
			
			function deleteIngredient(This) {
				//获取删除按钮的父元素 的 父元素 利用 爷爷元素 删除
				This.parentNode.parentNode.parentNode.removeChild(This.parentNode.parentNode);
			}
			
/* 			"<div class='select'>" +
			"<select tabindex='5' type='text' data-placeholder='食材' class='chosen-select-no-single' name='ingredient_name'>" +
				"<option value='1'>牛腩</option>" +
				"<option value='2'>植物油</option>" +
				"<option value='3'>洋葱</option>" +
				"<option value='4'>香粉</option>" +
				"<option value='5'>黑胡椒</option>" +
				"<option value='6'>土豆</option>" +
				"<option value='7'>胡萝卜</option>" +
				"<option value='8'>芹菜</option>" +
				"<option value='9'>娃娃菜</option>" +
				"<option value='10'>西兰花</option>" +
			"</select>" +
		"</div>" + */
			
		</script>

	</head>

	<body class="overflow-reset">

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
							<h1><a href="index.html"><img src="images/logo.png" alt="Chow" /></a></h1>
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
									<a href="recipe_submit.jsp" id="current">上传食谱</a>
									<ul>
										<li><a href="contact.jsp">联系我们</a></li>
									</ul>
								</li>
								
								<li>
									<%
										if(session.getAttribute("user") == null){
									%>	
											<a href="login.jsp">登录/注册</a>
									<% 
										}else{
									%>
											<a href="user.jsp"><%= user.getName() %></a>
											<ul>
												<li><a href="LogoutAct">退出登录</a></li>
											</ul>
									<%	
										}
									%>
								</li>
							</ul>
						</nav>

					</div>

				</div>
				<!-- Container / End -->
			</header>


			<!-- Titlebar
================================================== -->
			<section id="titlebar">
				<!-- Container -->
				<div class="container">

					<div class="eight columns">
						<h2>上传食谱</h2>
					</div>

					<div class="eight columns">
						<nav id="breadcrumbs">
							<ul>
								<li>你在这里:</li>
								<li><a href="index.html">主页</a></li>
								<li>上传食谱</li>
							</ul>
						</nav>
					</div>

				</div>
				<!-- Container / End -->
			</section>


			<!-- Content
================================================== -->
			<div class="container">
				<div class="sixteen columns">
					<div class="submit-recipe-form">
						<form action="uploadRecipe" method="post" enctype="multipart/form-data">

							<!-- Recipe Title -->
							<h4>食谱名称</h4>
							<nav class="title">
								<input name="recipe_name" class="search-field" type="text" placeholder=""/>
							</nav>
							<div class="clearfix"></div>


							<div class="margin-top-25"></div>


							<!-- Choose Category -->
							<div class="select">
								<h4>选择类别</h4>
								<select data-placeholder="选择类别" class="chosen-select-no-single" name="category">
									<option>全部</option>
									<option>早餐</option>
									<option>午餐</option>
									<option>晚餐</option>
									<option>饮料</option>
									<option>小菜</option>
									<option>汤类</option>
									<option>代餐沙拉</option>
									<option>牛肉类</option>
									<option>禽类</option>
									<option>豆制品</option>
									<option>海鲜类</option>
									<option>全素食</option>
									<option>蔬菜</option>
									<option>甜品</option>
									<option>速食食品</option>
									<option>面包、蛋糕</option>
									<option>节日代表</option>
								</select>
							</div>


							<div class="margin-top-25"></div>


							<!-- Short Summary -->
							<h4>食谱介绍</h4>
							<textarea class="WYSIWYG" name="summary" cols="40" rows="3" id="summary" spellcheck="true"></textarea>


							<div class="margin-top-25"></div>


							<!-- Upload Photos -->
							<h4>上传图片</h4>
							<input type="file" name="picture" multiple size="50" />

							<div class="clearfxix"></div>
							<div class="margin-top-15"></div>


							<!-- Ingredients -->
							<fieldset class="addrecipe-cont" name="ingredients">
								<h4>配料:</h4>

								<table id="ingredients-sort">

<!-- 									<tr class="ingredients-cont ing">
										<td class="icon"><i class="fa fa-arrows"></i></td>
										<td>
											<div class="select">
												<select tabindex="5" data-placeholder="食材" class="chosen-select-no-single" name="ingredient_name">
													<option>禽类</option>
													<option>豆制品</option>
													<option>海鲜类</option>
												</select>
											</div>
										</td>
										<td><input name="ingredient_note" tabindex="6" type="text" placeholder="备注(用量，其它信息)" /></td>
									</tr> -->

								</table>
								
								<input type="button" value="添加食材" onclick="addIngredient()" />
									
							</fieldset>


							<div class="margin-top-25"></div>


							<!-- Directions -->
							<h4>食谱地址：</h4>
							<textarea class="WYSIWYG" name="directions" cols="30" rows="1" id="directions" spellcheck="true"></textarea>


							<div class="margin-top-25 clearfix"></div>


							<!-- Additional Informations -->
							<h4>更多信息：</h4>

							<fieldset class="additional-info">
								<table>

									<tr class="ingredients-cont">
										<td class="label"><label for="1">烹饪方式</label></td>
										<td><input id="1" name="method" type="text" /></td>
									</tr>

									<tr class="ingredients-cont">
										<td class="label"><label for="4">口味</label></td>
										<td><input id="4" name="tasty" type="text" /></td>
									</tr>

									<tr class="ingredients-cont">
										<td class="label"><label for="2">烹饪时间（分钟）</label></td>
										<td><input id="2" name="minute" type="text" /></td>
									</tr>

									<tr class="ingredients-cont">
										<td class="label"><label for="4">烹饪难度</label></td>
										<td>
											<select data-placeholder="Choose Level" class="chosen-select-no-single" name="complexity">
												<option value="简单">简单</option>
												<option value="一般">一般</option>
												<option value="困难">困难</option>
												<option value="大师级">大师级</option>
											</select>
										</td>

								</table>
							</fieldset>


							<div class="margin-top-25"></div>


							<!-- Nutrition Facts -->
							<h4>步骤</h4>

							<fieldset class="additional-info">
								<table id="step">

									<tr class="ingredients-cont">
										<td class="label"><label for="5">第1步</label></td>
										<td><input id="5" name="step" type="text" /></td>
									</tr>

									<tr class="ingredients-cont">
										<td class="label"><label for="7">第2步</label></td>
										<td><input id="7" name="step" type="text" /></td>
									</tr>

								</table>
								<input type="button" value="增加" onclick="addText()" />
							</fieldset>

							<div class="margin-top-30"></div>
							<input type="submit" onclick="" value="发表" />

						</form>
					</div>
				</div>
			</div>
			<!-- Container / End -->


			<div class="margin-top-50"></div>

		</div>
		<!-- Wrapper / End -->


		<!-- Footer
================================================== -->
		<div id="footer">

			<!-- Container -->
			<div class="container">

				<div class="five columns">
					<!-- Headline -->
					<h3 class="headline footer">关于网站</h3>
					<span class="line"></span>
					<div class="clearfix"></div>
					<p>网站以食谱为主题，给广大用户提供一个美食交流分享的平台，给予美食爱好者以便利，也可以很好的指导想要入门尝试以及初有兴趣的用户。</p>
				</div>

				<div class="three columns">

					<!-- Headline -->
					<h3 class="headline footer">食谱</h3>
					<span class="line"></span>
					<div class="clearfix"></div>

					<ul class="footer-links">
						<li>
							<a href="recipes.html">浏览食谱</a>
						</li>
						<li>
							<a href="submit-recipe.html">上传食谱</a>
						</li>
					</ul>

				</div>

				<div class="five columns">

					<!-- Headline -->
					<h3 class="headline footer">资讯</h3>
					<span class="line"></span>
					<div class="clearfix"></div>
					<p>注册接收电子邮件更新的新产品公告、礼品创意、销售等。</p>

					<form action="#" method="get">
						<input class="newsletter" type="text" placeholder="mail@example.com" value="" />
						<button class="newsletter-btn" type="submit">订阅</button>

					</form>
				</div>

			</div>
			<!-- Container / End -->

		</div>
		<!-- Footer / End -->

		<!-- Footer Bottom / Start -->
		<div id="footer-bottom">

			<!-- Container -->
			<div class="container">

				<div class="eight columns">© Copyright 2018 by
					<a href="#">Recipe</a>. All Rights Reserved.</div>

			</div>
			<!-- Container / End -->

		</div>
		<!-- Footer Bottom / End -->

		<!-- Back To Top Button -->
		<div id="backtotop">
			<a href="#">
			</a>
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
