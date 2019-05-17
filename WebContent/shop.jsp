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


		<!-- Content
================================================== -->
		<div class="container">

			<!-- Products -->
			<div class="twelve columns left-sidebar-class">

				<!-- Ordering -->
				<div class="ordering">
					<select class="chosen-select-no-single">
						<option value="menu_order">默认排序</option>
						<option value="popularity">按人气排序</option>
						<option value="rating">按平均评级排序</option>
						<option value="date">按新品排序</option>
						<option value="price">按价格排序：从高到低</option>
						<option value="price-desc">按价格排序：从低到高</option>
					</select>
				</div>
				<div class="clearfix"></div>


				<!-- Product #1 -->
				<div class="four shop columns">
					<figure class="product">

						<div class="mediaholder">
							<a href="product_page.jsp">
								<img alt="" src="images/shop_item_01.jpg" />
							</a>
							<a href="#" class="product-button">
								<i class="fa fa-shopping-cart"></i>
							</a>
						</div>

						<a href="product_page.jsp">
							<section>
								<span class="product-category">香料</span>
								<h5>小豆蔻夹</h5>
								<span class="product-price">$2.99</span>
							</section>
						</a>
					</figure>
				</div>

				<!-- Product #2 -->
				<div class="four shop columns">
					<figure class="product">

						<div class="mediaholder">
							<a href="product-page.html">
								<img alt="" src="images/shop_item_02.jpg" />
							</a>
							<a href="#" class="product-button">
								<i class="fa fa-shopping-cart"></i>
							</a>
						</div>

						<a href="product-page.html">
							<section>
								<span class="product-category">香料</span>
								<h5>混合草药</h5>
								<span class="product-price">$2.99</span>
							</section>
						</a>
					</figure>
				</div>

				<!-- Product #3 -->
				<div class="four shop columns">
					<figure class="product">

						<div class="mediaholder">
							<a href="product-page.html">
								<img alt="" src="images/shop_item_03.jpg" />
							</a>
							<a href="#" class="product-button">
								<i class="fa fa-shopping-cart"></i>
							</a>
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
				<div class="four shop columns">
					<figure class="product">

						<div class="mediaholder">
							<a href="product-page.html">
								<img alt="" src="images/shop_item_04.jpg" />
							</a>
							<a href="#" class="product-button">
								<i class="fa fa-shopping-cart"></i>
							</a>
						</div>

						<a href="product-page.html">
							<section>
								<span class="product-category">香料</span>
								<h5>黑胡椒</h5>
								<span class="product-price">$2.99</span>
							</section>
						</a>
					</figure>
				</div>

				<!-- Product #5 -->
				<div class="four shop columns">
					<figure class="product">

						<div class="mediaholder">
							<a href="product-page.html">
								<img alt="" src="images/shop_item_05.jpg" />
							</a>
							<a href="#" class="product-button">
								<i class="fa fa-shopping-cart"></i>
							</a>
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
				<div class="four shop columns">
					<figure class="product">

						<div class="mediaholder">
							<a href="product-page.html">
								<img alt="" src="images/shop_item_06.jpg" />
							</a>
							<a href="#" class="product-button">
								<i class="fa fa-shopping-cart"></i>
							</a>
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

				<div class="clearfix"></div>
				<div class="margin-top-40"></div>

				<!-- Pagination -->
				<div class="pagination-container masonry">
					<nav class="pagination">
						<ul>
							<li>
								<a href="#" class="current-page">1</a>
							</li>
							<li>
								<a href="#">2</a>
							</li>
							<li>
								<a href="#">3</a>
							</li>
						</ul>
					</nav>

					<nav class="pagination-next-prev">
						<ul>
							<li>
								<a href="#" class="prev"></a>
							</li>
							<li>
								<a href="#" class="next"></a>
							</li>
						</ul>
					</nav>
				</div>

			</div>


			<!-- Sidebar
	================================================== -->
			<div class="four columns">

				<!-- Search Form -->
				<div class="widget search-form">
					<nav class="search">
						<form action="#" method="get">
							<button>
								<i class="fa fa-search"></i>
							</button>
							<input class="search-field" type="text" placeholder="搜索食材" value="" />
						</form>
					</nav>
					<div class="clearfix"></div>
				</div>


				<!-- Cart -->
				<div class="widget">
					<h4 class="headline">购物车</h4>
					<span class="line margin-bottom-30"></span>
					<div class="clearfix"></div>

					<div class="widget_shopping_cart_content">
						<ul class="product_list_widget">

							<li>
								<a href="#" class="image">
									<img src="images/shop_item_02a.jpg" alt="">
								</a>
								<div class="product_title">
									<a href="#">混合草药</a>
									<span class="quantity">1 ×
										<span class="amount">$2.99</span>
									</span>
								</div>
							</li>

						</ul>

						<p class="total">
							<strong>小计:</strong>
							<span class="amount">$2.99</span>
						</p>

						<span class="buttons">
							<a href="#" class="button">查看购物车</a>
							<a href="#" class="button color">结账</a>
						</span>
					</div>
				</div>


				<!-- Widget -->
				<div class="widget">
					<h4 class="headline">按价格筛选</h4>
					<span class="line margin-bottom-30"></span>
					<div class="clearfix"></div>

					<div id="price-range">
						<div class="padding-range">
							<div id="slider-range"></div>
						</div>
						<label for="amount">价格:</label>
						<input type="text" id="amount" />
						<a href="#" class="button color">筛选</a>
					</div>
					<div class="clearfix"></div>
				</div>

			</div>

		</div>
		<!-- Container / End -->


		<div class="margin-top-5"></div>

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
