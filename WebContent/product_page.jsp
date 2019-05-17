<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,pojo.User"
%>
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
								<a href="shop.jsp" id="current">购物</a>
							</li>

							<li>
								<a href="recipe_submit.jsp">上传食谱</a>
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
			<h2>购物</h2>
		</div>

		<div class="eight columns">
			<nav id="breadcrumbs">
				<ul>
					<li>你在这儿:</li>
					<li><a href="#">主页</a></li>
					<li><a href="#">购物</a></li>
					<li>小豆蔻夹</li>
				</ul>
			</nav>
		</div>

	</div>
	<!-- Container / End -->
</section>



<!-- Content
================================================== -->


<div class="container">

<!-- Slider
================================================== -->
	<div class="eight columns" >
		<!-- Slider -->
		<div class="productSlider rsDefault">
		    <img class="rsImg" src="images/product_01.jpg" alt="" />
		</div>
		<div class="clearfix"></div>
	</div>


<!-- Content
================================================== -->
	<div class="eight columns">
		<div class="product-page">
			
			<!-- Headline -->
			<section class="title">
				<h2>小豆蔻夹</h2>
				<span class="product-price">$2.99</span>
			</section>

			<!-- Text Parapgraph -->
			<section>
				<p class="margin-reset">一种姜科、小豆蔻属多年生的草本植物。小豆蔻是一种烹调香料、种子可以做中药。</p>
								
			</section>


			<section class="linking">

					<form action='#'>
						<div class="qtyminus"></div>
						<input type='text' name="quantity" value='1' class="qty" />
						<div class="qtyplus"></div>
					</form>

					<a href="#" class="button adc color">添加至购物车</a>
					<div class="clearfix"></div>

			</section>

		</div>
	</div>

</div>


<div class="clearfix"></div>
<div class="margin-top-30"></div>


<div class="container">
	<div class="sixteen columns">
			<!-- Tabs Navigation -->
			<ul class="tabs-nav">
				<li class="active"><a href="#tab1">商品描述</a></li>
				<li><a href="#tab2">附加信息</a></li>
				<li><a href="#tab3">评论 <span class="tab-reviews">(0)</span></a></li>
			</ul>

			<!-- Tabs Content -->
			<div class="tabs-container">

				<div class="tab-content" id="tab1">
					<p>是一种姜科、小豆蔻属多年生的草本植物。小豆蔻是一种烹调香料、种子可以做中药。</p>
				</div>

				<div class="tab-content" id="tab2">

					<table class="basic-table">
						<tr>
							<th>重量</th>
							<td>0.5 lbs</td>
						</tr>
					</table>

				</div>

				<div class="tab-content" id="tab3">

					<!-- Reviews -->
					<section class="comments reviews">
						<p class="margin-bottom-10">目前没有评论。</p>

						<a href="#small-dialog" class="popup-with-zoom-anim button color margin-left-0">发表评论</a>

						<div id="small-dialog" class="zoom-anim-dialog mfp-hide">
							<h3 class="headline">发表评论</h3><span class="line margin-bottom-25"></span><div class="clearfix"></div>

							<!-- Form -->
							<form id="add-comment" class="add-comment">
								<fieldset>

									<div>
										<label>名字:</label>
										<input type="text" value=""/>
									</div>

									<div>
										<label>评分:</label>
										<span class="rate">
											<span class="star"></span>
											<span class="star"></span>
											<span class="star"></span>
											<span class="star"></span>
											<span class="star"></span>
										</span>
										<div class="clearfix"></div>
									</div>

									<div class="margin-top-20">
										<label>Email: <span>*</span></label>
										<input type="text" value=""/>
									</div>

									<div>
										<label>评价: <span>*</span></label>
										<textarea cols="40" rows="3"></textarea>
									</div>

								</fieldset>

								<a href="#" class="button color">发表评论</a>
								<div class="clearfix"></div>

							</form>
						</div>

					</section>

				</div>

			</div>
	</div>
</div>



<!-- Related Products -->
<div class="container margin-top-5">

	<!-- Headline -->
	<div class="sixteen columns">
		<h3 class="headline">相关产品</h3>
		<span class="line margin-bottom-0"></span>
	</div>

	<!-- Products -->
	<div class="products">

		<!-- Product #3 -->
		<div class="four columns">
			<figure class="product">

				<div class="mediaholder">
					<a href="product-page.html">
						<img alt="" src="images/shop_item_03.jpg"/>
					</a>
					<a href="#" class="product-button"><i class="fa fa-shopping-cart"></i></a>
				</div>

				<a href="product-page.html">
					<section>
						<span class="product-category">香料</span>
						<h5>辣椒粉</h5>
						<span class="product-price">$2.99</span>
					</section>
				</a>
			</figure>
		</div>

		<!-- Product #4 -->
		<div class="four columns">
			<figure class="product">

				<div class="mediaholder">
					<a href="product-page.html">
						<img alt="" src="images/shop_item_04.jpg"/>
					</a>
					<a href="#" class="product-button"><i class="fa fa-shopping-cart"></i></a>
				</div>

				<a href="product-page.html">
					<section>
						<span class="product-category">香料</span>
						<h5>黑胡椒粉</h5>
						<span class="product-price">$2.99</span>
					</section>
				</a>
			</figure>
		</div>

		<!-- Product #5 -->
		<div class="four columns">
			<figure class="product">

				<div class="mediaholder">
					<a href="product-page.html">
						<img alt="" src="images/shop_item_05.jpg"/>
					</a>
					<a href="#" class="product-button"><i class="fa fa-shopping-cart"></i></a>
				</div>

				<a href="product-page.html">
					<section>
						<span class="product-category">香料</span>
						<h5>孜然</h5>
						<span class="product-price">$2.99</span>
					</section>
				</a>
			</figure>
		</div>

		<!-- Product #6 -->
		<div class="four columns">
			<figure class="product">

				<div class="mediaholder">
					<a href="product-page.html">
						<img alt="" src="images/shop_item_06.jpg"/>
					</a>
					<a href="#" class="product-button"><i class="fa fa-shopping-cart"></i></a>
				</div>

				<a href="product-page.html">
					<section>
						<span class="product-category">香料</span>
						<h5>大蒜粒</h5>
						<span class="product-price">$2.99</span>
					</section>
				</a>
			</figure>
		</div>

	</div>
</div>

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
						<a href="recipe.jsp">浏览食谱</a>
					</li>
					<li>
						<a href="recipe_submit.jsp">上传食谱</a>
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
