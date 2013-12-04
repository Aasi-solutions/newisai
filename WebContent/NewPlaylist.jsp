<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
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
                 <h1 id="site-logo"><img src="/newisai/images/newwwwwwwwwwww.jpg" alt="some_text"></h1>
			</hgroup>
			<div style ="text-align:right"><h4><font color="#000000">Already have an account?</font><a class="ex2" href="/newisai/login.jsp"><font color="#990000">    Login</font> </a></h4>
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

<form name="new" method="post" action="main" onsubmit="javascript:return validateForm();">
<div id="pagewrap">
	<aside id="sidebar5">
		<section class="widget1 clearfix">
<table>
<tr><td><h2><font color="#000000">Sign up for an imayam account</font></h2></td></tr>
</table>
<hr>
<!-- <input type="hidden" name="action" value="newuser" /> -->
<%
final String message = (String) request.getAttribute ("message");
%>

<table>
<tr><td><h3>Username *</h3></td>
<td><input type="text" name="name"/><br><span class="hint"><font color="#000000"> Please enter 5-10 letters</font><span class="hint-pointer">&nbsp;</span></span><br></td></tr>
<tr><td><h3> E-mail *</h3></td>
<td><input type="text" name="email" /><br><h4><span class="hint"><font color="#000000"></font><span class="hint-pointer"></span></span></h4></td></tr>

<tr><td><h3>Password *</h3></td>
<td><input type="password" name="pass"/><br><span class="hint"><font color="#000000"> Make it 5-10 letters</font><span class="hint-pointer">&nbsp;</span></span><br></td></tr>
</table><center>

</center> 
</form>
<center>
<font color="#FF0000"><c:out value="${message}" /></font><br/>

<input type="submit" name="action" value="Register" />

</center>

</form>
</div>

<br>
<div id="main">
<img src="/newisai/images/sigup.jpg" width="600" height="400" alt="some_text">
</div>
<br/>
<div id="pagewrap">
<%@include file="footer.jsp" %>	
</div>
</body>
</html>

