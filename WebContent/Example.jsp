<!doctype html>
<% 
String playString = "";
String search="";
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
   <script src="/newisai/js/jquery-1.4.2.min.js"></script>
 <script src="/newisai/js/jquery.autocomplete.js"></script>

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

<body>

	<div id="pagewrap">

		<header id="header">

			<hgroup>
				<h1 id="site-logo">
					<a href="#">Imayam</a>
				</h1>
				<h2 id="site-description">Your favorite Songs</h2>
			</hgroup>

			<nav>
				<ul id="main-nav" class="clearfix">
					<li><a href="/newisai/homepage.jsp">Home</a></li>
					<li><a href="/newisai/songs.jsp">Songs</a></li>
					<li><a href="http://imayam.org">New Arrivals</a></li>
					<li><a href="/newisai/wall.jsp">Wall of Fame</a></li>

				</ul>
				<!-- /#main-nav -->
			</nav>		
		<form id="searchform">
				<input type="text" id="s" name="searchartist" placeholder="Search by Music Director,lyrics,artist...">
					<input type="hidden" name="action" value="search"  >
			</form>      

		<script>
 
  jQuery( $(function() {
		$('#s').autocomplete('/newisai/auto');
	 }));
    </script>
    
		</header>
		<!-- /#header -->

		<div id="content">

			<article class="post clearfix">

				<header>
					<h1 class="post-title">
						<a href="#">New Release(s)</a>
					</h1>
				<p class="post-meta">
						<time class="post-date" datetime="2013-06-08" pubdate>Last Updated June
							8, 2013</time>
					
					</p>
				</header>

				<div id="main">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li><img
									src="http://www.indiancinemagallery.com/Gallery2/d/1008063-1/Thalaiva+Movie+Stills+_1_.jpg" />
								</li>
								<li><img
									src="http://images.behindwoods.com/photo-galleries-q1-09/tamil-photo-gallery/anna-kodiyum-kodi-veeranum-01/wmarks/anna-kodiyum-kodi-veeranum-0102.jpg" />
								</li>
								<li><img
									src="http://www.moviexpress.com/wp-content/uploads/2013/06/thbaner.jpg" />
								</li>
								<li><img
									src="http://1.bp.blogspot.com/-cBMmM3MYUAk/Ub7RIw82fyI/AAAAAAAAIuA/rHtAVTAWDn0/s1600/225837_672955576063764_1616743814_n.jpg" />
								</li>
							</ul>
						</div>
					</section>



				</div>


				<h2>Song Categories</h2>
			<div id="main" class="widget">
			
			<ul>
			
			<li>
			<a href="/newisai/homepage.jsp?action=playlist&artist=NewAdds">New Additions</a>
			</li>
			
			<li>
			<a href="/newisai/homepage.jsp?action=userplaylist&artist=Editor%27s%20Choice">Editor's Choice</a>
			</li>
			
			<li>
			<a href="/newisai/homepage.jsp?action=userplaylist&artist=Music @ Work">Music @ work</a>
			</li>
			<li>
			<a href="/newisai/homepage.jsp?action=userplaylist&artist=Thathuva Padalgal">Thathuva padalgal</a>
			</li>
			
			<li>
			<a href="/newisai/homepage.jsp?action=userplaylist&artist=Kuthu Paattu">Kuthu pattu</a>
			</li>
			
			<li>
			<a href="/newisai/homepage.jsp?action=userplaylist&artist=Kadhal Padalgal">Kathal padalgal</a>
			</li>
		
			
			<li>
			<a href="/newisai/homepage.jsp?action=userplaylist&artist=Duet Songs">Duet Songs</a>
			</li>
			
			<li>
			<a href="/newisai/homepage.jsp?action=userplaylist&artist=Solo Songs">Solo Songs</a>
			</li>
			
			<li>
			<a href="/newisai/homepage.jsp?action=userplaylist&artist=Soga Padalgal">Soga Padalgal</a>
			</li>
			
			<li>
			<a href="/newisai/homepage.jsp?action=userplaylist&artist=Devotional Songs">Devotional Songs</a>
			</li>
			
		
			
			<li>
			<a href="/newisai/homepage.jsp?action=userplaylist&artist=Midnight Masala">Midnight Masala</a>
			</li>
			</ul>
			
			<%
 if ("playlist".equalsIgnoreCase(userAction)) { 
	 
	    playString = "/newisai/music?action=playRssSong"+artist;
	    } 
 else if ("userplaylist".equalsIgnoreCase(userAction)) { 
				 
			    playString = "/newisai/music?action=customRssPlayList"+artist;
			    }
 else if ("search".equalsIgnoreCase(userAction)) { 
		  playString = "/newisai/music?action=search" + searchartist;
 }
 %>
 
 <% if (userAction != null) { %>
 <script src="/newisai/jwplayer/jwplayer.js"></script>
    <script>jwplayer.key="vgS1BfSqLpSK6cgafU71a1u27g0QipZEbQ1dfQ=="</script>
            <div id="myElement"></div>
            <script type="text/javascript">
                jwplayer("myElement").setup({
                height: 500,
                playlist:"<%= playString %>",
                primary: "flash",
                width: 400,
                autostart: true,
            	listbar: {
                    	position: "bottom",
                    	size: 250
                  }
            });
            </script>	
 			
   <% } %>
			

			
			
			</div>
				<!-- /.video -->

			
				<!-- /.video -->

			</article>
			<!-- /.post -->

		</div>
		<!-- /#content -->



		<aside id="sidebar">

			<!-- 
	<section class="widget">
			<h4 class="widgettitle">Quick View</h4>
			<ul>
				<li><a href="#">New Additions</a> (3)</li>
				<li><a href="#">Editors Choice</a> (23)</li>
				<li><a href="#">Music @ Work</a>(18)</li>
			</ul>
		</section>
 -->


		<!-- 	<section class="widget clearfix">
				<h4 class="widgettitle">Frequently Listened</h4>
				<script type="text/javascript"
					src="http://www.flickr.com/badge_code_v2.gne?count=8.&display=latest&size=s&layout=x&source=user&user=52839779@N02"></script>
			</section> -->

<section  class="widget clearfix">
			<h4 class="widgettitle">Frequently Listened</h4>
	 
 <div class="flexslider1">
  <ul class="slides1">
            <li>
  	    	    <img src="http://www.indiancinemagallery.com/Gallery2/d/1008063-1/Thalaiva+Movie+Stills+_1_.jpg" />
  	    		</li>
  	    		<li>
  	    	    <img src="http://images.behindwoods.com/photo-galleries-q1-09/tamil-photo-gallery/anna-kodiyum-kodi-veeranum-01/wmarks/anna-kodiyum-kodi-veeranum-0102.jpg" />
  	    		</li>
  	    		<li>
  	    	    <img src="http://www.moviexpress.com/wp-content/uploads/2013/06/thbaner.jpg" />
  	    		</li>
  	    		<li>
  	    	    <img src="http://1.bp.blogspot.com/-cBMmM3MYUAk/Ub7RIw82fyI/AAAAAAAAIuA/rHtAVTAWDn0/s1600/225837_672955576063764_1616743814_n.jpg" />
  	    		</li>
  	    	
  	    		
          </ul>
     </div>
</section>
						
		</aside>

		<!-- /#sidebar -->

		<footer id="footer">

			<p>
				<a href="http://imayam.org">Imayam</a>
			</p>

		</footer>
		<!-- /#footer -->

	</div>

</body>
</html>