<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-45801581-1', 'imayam.org');
  ga('send', 'pageview');

</script>
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
<link rel="stylesheet" href="/resources/demos/style.css" />
<script defer src="jquery.flexslider.js"></script>



   
 <head>
 <script src="/newisai/js/jquery-1.4.2.min.js"></script>
				<script src="/newisai/js/jquery.autocomplete.js"></script>
  

 </head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<body>
<div id="pagewrap">
 <header id="header">
 
			<hgroup>
               <h1 id="site-logo">Imayam</h1>
			</hgroup>
<h4>

<div style ="text-align:right";>
<a href="/newisai/login.jsp"><font color="#000000">Login |</font></a>
<a  href="#" onclick="Popup=window.open('/newisai/NewPlaylist.jsp','Popup','toolbar=no,location=yes,status=yes,menubar=no,scrollbars=yes,resizable=yes,widhth=520,height=400,left=430,top=80');false;"><font color="#000000">Register</font></a>
</div>
</h4>
			<nav>
				<ul id="main-nav" class="clearfix">
					<li><a class="ex2" href="/newisai/main">Home</a></li>
					<li><a class="ex2" href="/newisai/songs.jsp">Songs</a></li>
					<li><a class="ex2" href="/newisai/newarrivals.jsp">New Arrivals</a></li>
					<li><a class="ex2" href="/newisai/wall.jsp">Wall of Fame</a></li>
					<li><a class="ex2" href="/newisai/Contact.jsp">Contact Us</a></li>
					<li>
					</form>
					</li>
				</ul>
			</nav>
			<form id="searchform">
	 				<select name="option"  onchange= "go()"  id="wgtmsr" >
	 					<option>Select</option>
	 					<option value="song"  >song</option>
	 					<option value="movie" >movie</option>
					    </select>
						<form id="searchform" >
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
<title>Welcome User!!!</title>
</head>

<div id="pagewrap">
<%
final String message = (String) request.getAttribute ("message");
%>
<header class="post-title" style="color: #000000">
 <c:out value="${message}" /> </header>
 Please Check your Email and click the button to activate your Registration Completely!!!  
 </div>
</html>






