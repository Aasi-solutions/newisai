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

	<%@include file="header.jsp" %>

<div id="pagewrap">
	<aside id="sidebar">
		<section class="widget1 clearfix">

			<h2 class="widgettitle"></h2>

			<div class="flexslider1">
				<ul class="slides1">
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Ilaiyaraaja"><img src="/newisai/images/Ilayaraja.jpg" title="Illayaraja"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=M%20S%20Viswanathan"><img src="/newisai/images/msv.jpg" title="M.S.Vishwanathan"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Gangai%20Amaran"><img src="/newisai/images/GangaiAmaran.jpg" title="Gangai Amaran"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Kunnakudi%20Vaidhyanathan"><img src="/newisai/images/kunnakudi.jpg" title="Kunnakudi Vaidhiyanathan"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Deva"><img src="/newisai/images/Deva.jpg" title="Deva"></a></li>
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
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=A%20R%20Rahman"><img src="/newisai/images/AR-Rahman.jpg" title="A.R.Rahman"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Yuvan%20Shankar%20Raja"><img src="/newisai/images/yuvan-shankar-raj.jpg" title="Yuvan Shankar Raja"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=G%20V%20Prakash"><img src="/newisai/images/gv-prakash.jpg" title="G.V.Prakash"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=D%20Imman"><img src="/newisai/images/imman-vijay.jpg" title="D.Imman"></a></li>
				<li type ="none"><a href="http://imayam.org/newisai/movies.jsp?action=playlist&artist=Anirudh"><img src="/newisai/images/anirudh.jpg" title="Anirudh"></a></li>
		
				</ul>
				</div>
				</section>
				</aside>
				</div>




		<div id="pagewrap">

			<article class="post clearfix">
				<header>
					<center><h1 class="post-title" style="color: #8F3801;">Composer List</h1></center>
				</header>
				<div id="pagewrap">
				<section>
				<h3><center>
<a id="a" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	A</font></a>
<a id="b" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	B</font></a>
<a id="c" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	C</font></a>
<a id="d" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	D</font></a>
<a id="e" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	E</font></a>
<a id="f" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	F</font></a>
<a id="g" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	G</font></a>
<a id="h" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	H</font></a>
<a id="i" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	I</font></a>
<a id="j" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	J</font></a>
<a id="k" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	K</font></a>
<a id="l" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	L</font></a>
<a id="m" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	M</font></a>
<a id="n" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	N</font></a>
<a id="o" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	O</font></a>
<a id="p" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	P</font></a>
<a id="q" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	Q</font></a>
<a id="r" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	R</font></a>
<a id="s" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	S</font></a>
<a id="t" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	T</font></a>
<a id="u" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	U</font></a>
<a id="v" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	V</font></a>
<a id="w" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	W</font></a>
<a id="x" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	X</font></a>
<a id="y" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">   Y</font></a>
<a id="z" onclick="getinComposer(id);" href="javascript:void(0);" ><font color="#000000">	Z</font></a>
</center></h3>
				<div id="placeholder"><center>
					  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
       <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.0.rc.1/handlebars.min.js"></script>
       <script id="myTemplate" type="text/x-handlebars-template">
  		{{#composers}}

		<center><li type="none"> <a class="ex2" href='/newisai/movies.jsp?action=playlist&artist={{composer}}'>{{composer}}</a></li></center>
		{{/composers}}

{{#composers1}}

		<center><li type="none"> {{composer}}</li></center>
		{{/composers1}}

</script> 
</center>
</section>
</div>
    	  <script type="text/javascript"> 
			var source = document.getElementById("myTemplate").innerHTML;
            var template = Handlebars.compile(source);
            function getinComposer(id){
           $.get('/newisai/main?action=composer&id='+id+'',function(responseJson) {
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