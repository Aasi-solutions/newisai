<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="stylev2.css" rel="stylesheet" type="text/css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload</title>
</head>
<body>
   
 <head>
 <script src="/newisai/js/jquery-1.4.2.min.js"></script>
				<script src="/newisai/js/jquery.autocomplete.js"></script>
  

 </head>
<body>
<div id="pagewrap">

 
			<hgroup>
               <h1 id="site-logo"><img src="/newisai/images/newwwwwwwwwwww.jpg" alt="some_text"></h1>
			</hgroup>
<h4>

<div style ="text-align:right";>
<a href="/newisai/login.jsp"><font color="#000000">Login |</font></a>
<a  href="/newisai/NewPlaylist.jsp"><font color="#000000">Register</font></a>
</div>
</h4>
<header id="header">
			<nav>
				<ul id="main-nav" class="clearfix">
					<li><a class="ex2" href="/newisai/main">Home</a></li>
					<li><a class="ex2" href="/newisai/songs.jsp">Collections</a></li>
					<li><a class="ex2" href="/newisai/newarrivals.jsp">New Arrivals</a></li>
					<li><a class="ex2" href="/newisai/wall.jsp">Wall of Fame</a></li>
					<li><a class="ex2" href="/newisai/Contact.jsp">Contact Us</a></li>
					<li>
					</form>
					</li>
				</ul>
			</nav>
			<form id="searchform" action="/newisai/movies.jsp" method="get" >
	 				<select name="option"  onchange= "go()"  id="wgtmsr" >
	 					<option>Select</option>
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
			<div id="pagewrap">
<center><h1><font color="blue">File Upload</font></h1></center>
</br></br>    
      <center><form method="post" name="f2" action="adminaction?action=uploadaction" enctype="multipart/form-data">
 <h2>  Enter Movie Name     : <input type="textbox"  name="fname" id="fid" ></h2></br>
     <h2>Select File to upload:
 <input type="file" name="uploadFile" style="font-face: 'Comic Sans MS'; font-size: medium; color: blue; background-color: #FFFFC0; border: 3pt ridge lightgrey" /> 
 <input type="submit" value="Upload" style="font-face: 'Comic Sans MS'; font-size: medium; color: teal; background-color: #FFFFC0; border: 3pt ridge lightgrey" /></br></br>      
 Or<font color="red">     GoTo Edit:</font>    <a href="/newisai/adminaction?action=adminedit">Edit</a> </form>
 </div>  </center>
</body>
</html>