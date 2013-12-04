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
		<!-- /#header -->


		<div id="pagewrap">
<aside id="sidebar4">
<section class="widget1 clearfix" >
<center><h2>Famous Music Directors</h2></center>
			<section class="widget clearfix1">
		<div id="placeholder"></div> 
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
       <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.0.rc.1/handlebars.min.js"></script>
       
       <script id="myTemplate" type="text/x-handlebars-template">

<b><center>
{{#arrivals}}

 <a href='/newisai/movies.jsp?action=playlist&artist={{composer}}'>{{composer}} &nbsp; <img src={{image_file_name}} title="{{movie}}" width="100" height="100"  ><br></a>

		
		{{/arrivals}}

</b>
</h3></center>

</script>

 <!-- {{#arrivals}}
  <a href='/newisai/movies.jsp?action=playlist&artist={{composer}}{{movie}}'>{{composer}}{{movie}}
 <a href='/newisai/movies.jsp?action=playlist&artist={{movie}}'><img src={{image_file_name}} title="{{movie}}" width="100" height="100"  ></a>

		 
		{{/arrivals}}</td></tr><br> -->
    	  <script type="text/javascript"> 
			var source = document.getElementById("myTemplate").innerHTML;
            var template = Handlebars.compile(source);
         
            $.get('/newisai/main?action=arrival',function(responseJson) {
       	    document.getElementById("placeholder").innerHTML = template(responseJson);
         	});
      </script>
			</section>
				
			</article>
		</div><br><br>
		<br>
		<br><br>
		<article class="main">

<div id="pagewrap">
<img src="/newisai/images/wall.jpg">
</div>
</article>
	<div id="pagewrap">
	<%@include file="footer.jsp" %></div>
</body>
</html>