<!doctype html>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>



<%
	String playString = "";
	String search = "";
	String userAction = (String) request.getParameter("action");
	String artist = (String) request.getParameter("artist");
	String searchartist = (String) request.getParameter("searchartist");
%>
<html lang="en">
<head>
<meta charset="utf-8">

<!-- disable iPhone inital scale -->
<meta name="viewport" content="width=device-width ,initial-scale=1.0">

<title>Imayam</title>



<!-- main css -->
<link href="stylev2.css" rel="stylesheet" type="text/css">

<!-- media queries css -->
<link href="media-queries.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="flexslider.css" type="text/css"
	media="screen" />

<script type="text/javascript"
	src="/newisai/js/quicktime/jquery-1.2.3.pack.js"></script>
<script type="text/javascript"
	src="/newisai/js/quicktime/jquery.embedquicktime.js"></script>


<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/stylev2.css" />
<script defer src="jquery.flexslider.js"></script>

<script type="text/javascript">
	$(window).load(function() {
		$('.flexslider').flexslider({
			animation : "slide",
			start : function(slider) {
				$('body').removeClass('loading');
			}
		});
	});
</script>
<script>
	$(function() {
		$("#accordion").accordion();
	});
</script>
<div id="fb-root">
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
</div>
<!-- /#pagewrap -->

<!-- html5.js for IE less than 9 -->
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!-- css3-mediaqueries.js for IE less than 9 -->
<!--[if lt IE 9]>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->

</head>
<%@include file="header.jsp"%>


<div id="pagewrap">
	<aside id="sidebar1">
		<section class="widget1 clearfix">

			<h2 class="widgettitle">Frequently Listened</h2>

			<div class="flexslider1">
				<ul class="slides1">

					<c:set var="count" value="0" scope="page" />

					<c:forEach items="${img1}" varStatus="status" var="slide" begin="0"
						end="4">


						<li type='none'><a
							href="/newisai/movies.jsp?action=playlist&artist=<c:out value="${slide.moviename}"/>"><img
								src="<c:out value="${slide.image}"/>" /></a></li>
						<c:set var="count" value="${count + 1}" scope="page" />

					</c:forEach>


				</ul>
			</div>
		</section>
	</aside>

	<aside id="sidebar">
		<section class="widget1 clearfix">
			<h2>Song Categories</h2>
			<div class="flexslider1">
				<body link="blue">
					<center>

						<br> <b> <a class="ex2"
							href="/newisai/movies.jsp?action=playlist&artist=All"><input
								type="button" value="All Time Hits"
								style="width: 200px; height: 40px; color: white; background-color: #808080" />
						</a> <br> <a class="ex2"
							href="/newisai/movies.jsp?action=playlist&artist=NewAdds"><input
								type="button" value="New Additions"
								style="width: 200px; height: 40px; color: white; background-color: #808080" />
						</a> <br> <a
							href="/newisai/movies.jsp?action=userplaylist&artist=Editor%27s%20Choice"><input
								type="button" value="Editor's Choice"
								style="width: 200px; height: 40px; color: white; background-color: #808080" /></a>
							<br> <a
							href="/newisai/movies.jsp?action=playlist&artist=Monthly"><input
								type="button" value="Mostly Listened(Monthly)"
								style="width: 200px; height: 40px; color: white; background-color: #808080" /></a><br>
							<a
							href="/newisai/movies.jsp?action=userplaylist&artist=Music @ Work"><input
								type="button" value="Music @ work"
								style="width: 200px; height: 40px; color: white; background-color: #808080" /></a>
							<br> <a
							href="/newisai/movies.jsp?action=userplaylist&artist=Thathuva Padalgal"><input
								type="button" value="Thathuva Padalgal"
								style="width: 200px; height: 40px; color: white; background-color: #808080" /></a>
							<br> <a
							href="/newisai/movies.jsp?action=userplaylist&artist=Kuthu Paattu"><input
								type="button" value="Kuthu Pattu"
								style="width: 200px; height: 40px; color: white; background-color: #808080" /></a>
							<br> <a
							href="/newisai/movies.jsp?action=userplaylist&artist=Kadhal Padalgal"><input
								type="button" value="Kathal Padalgal"
								style="width: 200px; height: 40px; color: white; background-color: #808080" /></a>
							<br> <a
							href="/newisai/movies.jsp?action=userplaylist&artist=Duet Songs"><input
								type="button" value="Duet Songs"
								style="width: 200px; height: 40px; color: white; background-color: #808080" /></a>

							<br> <a
							href="/newisai/movies.jsp?action=userplaylist&artist=Solo Songs"><input
								type="button" value="Solo Songs"
								style="width: 200px; height: 40px; color: white; background-color: #808080" /></a>

							<br> <a
							href="/newisai/movies.jsp?action=userplaylist&artist=Soga Padalgal"><input
								type="button" value="Soga Padalgal"
								style="width: 200px; height: 40px; color: white; background-color: #808080" /></a>

							<br> <a
							href="/newisai/movies.jsp?action=userplaylist&artist=Devotional Songs"><input
								type="button" value="Devotional Songs"
								style="width: 200px; height: 40px; color: white; background-color: #808080" /></a>

							<br> <a
							href="/newisai/movies.jsp?action=userplaylist&artist=Midnight Masala"><input
								type="button" value="Midnight Masala"
								style="width: 200px; height: 40px; color: white; background-color: #808080" /></a>
							<br>
						</b>

					</center>
				</body>

			</div>
		</section>
	</aside>
</div>

<div id="content">

	<article class="post clearfix">
		<header>
			<h1 class="post-title">
				<a href="#">New Release(s)</a>
			</h1>
			<p class="post-meta">
				<time class="post-date" datetime="2013-06-08" pubdate> </time>

			</p>
		</header>
		<!--Slider  -->

		<div id="main">
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
						<c:set var="count" value="0" scope="page" />

						<c:forEach items="${img2}" varStatus="status" var="slide"
							begin="0" end="5">
							<li><h2>
									<a
										href="/newisai/movies.jsp?action=playlist&artist=<c:out value="${slide.moviename}"/>"><img
										src="<c:out value="${slide.image}"/>" /></a>
									<c:out value="${slide.moviename}" />
								</h2></li>
							<c:set var="count" value="${count + 1}" scope="page" />

						</c:forEach>
					</ul>
				</div>
			</section>



		</div>

	</article>

</div>
<div id="pagewrap">
	<%@include file="footer.jsp"%>
</div>
</body>
</html>