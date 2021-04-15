<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>SHOP</title>
<base href="${pageContext.servletContext.contextPath}/">
<!--/tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Elite Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 





</script>
<!--//tags -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/easy-responsive-tabs.css" rel='stylesheet'
	type='text/css' />
<!-- //for bootstrap working -->
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"
	rel="stylesheet">
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<!-- header -->
	<div class="header" id="home">
		<div class="container">
			<ul>
				<ul>
					<c:choose>
						<c:when test="${username==null}">
							<li><a href="login.htm"><i class="fa fa-unlock-alt"
									aria-hidden="true"></i> Sign In </a></li>
							<li><a href="signup.html"><i
									class="fa fa-pencil-square-o" aria-hidden="true"></i> Sign Up </a></li>
						</c:when>
						<c:when test="${username!=null}">
							<li><i class="fa fa-user" aria-hidden="true"></i>${name}</li>
							<li><a href="signout.htm"><i class="fa fa-sign-out"
									aria-hidden="true"></i> Sign Out </a></li>
						</c:when>
					</c:choose>
				</ul>
			</ul>
		</div>
	</div>
	<!-- //header -->
	<!-- header-bot -->
	<div class="header-bot">
		<div class="header-bot_inner_wthreeinfo_header_mid">
			<!-- header-bot -->
			<div class="col-md-6 logo_agile">
				<h1>
					<a href="index.html"><span>S</span>HOP VẬT TƯ <i
						class="fa fa-shopping-bag top_logo_agile_bag" aria-hidden="true"></i></a>
				</h1>
			</div>
			<!-- header-bot -->
			<div class="col-md-6 header-middle">
				<form action="search/1.htm" method="get">
					<input width="380px" height="50px" type="search" name="search" placeholder="Search here..."
						required=""> <input type="submit" value="search" style="color: white">
					<div class="clearfix"></div>
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //header-bot -->
	<!-- banner -->
	<div class="ban-top">
		<div class="container">
			<div class="top_nav_left">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse menu--shylock"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav menu__list">
								<li class="active menu__item"><a class="menu__link"
									href="index.htm">HOME<span class="sr-only">(current)</span></a></li>
								<!-- <li class=" menu__item"><a class="menu__link" href="about.html">About</a></li> -->
								<li class="dropdown menu__item menu__item--current"><a
									href="#" class="dropdown-toggle menu__link"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">VẬT TƯ<span class="caret"></span></a>
									<ul class="dropdown-menu multi-column columns-3">
										<div class="agile_inner_drop_nav_info">
											<div class="col-sm-6 multi-gd-img1 multi-gd-text ">
												<a href="vattu.htm"><img
													src="images/vat-tu-ky-thuat.jpg" alt=" " /></a>
											</div>
											<div class="col-sm-6 multi-gd-img">
												<ul class="multi-column-dropdown">
													<li><a href="vattu/1/1.htm">Sơn</a></li>
													<li><a href="vattu/2/1.htm">Xi Măng</a></li>
													<li><a href="vattu/3/1.htm">Ống Nước</a></li>
													<li><a href="vattu/4/1.htm">Gạch Xây Dựng</a></li>
												</ul>
											</div>
											<div class="clearfix"></div>
										</div>
									</ul></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
			<div class="top_nav_right">
				<div class="wthreecartaits wthreecartaits2 cart cart box_1">
					<form action="#" method="post" class="last">
						<input type="hidden" name="cmd" value="_cart"> <input
							type="hidden" name="display" value="1">
						<button class="w3view-cart" type="submit" name="submit" value="">
							<i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
						</button>
					</form>

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="page-head_agile_info_w3l">
		<div class="container">

			<!--//w3_short-->
		</div>
	</div>

	<!-- banner-bootom-w3-agileits -->
	<div class="banner-bootom-w3-agileits">
		<div class="container">
			<div class="col-md-4 single-right-left ">
				<div class="grid images_3_of_2">
					<div class="flexslider" style="border: 1px solid red;">
						<ul class="slides">
							<li data-thumb="${product.image}">
								<div class="thumb-image">
									<img src="${product.image}" data-imagezoom="true"
										class="img-responsive" style="border: red;">
								</div>
							</li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="col-md-8 single-right-left simpleCart_shelfItem">
				<h3>${product.name}</h3>
				<p>
					<span class="item_price"><fmt:formatNumber value="${product.price - product.price*(product.discount/100)}" type="currency"></fmt:formatNumber></span>
					<del><fmt:formatNumber value="${product.price}" type="currency"></fmt:formatNumber></del>
				</p>
				<div class="rating1">
					<span class="starRating"> <input id="rating5" type="radio"
						name="rating" value="5"> <label for="rating5">5</label> <input
						id="rating4" type="radio" name="rating" value="4"> <label
						for="rating4">4</label> <input id="rating3" type="radio"
						name="rating" value="3" checked=""> <label for="rating3">3</label>
						<input id="rating2" type="radio" name="rating" value="2">
						<label for="rating2">2</label> <input id="rating1" type="radio"
						name="rating" value="1"> <label for="rating1">1</label>
					</span>
				</div>

				<div class="occasion-cart">
					<div
						class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
						<form action="add/${product.id}.htm" method="post">
							<fieldset>
								<input type="hidden" name="cmd" value="_cart"> <input
									type="hidden" name="add" value="1"> <input
									type="hidden" name="business" value=" "> <input
									type="hidden" name="item_name" value="Wing Sneakers"> <input
									type="hidden" name="amount" value="650.00"> <input
									type="hidden" name="discount_amount" value="1.00"> <input
									type="hidden" name="currency_code" value="USD"> <input
									type="hidden" name="return" value=" "> <input
									type="hidden" name="cancel_return" value=" "> <input
									type="submit" name="submit" value="Add to cart" class="button">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<!-- /new_arrivals -->
			<div class="responsive_tabs_agileits">
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li>information</li>
						<li>Description</li>
					</ul>
					<div class="resp-tabs-container">
						<!--/tab_one-->
						<div class="tab1">

							<div class="single_page_agile_its_w3ls">
								<h6>${product.name}</h6>
								<p style="color: black">Giá Bán Niêm Yết: <fmt:formatNumber value="${product.price}" type="currency"></fmt:formatNumber></p>
								<p class="w3ls_para" style="color: black">Giá Bán Khuyến Mãi: <fmt:formatNumber value="${product.price - product.price*(product.discount/100)}" type="currency"></fmt:formatNumber></p>
								<p class="w3ls_para" style="color: black">Đơn vị tính : ${product.unit}</p>
							</div>


						</div>
						<!--//tab_one-->
						<div class="tab2">
							<div class="single_page_agile_its_w3ls">
								<h6>${product.name}</h6>
								<p class="w3ls_para" style="color: black">${product.description}</p>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- //new_arrivals -->
			<!--/slider_owl-->

			<div class="w3_agile_latest_arrivals">
				<h3 class="wthree_text_info">
					Sản Phẩm<span>Tương Tự</span>
				</h3>
				<c:forEach var="p" items="${lProduct}">
					<div class="col-md-3 product-men">
						<div class="men-pro-item simpleCart_shelfItem">
							<div class="men-thumb-item">
								<img src="${p.image}" alt="" class="pro-image-front" height="250px" width="300px"> <img
									src="${p.image}" alt="" class="pro-image-back" height="250px" width="300px">
								<div class="men-cart-pro">
									<div class="inner-men-cart-pro">
										<a href="single/${p.id}.htm" class="link-product-add-cart">Quick
											View</a>
									</div>
								</div>
								<span class="product-new-top">New</span>

							</div>
							<div class="item-info-product ">
								<h4>
									<a href="single/${p.id}.html">${p.name}</a>
								</h4>
								<div class="info-product-price">
									<span class="item_price"><fmt:formatNumber value="${p.price - p.price*(p.discount/100)}" type="currency"></fmt:formatNumber></span>
									<del><fmt:formatNumber value="${product.price}" type="currency"></fmt:formatNumber></del>
								</div>
								<div
									class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
									<form action="add/${p.id}.htm" method="post">
										<fieldset>
											<input type="hidden" name="cmd" value="_cart" /> <input
												type="hidden" name="add" value="1" /> <input type="hidden"
												name="business" value=" " /> <input type="hidden"
												name="item_name" value="${p.name}" /> <input type="hidden"
												name="amount" value="${p.price - p.price*(p.discount/100)}" />
											<input type="hidden" name="discount_amount" value="1.00" />
											<input type="hidden" name="currency_code" value="VND" /> <input
												type="hidden" name="return" value=" " /> <input
												type="hidden" name="cancel_return" value=" " /> <input
												type="submit" name="submit" value="Add to cart"
												class="button" />
										</fieldset>
									</form>
								</div>

							</div>
						</div>
					</div>
				</c:forEach>
				<div class="clearfix"></div>
				<!--//slider_owl-->
			</div>
		</div>
	</div>
	<!--//single_page-->
	<!--/grids-->
	<div class="coupons">
		<div class="coupons-grids text-center">
			<div class="w3layouts_mail_grid">
				<div class="col-md-3 w3layouts_mail_grid_left">
					<div class="w3layouts_mail_grid_left1 hvr-radial-out">
						<i class="fa fa-truck" aria-hidden="true"></i>
					</div>
					<div class="w3layouts_mail_grid_left2">
						<h3>FREE SHIPPING</h3>
						<p>Lorem ipsum dolor sit amet, consectetur</p>
					</div>
				</div>
				<div class="col-md-3 w3layouts_mail_grid_left">
					<div class="w3layouts_mail_grid_left1 hvr-radial-out">
						<i class="fa fa-headphones" aria-hidden="true"></i>
					</div>
					<div class="w3layouts_mail_grid_left2">
						<h3>24/7 SUPPORT</h3>
						<p>Lorem ipsum dolor sit amet, consectetur</p>
					</div>
				</div>
				<div class="col-md-3 w3layouts_mail_grid_left">
					<div class="w3layouts_mail_grid_left1 hvr-radial-out">
						<i class="fa fa-shopping-bag" aria-hidden="true"></i>
					</div>
					<div class="w3layouts_mail_grid_left2">
						<h3>MONEY BACK GUARANTEE</h3>
						<p>Lorem ipsum dolor sit amet, consectetur</p>
					</div>
				</div>
				<div class="col-md-3 w3layouts_mail_grid_left">
					<div class="w3layouts_mail_grid_left1 hvr-radial-out">
						<i class="fa fa-gift" aria-hidden="true"></i>
					</div>
					<div class="w3layouts_mail_grid_left2">
						<h3>FREE GIFT COUPONS</h3>
						<p>Lorem ipsum dolor sit amet, consectetur</p>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>

		</div>
	</div>

	<div class="footer">
		<div class="footer_agile_inner_info_w3l">
			<div class="col-md-3 footer-left">
				<h2>
					<a href="index.html"><span>S</span>hop Vật Tư</a>
				</h2>
				<p>Shop Vật Tư xin trân trọng cảm ơn quý khách đã tin dùng. Sự
					hài lòng của quý khách là động lực để chúng tôi mang đến những sản
					phẩm tốt hơn!</p>
			</div>
			<div class="col-md-9 footer-right">
				<div class="sign-grds">
					<div class="sign-gd-two">
						<h4>
							Store <span>Information</span>
						</h4>
						<div class="w3-address">
							<div class="w3-address-grid">
								<div class="w3-address-left">
									<i class="fa fa-phone" aria-hidden="true"></i>
								</div>
								<div class="w3-address-right">
									<h6>Phone Number</h6>
									<p>023 567 8901</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="w3-address-grid">
								<div class="w3-address-left">
									<i class="fa fa-envelope" aria-hidden="true"></i>
								</div>
								<div class="w3-address-right">
									<h6>Email Address</h6>
									<p>
										Email :<a href="mailto:example@email.com">
											studyshop@gmail.com</a>
									</p>
								</div>
								<div class="clearfix"></div>
							</div>

						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class=>
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.522478687579!2d106.78390341371313!3d10.847808660840926!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527136a359b7f%3A0x1b48baf4a56470a2!2zSOG7jWMgVmnhu4duIELGsHUgY2jDrW5o!5e0!3m2!1svi!2s!4v1570714834149!5m2!1svi!2s"
					width="1140" height="500" frameborder="0"
					style="border: 0; margin-top: 40px" allowfullscreen=""></iframe>
			</div>
			<div class="clearfix"></div>
		</div>
		<p class="copy-right">&copy 2017 Elite shoppy. All rights reserved
			| Design by PTITer</p>
	</div>
	</div>
	<!-- //footer -->


	<a href="#home" class="scroll" id="toTop" style="display: block;">
		<span id="toTopHover" style="opacity: 1;"> </span>
	</a>


	<!-- //cart-js -->
	<!-- script for responsive tabs -->
	<script src="js/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function() {
			$('#horizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion           
				width : 'auto', //auto or any width like 600px
				fit : true, // 100% fit in a container
				closed : 'accordion', // Start closed if in accordion view
				activate : function(event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
			$('#verticalTab').easyResponsiveTabs({
				type : 'vertical',
				width : 'auto',
				fit : true
			});
		});
	</script>
	<!-- //script for responsive tabs -->
	<!-- stats -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!-- //stats -->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/jquery.easing.min.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->


	<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>


