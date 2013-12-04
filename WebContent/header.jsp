
 <html>  
 <head>
 <script src="/newisai/js/jquery-1.4.2.min.js"></script>
				<script src="/newisai/js/jquery.autocomplete.js"></script>
  

 </head>
 <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-45801581-1', 'imayam.org');
  ga('send', 'pageview');

</script>
<body>

<div id="pagewrap">

 
			<hgroup>
              <h1 id="site-logo"><img src="/newisai/images/newwwwwwwwwwww.jpg" alt="some_text"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            
               </h1>
            		
			
<h4>

<div style ="text-align:right";>
<a href="/newisai/login.jsp"><font color="#000000">Login |</font></a>
<a href="/newisai/NewPlaylist.jsp"><font color="#000000">Register</font></a>
</div>
</h4>
</hgroup>
  &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  <div class="fb-like" data-href="http://imayam.org/newisai/main" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>

<header id="header">
			<nav>
				<ul id="main-nav" class="clearfix">
					<li><a class="ex2" href="/newisai/main">Home</a></li>
					<li><a class="ex2" href="/newisai/songs.jsp">Collections</a></li>
					<li><a class="ex2" href="/newisai/newarrivals.jsp">New Arrivals</a></li>
					<li><a class="ex2" href="/newisai/wall.jsp">Wall of Fame</a></li>
					<li><a class="ex2" href="/newisai/Contact.jsp">Contact Us</a></li>
				</ul>
			</nav>
			<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
			<!-- 
			<form id="searchform" action="/newisai/movies.jsp" method="get">
	 				<select name="option"  onchange= "go()"  id="wgtmsr" >
	 					<option>Select</option>
	 					<option value="song"  >song</option>
	 					<option value="movie" >movie</option>
					    </select>
					     <input type="text" id="s" name="searchartist"  placeholder="Select by Movie/Song...." >
						<input type="hidden" name="action" value="search">
					   
						
			</form> -->
			
			
			
		<form id="searchform" action="/newisai/movies.jsp" method="get" >
	 				<select name="option"  onchange= "go()"  id="wgtmsr" >
	 					<option></option>
	 					<option value="song"  >song</option>
	 					<option value="movie" >movie</option>
					    </select>
						<form id="searchform" action="/newisai/movies.jsp" method="get" >
			<input type="text" id="s" name="searchartist"  placeholder="Select by Movie/Song...." >
						<input type="hidden" name="action" value="search">
			
			</form>
		</form>
		

		
	<script>
	function go() {
		$.ajax({
       type: "POST",
       url: "/newisai/auto?action=drop",
    	
       data: ({
           variable : $(wgtmsr).val()
       })
   });
 }
jQuery( $(function() {
	
	$("#s").autocomplete("/newisai/auto?action=hid",$(function(){
	$("#s").flushCache();}));

}))

</script>
</header>
</div>
			
</body>
</html>