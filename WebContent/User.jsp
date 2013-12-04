<!doctype html>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-45801581-1', 'imayam.org');
  ga('send', 'pageview');

</script>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
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
			<br>
			<br>
			<br>
			<br>
			<br>
			
			<header id="header">
			<nav>
				<ul id="main-nav" class="clearfix">
		 <li> <a class="ex2">Please select which song you want to delete</a></li></ul></nav></header>
<div id="pagewrap">
<div style ="text-align:right">

<%
final String mess = (String) request.getAttribute ("mess");
%>
<%
final String message = (String) request.getAttribute ("message");
%>
<center>
<table><tr>
<th>Movie_Name</th> 
		<th>Song_Name</th></tr>
	

 <tr><h4><font color="#FF0000"><c:out value="${message}" /></tr> 
 <tr><c:out value="${mess}" /></tr>
 </font></h4>
 
<form method="post" action="main" >

		<c:forEach items="${sessionScope.cid}" var="item" >
			<input type="hidden" name="id" value="<c:out value="${item.id}"></c:out>" />
				<!--<c:out value="${item.id}"></c:out>-->
				<tr>	
	<td><input type="text" name="movie"
						value="<c:out value="${item.movieName}" ></c:out>" /></td>
				<td><input type="text" name="song"
					value="<c:out value="${item.songName}"></c:out>" /></td>
				
	<td>			<input type="checkbox" name="chdel" id="ch"  value="<c:out value="${item.id}"></c:out>"/></td>
				
</c:forEach>
</tr>
</table>


<input type="submit" name="action" value="Confirm Delete"/> 
<a href="/newisai/main">Goto Home</a>

</form>


	</center>
	</div>
	</div>
	</div>
	
	
	<footer id="footer">
	<div id="pagewrap">
	<%@include file="footer.jsp" %></div>	
	</footer>
</body>
</html>