<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org   /TR/html4/loose.dtd">`
<html lang="en">
<head>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-45801581-1', 'imayam.org');
  ga('send', 'pageview');

</script>
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
<link rel="stylesheet" href="/resources/demos/style.css" />
<script defer src="jquery.flexslider.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to User Login Account!!!</title>
</head>
<body>
<script>
 String adminaction = (String) request.getparameter("adminaction");
 </script>
  <div id="pagewrap">
 
<hgroup>
                 <h1 id="site-logo"><img src="/newisai/images/newwwwwwwwwwww.jpg" alt="some_text">
                 
                 </h1>
			</hgroup>
			<div style ="text-align:right"><h4><font color="#000000">Don't you have an account?</font><a class="ex2"  href="/newisai/NewPlaylist.jsp"><font color="#990000">Sign Up</font> </a></h4>

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
           </header>
</div>

<br/>
<br/>			
 <div id="pagewrap">
	<aside id="sidebar3">
		<section class="widget1 clearfix">
		
					
<table>
<tr><td><h2 class="widgettitle">Welcome to User Login Account!!!</h2></td></tr>

</tr>
</table>
<hr>
<%
final String message = (String) request.getAttribute ("message");
%>
<h4><font color="#FF0000">
 <c:out value="${message}" /></font></h4>

<form name="form" method="post" action="adminaction">

<input type = "hidden" name="action" value="loginaction"/><br>
<table>
<tr><td><h4>Username:</h4></td>
<td><input type="text" name="user"></td></tr>

<tr><td><h4>Password:</h4></td>
<td><input type="password" name="pass"></td></tr>
</table><center>
<input type="submit" value="Login">
</center>
</form>
<a href="/newisai/forgotpass.jsp">Forgot Password?</a>
</section>
</aside>
</div>
<div id="main">
<img src="/newisai/images/login-image.jpg" alt="some_text">
</div>
 <div id="pagewrap">
<%@include file="footer.jsp" %>	
</div>

</body>
</html>