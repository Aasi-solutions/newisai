<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<!doctype html>
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
<script src="/newisai/js/jquery-1.4.2.min.js"></script>
 <script src="/newisai/js/jquery.autocomplete.js"></script>
     <script src="/newisai/js/jquery-1.4.2.min.js"></script> 

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script defer src="jquery.flexslider.js"></script>




</head>
<%@include file="header.jsp" %>
<br>

<div id="pagewrap">


<center>
<section class="widget1 clearfix">
<h2>Contact Us :</h2>

<form name="f" action="main"> 

<table>
<tr>
 <td valign="top">
  <label for="enquiry_type"><b>Enquiry type *</b></label>
 </td>
<td valign="top">
<select  name="option" id="enquiry" onchange = "go()"  >
  <option value="-Select-">- Select -</option>
  <option value="Queries">Queries</option>
  <option value="Ideas">Ideas</option>
  <option value="Song Requests">Song Requests</option>
</select>

</td>
</tr>
<tr>
 <td valign="top">
  <label for="first_name"><b>First Name *</b></label>
 </td>
 <td valign="top">
  <input  type="text" name="first_name" maxlength="50" size="30">
 
 </td>
</tr>
 
<tr>
 <td valign="top">
  <label for="last_name"><b>Last Name *</b></label>
 </td>
 <td valign="top">
  <input  type="text" name="last_name" maxlength="50" size="30">
 </td>
</tr>
<tr>
 <td valign="top">
  <label for="email"><b>Email Address *</b></label>
 </td>
 <td valign="top">
  <input  type="text" name="email" maxlength="80" size="30">
 </td>
 
</tr>

<tr>
 <td valign="top">
  <label for="telephone"><b>Telephone Number</b></label>
 </td>
 <td valign="top">
  <input  type="text" name="telephone" maxlength="30" size="30">
 </td>
</tr>
<tr>
 <td valign="top">
  <label for="comments"><b>Comments *</b></label>
 </td>
 <td valign="top">
  <textarea  name="comments" maxlength="1000" cols="25" rows="6" placeholder="Type your message here...."></textarea>
 
 </td>
 
</tr>
<tr>
 <td colspan="2" style="text-align:center">
  <input type="submit" name="action" value="Submit"> 
 </td>
</tr>

<font color="#FF0000">  <c:out value="${message}" /></font>
  	 <%
final String message = (String) request.getAttribute ("message");
%>
</table>

</form>
</section>
</div>
</center>

<div id="pagewrap">
<%@include file="footer.jsp" %></div>
</body>
</html>