<!DOCTYPE html>
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
	  <script src="/newisai/js/jquery-1.4.2.min.js"></script>
				<script src="/newisai/js/jquery.autocomplete.js"></script>
	<%@include file="header.jsp" %>
	
	
	<div id="pagewrap">
	<aside id="sidebar1">
		<section class="widget1 clearfix">

			<h2 class="widgettitle"></h2>

			<div class="flexslider1">
				<ul class="slides1">
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Na%20Muthukumar"><img src="/newisai/images/Namuthu.jpg" title="Na Muthukumar"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Pa%20Vijay"><img src="/newisai/images/pa-vijay.jpg" title="Pa Vijay"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Thamarai"><img src="/newisai/images/Thamarai.jpg" title="Thamarai"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Viveka"><img src="/newisai/images/Viveka.jpg" title="Viveka"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Madhan%20Karky"><img src="/newisai/images/Madhan-Karky.jpg" title="Madhan Karky"></a></li>
		
				</ul>
				</div>
				</section>
				</aside>
				</div>	
				<div id="pagewrap">
	<aside id="sidebar">
		<section class="widget1 clearfix">

			<h2 class="widgettitle"></h2>

			<div class="flexslider1">
				<ul class="slides1">
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Vaali"><img src="/newisai/images/Vaali.jpg" title="Vaali"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Kannadasan"><img src="/newisai/images/kannadasan.jpg" title="Kannadasan"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Vairamuthu"><img src="/newisai/images/Vairamuthu.jpg" title="Vairamuthu"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Mu%20Metha"><img src="/newisai/images/mu metha.jpg" title="Mu Metha"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Pazhani%20Bharathi"><img src="/newisai/images/Pazhani bharathi.jpg" title="Pazhani Bharathi"></a></li>
				</ul>
				</div>
				</section>
				</aside>
				</div>
		<!-- /#header -->

		<div id="pagewrap">

			<article class="post clearfix">
				<header>
					<center><h1 class="post-title" style="color: #8F3801;">Lyricist List</h1></center>
					<div id="pagewrap">
					<section>
				<h3><center>
<a id="a" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	A</font></a>
<a id="b" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	B</font></a> 
<a id="c" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	C</font></a> 
<a id="d" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	D</font></a> 
<a id="e" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	E</font></a> 
<a id="f" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	F</font></a> 
<a id="g" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	G</font></a> 
<a id="h" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">   H</font></a> 
<a id="i" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	I</font></a> 
<a id="j" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	J</font></a> 
<a id="k" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	K</font></a> 
<a id="l" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	L</font></a> 
<a id="m" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	M</font></a> 
<a id="n" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	N</font></a> 
<a id="o" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	O</font></a> 
<a id="p" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	P</font></a> 
<a id="q" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	Q</font></a> 
<a id="r" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	R</font></a> 
<a id="s" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	S</font></a> 
<a id="t" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	T</font></a> 
<a id="u" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	U</font></a> 
<a id="v" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	V</font></a> 
<a id="w" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	W</font></a>
<a id="x" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	X</font></a> 
<a id="y" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">   Y</font></a> 
<a id="z" onclick="getinLyricist(id);" href="javascript:void(0);" ><font color="#000000">	Z</font></a> 
</center></h3>
<div id="placeholder"><center>Please Select Above</center><br/><br/>
					         <script src="http://code.jquery.com/jquery-latest.min.js"></script>
       <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.0.rc.1/handlebars.min.js"></script>
       <script id="myTemplate" type="text/x-handlebars-template">
  		{{#lyricists}}
		<center><li type="none"><a class="ex2" href='/newisai/movies.jsp?action=playlist&artist={{lyrics}}'>{{lyrics}}</a></li><center>
		{{/lyricists}}



{{#lyricists1}}
		<center><li type="none">{{lyrics}}</li><center>
		{{/lyricists1}}
</script>
</div>

    	  <script type="text/javascript"> 
			var source = document.getElementById("myTemplate").innerHTML;
            var template = Handlebars.compile(source);
            function getinLyricist(id){
            $.get('/newisai/main?action=lyricist&id='+id+'',function(responseJson) {
            	console.log(responseJson);
       	    document.getElementById("placeholder").innerHTML = template(responseJson);
         	});
            } 
      </script>
				
				
			</article>
		</div>
	<div id="pagewrap">
	<%@include file="footer.jsp" %></div>
</body>
</html>