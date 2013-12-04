<!DOCTYPE html>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<%
	String playString = "";
	String userAction = (String) request.getParameter("action");
	String artist = (String) request.getParameter("artist");
%>
<html>
<head>
<meta charset="UTF-8">
<!-- disable iPhone inital scale -->
<meta name="viewport" content="width=device-width; initial-scale=1.0">

<title>Select by Movie</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>

<!-- main css -->
<link href="stylev2.css" rel="stylesheet" type="text/css">
<!-- media queries css -->
<link href="media-queries.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="flexslider.css" type="text/css"
	media="screen" />



</head>

<body>

	<%@include file="header.jsp"%>
<div >
<%
final String message = (String) request.getAttribute ("message");
%>

</h4></div>

	<div id="pagewrap">
		<aside id="sidebar">
			<section class="widget1 clearfix">

				<h2 class="widgettitle"></h2>

				<div class="flexslider1">
					<ul class="slides1">
						<li type="none"><a
							href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=S%20P%20Balasubramaniam"><img
								src="/newisai/images/Spb.jpg" title="S.P.Balasubramanam"></a></li>
						<li type="none"><a
							href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Chitra"><img
								src="/newisai/images/Chitra.jpg" title="Chitra"></a></li>
						<li type="none"><a
							href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=S%20Janaki"><img
								src="/newisai/images/S.Janaki.jpg" title="S.Janaki"></a></li>
						<li type="none"><a
							href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=P%20Susheela"><img
								src="/newisai/images/P.Susheela.jpg" title="P.Susheela"></a></li>
						<li type="none"><a
							href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=T%20M%20Sounderarajan"><img
								src="/newisai/images/Soundarajan.jpg" title="T.M.Soundarajan"></a></li>
					</ul>
				</div>
			</section>
		</aside>
	</div>


	<div id="pagewrap">
		<aside id="sidebar1">
			<section class="widget1 clearfix">

				<h2 class="widgettitle"></h2>

				<div class="flexslider1">
					<ul class="slides1">
						<li type="none"><a
							href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Vijay%20Yesudas"><img
								src="/newisai/images/VijayYesudas.jpg" title="Vijay Yesudas"></a></li>
						<li type="none"><a
							href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Shreya%20Ghoshal"><img
								src="/newisai/images/Shreya.jpg" title="Shreya Ghosal"></a></li>
						<li type="none"><a
							href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Anuradha%20Sriram"><img
								src="/newisai/images/Anuradha.jpg" title="Anuradha Sriram"></a></li>
						<li type="none"><a
							href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Chinmayee"><img
								src="/newisai/images/Chinmayi_Sripada.jpg"
								title="Chimayee Sripada"></a></li>
						<li type="none"><a
							href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Unnikrishnan"><img
								src="/newisai/images/Unnikrishnan.jpg" title="UnniKrishnan"></a></li>
					</ul>
				</div>
			</section>
		</aside>
	</div>






	<div id="pagewrap">
 
		<article class="post clearfix">

			<header>
				<center>
					<h1 class="post-title" style="color: #8F3801;">Artist List</h1>
				</center>
			</header>
			<div id="pagewrap">
				<section>
					<center>
					
					
						<h3>
							<a id="a" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> A</font></a>
								
								 <a id="b" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> B</font></a>
								
							<a id="c" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> C</font></a>
								
								 <a id="d" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> D</font></a>
								
							<a id="e" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> E</font></a>
								
								 <a id="f" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> F</font></a>
								
							<a id="g" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> G</font></a>
								
								 <a id="h" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> H</font></a>
								
							<a id="i" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> I</font></a> 
								
								<a id="j" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> J</font></a>
								
							<a id="k" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> K</font></a>
								
								 <a id="l" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> L</font></a>
								
							<a id="m" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> M</font></a>
								
								 <a id="n" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> N</font></a>
								
							<a id="o" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> O</font></a> 
								
								<a id="p" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> P</font></a>
								
							<a id="q" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> Q</font></a>
								
								 <a id="r" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> R</font></a>
								
							<a id="s" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> S</font></a> 
								
								<a id="t" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> T</font></a>
								
							<a id="u" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> U</font></a>
								
								 <a id="v" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> V</font></a>
								
							<a id="w" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> W</font></a>
								
								 <a id="x" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> X</font></a>
								
							<a id="y" onclick="getinArtist(id);" href="javascript:void(0);"><font
								color="#000000"> Y</font></a> 
								
								<a id="z" onclick="getinArtist(id);"
								href="javascript:void(0);"><font color="#000000"> Z</font></a>
								
						</h3>
					</center>
					<div id="placeholder">
						<center>
							Please Select Above

							<script src="http://code.jquery.com/jquery-latest.min.js"></script>
							<script type="text/javascript"
								src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.0.rc.1/handlebars.min.js"></script>
							<script id="myTemplate" type="text/x-handlebars-template">


  		{{#artists}}
		<center><li type="none"><a class="ex2" href='/newisai/movies.jsp?action=playlist&artist={{artist}}'>{{artist}}</a></center></li>   
<li type="none"><a class="ex2" href='/newisai/movies.jsp?action=playlist&artist={{json1}}'>{{json1}}</a></center></li>
		{{/artists}}

{{#artists1}}
	<center>{{artist}}</center></li>   
<li type="none">{{json1}}</li>
		{{/artists1}}

		  </script>
		 
		  
		 
						</center>
				</section>
			</div>
			<script type="text/javascript">
				var source = document.getElementById("myTemplate").innerHTML;
				var template = Handlebars.compile(source);
				function getinArtist(id) {
					$
							.get(
									'/newisai/main?action=artist&id=' + id + '',
									function(responseJson) {
										console.log(responseJson);

										document.getElementById("placeholder").innerHTML = template(responseJson);

									});
				}
			</script>



		</article>
	</div>

	<div id="pagewrap">
		<%@include file="footer.jsp"%></div>
</body>
</html>