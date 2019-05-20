<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,pojo.User,pojo.Recipe,pojo.RPicture"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	User user=new User();
	if(session.getAttribute("user")!=null){
		user=(User)session.getAttribute("user");
	}
	
	List<Recipe> recipes_rec = new ArrayList<Recipe>();
	if(request.getAttribute("recipes_recommended") != null){
		recipes_rec = (List<Recipe>)request.getAttribute("recipes_recommended");
	}
	
	List<List<RPicture>> pictures_rec = new ArrayList<List<RPicture>>();
	if(request.getAttribute("pictures_recommended") != null){
		pictures_rec = (List<List<RPicture>>)request.getAttribute("pictures_recommended");
	}
	
	List<Recipe> recipes_lat = new ArrayList<Recipe>();
	if(request.getAttribute("recipes_latest") != null){
		recipes_lat = (List<Recipe>)request.getAttribute("recipes_latest");
	}
	
	List<List<RPicture>> pictures_lat = new ArrayList<List<RPicture>>();
	if(request.getAttribute("pictures_latest") != null){
		pictures_lat = (List<List<RPicture>>)request.getAttribute("pictures_latest");
	}
	
	int pageNum = 0;
	if(request.getAttribute("page") != null){
		pageNum = (int)request.getAttribute("page");
	}
	
 	List<Recipe> recipes_page = new ArrayList<Recipe>();
	if(request.getAttribute("recipes_page") != null){
		recipes_page = (List<Recipe>)request.getAttribute("recipes_page");
	}
	
	List<List<RPicture>> pictures_page = new ArrayList<List<RPicture>>();
	if(request.getAttribute("pictures_page") != null){
		pictures_page = (List<List<RPicture>>)request.getAttribute("pictures_page");
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
 	<script type="text/javascript">
		function jumpToRecipe() {
			window.location.href = "recipe.jsp";
		}
	</script>

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
								<a href="index.jsp" id="current">主页</a>
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


		<!-- Slider
================================================== -->

		<div id="homeSlider" class="royalSlider rsDefaultInv">
			
			<% 
				for(int i = 0; i < 5; i++){
			%>	
			<!-- Slide #1 -->
			<div class="rsContent">
				<a class="rsImg" href="<%= pictures_rec.get(i).get(1).getUrl() %>"></a>
				<i class="rsTmb"><%= recipes_rec.get(i).getName() %></i>

				<!-- Slide Caption -->
				<div class="SlideTitleContainer rsABlock">
					<div class="CaptionAlignment">
						<div class="rsSlideTitle tags">
							<ul>
								<li><%= recipes_rec.get(i).getCategory() %></li>
							</ul>
							<div class="clearfix"></div>
						</div>

						<h2 class="rsSlideTitle title">
							<a href="getRecipePageAct?recipeId=<%= recipes_rec.get(i).getId() %>"><%= recipes_rec.get(i).getName() %></a>
						</h2>

						<div class="rsSlideTitle details">
							<ul>
								<li>
									<i class="fa fa-cutlery"></i><%= recipes_rec.get(i).getComplexity() %></li>
								<li>
									<i class="fa fa-clock-o"></i><%= recipes_rec.get(i).getMinute() %></li>
								<li>
									<i class="fa fa-user"></i> by
									<a href="#"><%= recipes_rec.get(i).getAuthor() %></a>
								</li>
							</ul>
						</div>

						<a href="getRecipePageAct?recipeId=<%= recipes_rec.get(i).getId() %>" class="rsSlideTitle button">查看食谱</a>
					</div>
				</div>

			</div>
			<%	
				}
			%>
			
		</div>


		<!-- Content
================================================== -->
		<div class="container">

			<!-- Masonry -->
			<div class="twelve columns">

				<!-- Headline -->
				<h3 class="headline">最新食谱</h3>
				<span class="line rb margin-bottom-35"></span>
				<div class="clearfix"></div>

				<!-- Isotope -->
				<div class="isotope">
					<%
						if(pageNum == 1){
					%>
					<!-- Recipe #1 -->
					<div class="four recipe-box columns">

						<!-- Thumbnail -->
						<div class="thumbnail-holder">
							<a href="getRecipePageAct?recipeId=<%= recipes_lat.get(0).getId() %>">
								<img src="<%= pictures_lat.get(0).get(2).getUrl() %>" alt="" />
								<div class="hover-cover"></div>
								<div class="hover-icon">查看食谱</div>
							</a>
						</div>

						<!-- Content -->
						<div class="recipe-box-content">
							<h3>
								<a href="getRecipePageAct?recipeId=<%= recipes_lat.get(0).getId() %>"><%= recipes_lat.get(0).getName() %></a>
							</h3>

							<div class="<%= recipes_lat.get(0).getRating() %>">
								<div class="star-rating"></div>
								<div class="star-bg"></div>
							</div>

							<div class="recipe-meta">
								<i class="fa fa-clock-o"></i><%= recipes_lat.get(0).getMinute() %>分钟</div>

							<div class="clearfix"></div>
						</div>
					</div>

					<!-- Recipe #2 -->
					<div class="four recipe-box columns">

						<!-- Thumbnail -->
						<div class="thumbnail-holder">
							<a href="getRecipePageAct?recipeId=<%= recipes_lat.get(1).getId() %>">
								<img src="<%= pictures_lat.get(1).get(2).getUrl() %>" alt="" />
								<div class="hover-cover"></div>
								<div class="hover-icon">查看食谱</div>
							</a>
						</div>

						<!-- Content -->
						<div class="recipe-box-content">
							<h3>
								<a href="getRecipePageAct?recipeId=<%= recipes_lat.get(1).getId() %>"><%= recipes_lat.get(1).getName() %></a>
							</h3>

							<div class="<%= recipes_lat.get(1).getRating() %>">
								<div class="star-rating"></div>
								<div class="star-bg"></div>
							</div>

							<div class="recipe-meta">
								<i class="fa fa-clock-o"></i><%= recipes_lat.get(1).getMinute() %>分钟</div>

							<div class="clearfix"></div>
						</div>
					</div>

					<!-- Recipe #3 -->
					<div class="four recipe-box columns">

						<!-- Thumbnail -->
						<div class="thumbnail-holder">
							<a href="getRecipePageAct?recipeId=<%= recipes_lat.get(2).getId() %>">
								<img src="<%= pictures_lat.get(2).get(2).getUrl() %>" alt="" />
								<div class="hover-cover"></div>
								<div class="hover-icon">查看食谱</div>
							</a>
						</div>

						<!-- Content -->
						<div class="recipe-box-content">
							<h3>
								<a href="getRecipePageAct?recipeId=<%= recipes_lat.get(2).getId() %>"><%= recipes_lat.get(2).getName() %></a>
							</h3>

							<div class="<%= recipes_lat.get(2).getRating() %>">
								<div class="star-rating"></div>
								<div class="star-bg"></div>
							</div>

							<div class="recipe-meta">
								<i class="fa fa-clock-o"></i><%= recipes_lat.get(2).getMinute() %>分钟</div>

							<div class="clearfix"></div>
						</div>
					</div>
					<%
						}
					%>

					<%
						for(int i = 0; i < recipes_page.size(); i++){
					%>
 					<!-- Recipe #4 -->
					<div class="four recipe-box columns">

						<!-- Thumbnail -->
						<div class="thumbnail-holder">
							<a href="getRecipePageAct?recipeId=<%= recipes_page.get(i).getId() %>">
								<img src="<%= pictures_page.get(i).get(2).getUrl() %>" alt="" />
								<div class="hover-cover"></div>
								<div class="hover-icon">查看食谱</div>
							</a>
						</div>

						<!-- Content -->
						<div class="recipe-box-content">
							<h3>
								<a href="getRecipePageAct?recipeId=<%= recipes_page.get(i).getId() %>"><%= recipes_page.get(i).getName() %></a>
							</h3>

							<div class="<%= recipes_page.get(i).getRating() %>">
								<div class="star-rating"></div>
								<div class="star-bg"></div>
							</div>

							<div class="recipe-meta">
								<i class="fa fa-clock-o"></i><%= recipes_page.get(i).getMinute() %>分钟</div>

							<div class="clearfix"></div>
						</div>
					</div>
					<%
						}
					%>
					
				</div>
				<div class="clearfix"></div>
				
				<!-- Pagination -->
				<div class="pagination-container masonry">
 					<nav class="pagination">
						<ul>
							<li>
								<c:choose>
									<c:when test="${page-1==0 }"></c:when>
									<c:otherwise><a href="InitIndex?page=${page-1 }">${page-1 }</a></c:otherwise>
								</c:choose>
							</li>
							<li>
								<a href="InitIndex?page=${page }" class="current-page">${page }</a>						
							</li>
							<li>
								<c:choose>
									<c:when test="${page==pagecount }"></c:when>
									<c:otherwise><a href="InitIndex?page=${page+1 }">${page+1 }</a></c:otherwise>
								</c:choose>
							</li>
						</ul>
					</nav>

					<nav class="pagination-next-prev">
						<ul>
							<li>
								<c:choose>
									<c:when test="${page==1 }"><a href="#" class="prev"></a></c:when>
									<c:otherwise><a href="InitIndex?page=${page-1 }" class="prev"></a></c:otherwise>
								</c:choose>
							</li>
							<li>
								<c:choose>
									<c:when test="${page==pagecount }"><a href="#" class="next"></a></c:when>
									<c:otherwise><a href="InitIndex?page=${page+1 }" class="next"></a></c:otherwise>
								</c:choose> 
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
						<form action="recipe.jsp" method="get">
							<button>
								<i class="fa fa-search"></i>
							</button>
							<input onfocus="jumpToRecipe()" class="search-field" type="text" placeholder="寻味" value="" />
						</form>
					</nav>
					<div class="clearfix"></div>
				</div>


				<!-- Author Box -->
<!-- 				<div class="widget">
					<div class="author-box">
						<span class="title">作者</span>
						<span class="name">Sandra
							<br> Fortin</span>
						<span class="contact">
							<a href="mailto:sandra@chow.com">sandra@chow.com</a>
						</span>
						<img src="images/author-photo.png" alt="">
						<p>I'm Sandra and this is where I share my stuff. I am madly in love with food. You will find a balance of healthy recipes,
							comfort food and indulgent desserts.</p>
					</div>
				</div> -->


				<!-- Popular Recipes -->
				<div class="widget">
					<h4 class="headline">大众食谱</h4>
					<span class="line margin-bottom-30"></span>
					<div class="clearfix"></div>

					<!-- Recipe #1 -->
					<a href="getRecipePageAct?recipeId=6" class="featured-recipe">
						<img src="images/featuredRecipe-01.jpg" alt="">

						<div class="featured-recipe-content">
							<h4>巧克力冰淇淋蛋糕</h4>

							<div class="rating five-stars">
								<div class="star-rating"></div>
								<div class="star-bg"></div>
							</div>
						</div>
						<div class="post-icon"></div>
					</a>

					<!-- Recipe #2 -->
					<a href="getRecipePageAct?recipeId=2" class="featured-recipe">
						<img src="images/featuredRecipe-02.jpg" alt="">

						<div class="featured-recipe-content">
							<h4>墨西哥烤玉米食谱</h4>

							<div class="rating five-stars">
								<div class="star-rating"></div>
								<div class="star-bg"></div>
							</div>
						</div>
						<div class="post-icon"></div>
					</a>

					<!-- Recipe #3 -->
					<a href="getRecipePageAct?recipeId=8" class="featured-recipe">
						<img src="images/featuredRecipe-03.jpg" alt="">

						<div class="featured-recipe-content">
							<h4>玉米鸡肉卷</h4>

							<div class="rating five-stars">
								<div class="star-rating"></div>
								<div class="star-bg"></div>
							</div>
						</div>
						<div class="post-icon"></div>
					</a>

					<div class="clearfix"></div>
				</div>


				<!-- Share -->
				<div class="widget">
					<h4 class="headline">分享</h4>
					<span class="line margin-bottom-30"></span>
					<div class="clearfix"></div>

					<ul class="share-buttons">
						<li class="facebook-share">
							<a href="#">
								<span class="counter">1,234</span>
								<span class="counted">粉丝</span>
								<span class="action-button">喜欢</span>
							</a>
						</li>

						<li class="twitter-share">
							<a href="#">
								<span class="counter">863</span>
								<span class="counted">粉丝</span>
								<span class="action-button">喜欢</span>
							</a>
						</li>

						<li class="google-plus-share">
							<a href="#">
								<span class="counter">902</span>
								<span class="counted">粉丝</span>
								<span class="action-button">喜欢</span>
							</a>
						</li>
					</ul>
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
