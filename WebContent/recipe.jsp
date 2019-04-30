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
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
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
				<a href="recipe.jsp" id="current">食谱</a>
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


<!-- Recipe Background -->
<div class="recipeBackground">
	<img src="images/recipeBackground.jpg" alt="" />
</div>


<!-- Titlebar
================================================== -->
<section id="titlebar" class="browse-all">
	<!-- Container -->
	<div class="container">

		<div class="eight columns">
			<h2>食谱</h2>
		</div>

	</div>
	<!-- Container / End -->
</section>


<!-- Container -->
<div class="advanced-search-container">
	<div class="container">
		<div class="sixteen columns">
			<div id="advanced-search">

				<!-- Choose Category -->
				<div class="select">
					<label>选择类别</label>
					<select data-placeholder="选择类别" class="chosen-select-no-single">
						<option value="1">全部</option>
						<option value="2">早餐</option>
						<option value="3">午餐</option>
						<option value="4">饮料</option>
						<option value="5">小菜</option>
						<option value="6">汤类</option>
						<option value="7">代餐沙拉</option>
						<option value="8">牛肉类</option>
						<option value="9">禽类</option>
						<option value="10">豆制品</option>
						<option value="11">海鲜类</option>
						<option value="12">全素食</option>
						<option value="13">蔬菜</option>
						<option value="14">甜品</option>
						<option value="15">速食食品</option>
						<option value="16">面包、蛋糕</option>
						<option value="17">节日代表</option>
					</select>
				</div>

				<!-- Choose ingredients -->
				<div class="select included-ingredients">
					<label>选择想要配料</label>
					<select data-placeholder="选择配料" class="chosen-select" multiple>
						<option value="sugar">糖</option>
						<option value="wheat-flour">面粉</option>
						<option value="chicken-breast">鸡胸肉</option>
						<option value="garlic">大蒜</option>
						<option value="milk">牛奶</option>
						<option value="oil">油</option>
						<option value="butter">黄油</option>
						<option value="honey">蜂蜜</option>
						<option value="noodles">面食</option>
						<option value="onion">洋葱</option>
						<option value="beef-brisket">牛肉</option>
						<option value="beef-sirloin">牛排</option>
						<option value="broth">肉汤</option>
						<option value="chocolate">巧克力</option>
						<option value="cocoa-powder">可可粉</option>
						<option value="coconut">椰子</option>
						<option value="dried-black-mushrooms">香菇</option>
						<option value="egg">鸡蛋</option>
						<option value="five-spice-powder">五香粉</option>
						<option value="ginger">姜</option>
						<option value="chili-sauce">辣椒酱</option>
						<option value="leek">大葱</option>
						<option value="lettuce">生菜</option>
						<option value="oyster-sauce">耗油</option>
						<option value="pepper">辣椒</option>
						<option value="pineapple">菠萝</option>
						<option value="strawberries">草莓</option>
					</select>
				</div>

				<!-- Choose -->
				<div class="select">
					<label>所需包括配料</label>
					<select data-placeholder="Choose Category" class="chosen-select">
						<option value="1">所有选中的配料 </option>
						<option value="2">部分选中的配料</option>
					</select>
				</div>
				
				<div class="clearfix"></div>

				<!-- Search Input -->
				<nav class="search-by-keyword">
					<form action="#" method="get">
						<button><span>搜索食谱</span><i class="fa fa-search"></i></button>
						<input class="search-field" type="text" placeholder="搜索关键词" value=""/>
					</form>
				</nav>
				<div class="clearfix"></div>


				<!-- Advanced Search Button -->
				<a href="#" class="adv-search-btn">高级搜索 <i class="fa fa-caret-down"></i></a>


				<!-- Extra Search Options -->
				<div class="extra-search-options closed">


					<!-- Choose Excluded Ingredients -->
					<div class="select excluded-ingredients">
						<label>选择你想要排除的配料</label>
					<select data-placeholder="排除的配料" class="chosen-select" multiple>
						<option value="sugar">糖</option>
						<option value="wheat-flour">面粉</option>
						<option value="chicken-breast">鸡胸肉</option>
						<option value="garlic">大蒜</option>
						<option value="milk">牛奶</option>
						<option value="oil">油</option>
						<option value="butter">黄油</option>
						<option value="honey">蜂蜜</option>
						<option value="noodles">面食</option>
						<option value="onion">洋葱</option>
						<option value="beef-brisket">牛肉</option>
						<option value="beef-sirloin">牛排</option>
						<option value="broth">肉汤</option>
						<option value="chocolate">巧克力</option>
						<option value="cocoa-powder">可可粉</option>
						<option value="coconut">椰子</option>
						<option value="dried-black-mushrooms">香菇</option>
						<option value="egg">鸡蛋</option>
						<option value="five-spice-powder">五香粉</option>
						<option value="ginger">姜</option>
						<option value="chili-sauce">辣椒酱</option>
						<option value="leek">大葱</option>
						<option value="lettuce">生菜</option>
						<option value="oyster-sauce">耗油</option>
						<option value="pepper">辣椒</option>
						<option value="pineapple">菠萝</option>
						<option value="strawberries">草莓</option>
					</select>
					</div>


					<div class="clearfix"></div>


					<!-- Choose Level -->
					<div class="select">
						<label>选择烹饪难度</label>
						<select data-placeholder="选择烹饪难度" class="chosen-select">
							<option value="1">全部</option>
							<option value="2">简单</option>
							<option value="3">一般</option>
							<option value="4">较复杂</option>
							<option value="5">大师级</option>
						</select>
					</div>

					<!-- Choose serving -->
					<div class="select">
						<label>选择适合人数</label>
						<select data-placeholder="选择适合人数" class="chosen-select">
							<option value="1">全部</option>
							<option value="2">1人 </option>
							<option value="3">2人 </option>
							<option value="5">5人 </option>
							<option value="6">家庭</option>
						</select>
					</div>

					<!-- Choose time needed -->
					<div class="select">
						<label>选择烹饪时间</label>
						<select data-placeholder="选择烹饪时间" class="chosen-select">
							<option value="1">全部</option>
							<option value="2">半小时左右</option>
							<option value="3">少于一小时</option>
							<option value="3">多于一小时</option>
						</select>
					</div>

					<div class="clearfix"></div>
					<div class="margin-top-10"></div>

				</div>
				<!-- Extra Search Options / End -->


			<div class="clearfix"></div>
			</div>

		</div>
	</div>
