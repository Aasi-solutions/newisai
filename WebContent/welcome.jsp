<!doctype html>

<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
    
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>


<!-- main css -->
<link href="stylev2.css" rel="stylesheet" type="text/css">

<!-- media queries css -->
<link href="media-queries.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="flexslider.css" type="text/css"
	media="screen" />



<div id="pagewrap">
 
<hgroup>
                 <h1 id="site-logo"><img src="/newisai/images/newwwwwwwwwwww.jpg" alt="some_text"></h1>
			</hgroup>

<div style ="text-align:right">

<%
String message = (String) request.getAttribute ("message");



String message2 = (String) request.getAttribute ("message2");

%>




<h4><font color="#000000">Welcome</font>


  <c:out value="${message}" /> 


<a href="/newisai/logout"><font color="#990000">Logout</font></h4></a></div>

<header id="header">
			<nav>
			<center>
				<ul id="main-nav" class="clearfix">
	
					<a href="/newisai/movies.jsp?action=userplaylist&artist=<%=message2 %>" class="ex2" title="Click here to play your songs">My Playlist</a>
					
				</ul></center>
			</nav>
	
	
	 
</script>
</header>		
			</div>
			<br><br>
			<div id="pagewrap">
			<img src="/newisai/images/baby.jpg" alt="some_text">
 


	<aside id="sidebar5">
		
<div>
	<table>
	<tr>
		
		
&nbsp<h2><th> Movie_Name:</th></h2>
		<h2><th>&nbsp Song_Name:</th></h2>
	</tr>
	
	<form method="post" action="main" >
		<c:forEach items="${sessionScope.userPlaylist}" var="item" >
		
		

			<tr><!--<c:out value="${item.id}"></c:out>-->
			
				<input type="hidden" name="id" value="<c:out value="${item.id}"></c:out>" />
				
				
				<td><input type="text" name="movie"
						value="<c:out value="${item.movieName}" ></c:out>" /></td>
				<td><input type="text" name="song"
					value="<c:out value="${item.songName}"></c:out>" /></td>
						<td> <input type="checkbox" name="ch" id="cid" checked="checked" value="<c:out value="${item.id}"></c:out>"/></td>
</tr>


</c:forEach>
</table>
<%
final String message1 = (String) request.getAttribute ("message1");
%>
<center><input type="submit" name="action" value="Add to my playlist" title="Click here to Add songs to your playlist" /><br>
 <input type="submit" name="action" value="Customize your Playlist" title="Click here to Delete songs from your playlist"/> </center>
</form>
<h4><font color="#FF0000"><c:out value="${message1}" /></font>&nbsp
</h4>
</div>

</nav>
</center>
</section>
</div>
<div id="pagewrap">
<%@include file="footer.jsp" %>	
</div>
		
</html>