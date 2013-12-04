<!DOCTYPE html>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>

<% 
String playString = "";
String userAction = (String) request.getParameter("action");
String artist = (String) request.getParameter("artist");
String searchartist = (String) request.getParameter("searchartist");
String search = (String) request.getParameter("search");
String display = "";
%>
<html>
<head>
<meta charset="UTF-8">
<!-- disable iPhone inital scale -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<% if (artist != null) { %>
	<title><%= artist %> : Imayam Tamil Songs</title>
<%} else if (searchartist != null){ %>
	<title><%= searchartist %> : Imayam Tamil Songs</title>
<%} else { %>
	<title>Imayam Tamil Songs</title>
<% } %>
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
		<br/>
		
		<div id="pagewrap">
<section class="widget1 clearfix" >
			<center><div style="FONT-SIZE: 20px;COLOR: #8F3801" class="post-title">Please select the below</div> </center>
	</center>
			

				<div id="moviepagination">
			
<a onclick="getNum();" href="javascript:void(0);" ><font color="#000000">	0-9</font></a> &nbsp &nbsp
<a id="a" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	A</font></a>
<a id="b" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	B</font></a>
<a id="c" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	C</font></a>
<a id="d" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	D</font></a>
<a id="e" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	E</font></a>
<a id="f" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	F</font></a>
<a id="g" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	G</font></a>
<a id="h" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	H</font></a>
<a id="i" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	I</font></a>
<a id="j" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	J</font></a>
<a id="k" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	K</font></a>
<a id="l" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	L</font></a>
<a id="m" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	M</font></a>
<a id="n" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	N</font></a>
<a id="o" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	O</font></a>
<a id="p" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	P</font></a>
<a id="q" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	Q</font></a>
<a id="r" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	R</font></a>
<a id="s" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	S</font></a>
<a id="t" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	T</font></a>
<a id="u" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	U</font></a>
<a id="v" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	V</font></a>
<a id="w" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	W</font></a>
<a id="x" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	X</font></a>
<a id="y" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	Y</font></a>
<a id="z" onclick="getData(id);" href="javascript:void(0);" ><font color="#000000">	Z</font></a>
</div>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div id="placeholder"></div> 
         <script src="http://code.jquery.com/jquery-latest.min.js"></script>
       <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.0.rc.1/handlebars.min.js"></script>
       <script id="myTemplate" type="text/x-handlebars-template">
  	<center>	{{#movies}}
		  <a href='/newisai/movies.jsp?action=playlist&artist={{movie}}'><img src={{image_file_name}} title="{{movie}}" width="100" height="100"  ></a>
		{{/movies}}
</center>
</script> <script type="text/javascript"> 
 var source = document.getElementById("myTemplate").innerHTML;
            var template = Handlebars.compile(source);
           function getNum(){
            $.get('/newisai/main?action=nummoviesrch',function (responseJson) {
            	console.log(responseJson);
              	document.getElementById("placeholder").innerHTML = template(responseJson);
      	});
           } 
        	 function getData(id){
                 $.get('/newisai/main?action=moviesrch&id='+id+'',function (responseJson) {
                 	console.log(responseJson);
                   	document.getElementById("placeholder").innerHTML = template(responseJson);
                 });
        	 }
    		  </script>
    		 
    		 
    		  <center>
<%
    		
    		if ("Add".equalsIgnoreCase(userAction)) { 
    			display = artist;
    		    playString = "/newisai/main?action=playRssSong"+artist;
    		    } 

    		  
    		           if ("playlist".equalsIgnoreCase(userAction)) { 
    		        	   display = artist;
	    playString = "/newisai/main?action=playRssSong"+artist;
	    } 

 else if ("userplaylist".equalsIgnoreCase(userAction)) { 
	 display = artist;
			    playString = "/newisai/main?action=customRssPlayList"+artist;
			    }
 else if ("search".equalsIgnoreCase(userAction)) {
	 display = searchartist;
		  playString = "/newisai/main?action=search" + searchartist;
 }
 %>
 
 <% if (userAction != null) { %><h1>
 
 
 <!-- "https://www.facebook.com/imayam.org?ref=hl" data-href= "<c:out value='${pageContext.request.requestURL}'/>"-->

<div style="FONT-SIZE: 20px;COLOR: #8F3801">You are listening to "<%= display %>"</div></h1>
 <header><script type="text/javascript">var switchTo5x=true;</script>
<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">stLight.options({publisher: "1d96bd5a-9296-49c6-8e16-5b754028fd11", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script></header>
<span class='st_sharethis_large' displayText='ShareThis'></span>
<span class='st_googleplus_large' displayText='Google +'></span>
<span class='st_facebook_large' displayText='Facebook'></span>
<span class='st_twitter_large' displayText='Tweet'></span>
<span class='st_linkedin_large' displayText='LinkedIn'></span>
<span class='st_email_large' displayText='Email'></span>
<span class='st_fblike_large' displayText='Facebook Like'></span>  
<form name="f1" action="main" >    		
    		<input type="submit" name="action" value="Add to my Library" class="textboxclass" />
    		    
    	<div class="fb-like" id="fb"  data-href= "<c:out value='${pageContext.request.requestURL}'/>" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true" ></div>
    		</form>
    		</center>
    		
 <center>
<br/>

 <script src="/newisai/jwplayer/jwplayer.js"></script>
    <script>jwplayer.key="vgS1BfSqLpSK6cgafU71a1u27g0QipZEbQ1dfQ=="</script>
            <div id="myElement"></div>
            <script type="text/javascript">
                jwplayer("myElement").setup({
                height: 400,
                playlist:"<%= playString %>",
                primary: "flash",
                width: 850,
                autostart: true,
            	listbar: {
                    	position: "right",
                    	size: 350
                  }
            });
            </script>
            </center>	  
<% } %>
			</article>
		</div>
	<footer id="footer">
	<div id="pagewrap">
	<%@include file="footer.jsp" %></div>	
	</footer>
</body>
</html>