</div>


<div class="margin-top-35"></div>


<!-- Container -->
<div class="container">

	<!-- Headline -->
	<div class="sixteen columns">
 		<h3 class="headline">食谱</h3>
		<span class="line margin-bottom-35"></span>
		<div class="clearfix"></div>
	</div>
	<div class="clearfix"></div>


		<!-- Isotope -->
		<div class="isotope">

			<!-- Recipe #1 -->
			<div class="four isotope-box columns">

				<!-- Thumbnail -->
				<div class="thumbnail-holder">
					<a href="getRecipePageAct?recipeId=1">
						<img src="images/recipeThumb-09.jpg" alt=""/>
						<div class="hover-cover"></div>
						<div class="hover-icon">查看食谱</div>
					</a>
				</div>

				<!-- Content -->
				<div class="recipe-box-content">
					<h3><a href="getRecipePageAct?recipeId=1">牛腩煲</a></h3>

					<div class="rating five-stars">
						<div class="star-rating"></div>
						<div class="star-bg"></div>
					</div>

					<div class="recipe-meta"><i class="fa fa-clock-o"></i> 2 小时</div>

					<div class="clearfix"></div>
				</div>
			</div>

			<!-- Recipe #2 -->
			<div class="four isotope-box columns">

				<!-- Thumbnail -->
				<div class="thumbnail-holder">
					<a href="recipe-page-1.html">
						<img src="images/recipeThumb-02.jpg" alt=""/>
						<div class="hover-cover"></div>
						<div class="hover-icon">查看食谱</div>
					</a>
				</div>

				<!-- Content -->
				<div class="recipe-box-content">
					<h3><a href="recipe-page-1.html">巧克力冰淇淋蛋糕</a></h3>

					<div class="rating four-stars">
						<div class="star-rating"></div>
						<div class="star-bg"></div>
					</div>

					<div class="recipe-meta"><i class="fa fa-clock-o"></i> 1 小时</div>

					<div class="clearfix"></div>
				</div>
			</div>

			<!-- Recipe #3 -->
			<div class="four isotope-box columns">

				<!-- Thumbnail -->
				<div class="thumbnail-holder">
					<a href="recipe-page-1.html">
						<img src="images/recipeThumb-03.jpg" alt=""/>
						<div class="hover-cover"></div>
						<div class="hover-icon">查看食谱</div>
					</a>
				</div>

				<!-- Content -->
				<div class="recipe-box-content">
					<h3><a href="recipe-page-1.html">咖喱鸡块</a></h3>

					<div class="rating five-stars">
						<div class="star-rating"></div>
						<div class="star-bg"></div>
					</div>

					<div class="recipe-meta"><i class="fa fa-clock-o"></i> 45 分钟</div>

					<div class="clearfix"></div>
				</div>
			</div>

			<!-- Recipe #4 -->
			<div class="four isotope-box columns">

				<!-- Thumbnail -->
				<div class="thumbnail-holder">
					<a href="recipe-page-2.html">
						<img src="images/recipeThumb-04.jpg" alt=""/>
						<div class="hover-cover"></div>
						<div class="hover-icon">View Recipe</div>
					</a>
				</div>

				<!-- Content -->
				<div class="recipe-box-content">
					<h3><a href="recipe-page-2.html">酸甜牛油果沙拉</a></h3>

					<div class="rating four-stars">
						<div class="star-rating"></div>
						<div class="star-bg"></div>
					</div>

					<div class="recipe-meta"><i class="fa fa-clock-o"></i> 15 分钟</div>

					<div class="clearfix"></div>
				</div>
			</div>

			<!-- Recipe #5 -->
			<div class="four isotope-box columns">

				<!-- Thumbnail -->
				<div class="thumbnail-holder">
					<a href="recipe-page-1.html">
						<img src="images/recipeThumb-05.jpg" alt=""/>
						<div class="hover-cover"></div>
						<div class="hover-icon">View Recipe</div>
					</a>
				</div>

				<!-- Content -->
				<div class="recipe-box-content">
					<h3><a href="recipe-page-1.html">玉米鸡肉卷</a></h3>

					<div class="rating four-stars">
						<div class="star-rating"></div>
						<div class="star-bg"></div>
					</div>

					<div class="recipe-meta"><i class="fa fa-clock-o"></i> 30 分钟</div>

					<div class="clearfix"></div>
				</div>
			</div>

			<!-- Recipe #6 -->
			<div class="four isotope-box columns">

				<!-- Thumbnail -->
				<div class="thumbnail-holder">
					<a href="recipe-page-2.html">
						<img src="images/recipeThumb-06.jpg" alt=""/>
						<div class="hover-cover"></div>
						<div class="hover-icon">View Recipe</div>
					</a>
				</div>

				<!-- Content -->
				<div class="recipe-box-content">
					<h3><a href="recipe-page-2.html">红烧鸡翅</a></h3>

					<div class="rating five-stars">
						<div class="star-rating"></div>
						<div class="star-bg"></div>
					</div>

					<div class="recipe-meta"><i class="fa fa-clock-o"></i> 45 分钟</div>

					<div class="clearfix"></div>
				</div>
			</div>

			<!-- Recipe #7 -->
			<div class="four isotope-box columns">

				<!-- Thumbnail -->
				<div class="thumbnail-holder">
					<a href="recipe-page-1.html">
						<img src="images/recipeThumb-07.jpg" alt=""/>
						<div class="hover-cover"></div>
						<div class="hover-icon">View Recipe</div>
					</a>
				</div>

				<!-- Content -->
				<div class="recipe-box-content">
					<h3><a href="recipe-page-1.html">柠檬咖喱鸡</a></h3>

					<div class="rating five-stars">
						<div class="star-rating"></div>
						<div class="star-bg"></div>
					</div>

					<div class="recipe-meta"><i class="fa fa-clock-o"></i> 1 小时 20 分钟</div>

					<div class="clearfix"></div>
				</div>
			</div>

			<!-- Recipe #8 -->
			<div class="four isotope-box columns">

				<!-- Thumbnail -->
				<div class="thumbnail-holder">
					<a href="recipe-page-1.html">
						<img src="images/recipeThumb-08.jpg" alt=""/>
						<div class="hover-cover"></div>
						<div class="hover-icon">View Recipe</div>
					</a>
				</div>

				<!-- Content -->
				<div class="recipe-box-content">
					<h3><a href="recipe-page-1.html">罗宋汤</a></h3>

					<div class="rating four-stars">
						<div class="star-rating"></div>
						<div class="star-bg"></div>
					</div>

					<div class="recipe-meta"><i class="fa fa-clock-o"></i> 1 小时 30 分钟</div>

					<div class="clearfix"></div>
				</div>
			</div>

		</div>
		<div class="clearfix"></div>


		<!-- Pagination -->
		<div class="sixteen columns">
			<div class="pagination-container">
				<nav class="pagination">
					<ul>
						<li><a href="#" class="current-page">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
					</ul>
				</nav>

				<nav class="pagination-next-prev">
					<ul>
						<li><a href="#" class="prev"></a></li>
						<li><a href="#" class="next"></a></li>
					</ul>
				</nav>
			</div>
		</div>

</div>


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