<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<script src="js/modernizr.custom.js"></script>
<!-- Custom-JavaScript-File-Links -->
<!-- cart-js -->
<script src="js/minicart.min.js"></script>
<script>
	// Mini Cart
	paypal.minicart.render({
		action : '#'
	});

	if (~window.location.search.indexOf('reset=true')) {
		paypal.minicart.reset();
	}
</script>

<!-- //cart-js -->
<!-- single -->
<script src="js/imagezoom.js"></script>
<!-- single -->
<!-- script for responsive tabs -->
<script src="js/easy-responsive-tabs.js"></script>
<script>
	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true, // 100% fit in a container
			closed : 'accordion', // Start closed if in accordion view
			activate : function(event) { // Callback function if tab is switched
				var $tab = $(this);
				var $info = $('#tabInfo');
				var $name = $('span', $info);
				$name.text($tab.text());
				$info.show();
			}
		});
		$('#verticalTab').easyResponsiveTabs({
			type : 'vertical',
			width : 'auto',
			fit : true
		});
	});
</script>
<!-- FlexSlider -->
<script src="js/jquery.flexslider.js"></script>
<script>
	// Can also be used with $(document).ready()
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			controlNav : "thumbnails"
		});
	});
</script>
<!-- //FlexSlider-->
<!-- //script for responsive tabs -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- here stars scrolling icon -->
<script type="text/javascript">
	$(document).ready(function() {
		/*
			var defaults = {
			containerID: 'toTop', // fading element id
			containerHoverID: 'toTopHover', // fading element hover id
			scrollSpeed: 1200,
			easingType: 'linear' 
			};
		 */

		$().UItoTop({
			easingType : 'easeOutQuart'
		});

	});
</script>
<!-- //here ends scrolling icon -->

<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
