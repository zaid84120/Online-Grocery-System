<!DOCTYPE html>
<html>
<head>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: #111;
}

.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
<TITLE>Category Modified</TITLE>
</head>
<BODY>
<link rel="stylesheet" type="text/css" href="prac.css">


	<CENTER> 	
<font size=8>Online Grocery Shop Management System </font size=8> 
	</CENTER> 
<br>
<ul>
  <li><a class="active" href="Admin.html">Home</a></li>
  <li><a href="Logout.jsp">Logout</a></li>
<li><a href="Admin.html">Back</a></li>
  <div class="dropdown">
    <a href="#" class="dropbtn">Product</a>
    <div class="dropdown-content">
      <a href="Insert.jsp">Insert</a>
      <a href="Modify.jsp">Modify</a>
      
    </div>
</div>

 <div class="dropdown">
    <a href="#" class="dropbtn">Category</a>
    <div class="dropdown-content">
      <a href="Insert_Category.jsp">Insert</a>
      <a href="Update_Category.jsp">Modify</a>
	
  </div>
  </div>

<div class="dropdown">
    <a href="#" class="dropbtn">Details</a>
    <div class="dropdown-content">
      <a href="cust.jsp">View Customer</a>
      <a href="report.jsp">View all Report</a>
<a href="current.jsp">View current Report</a>
  </div>
  </div>
  </ul>


<center>
	<H1>Category Modified</H1>
	</CENTER>
	

	<script language="Javascript">
	function sel_click()
	{
		var f = document.modcat;
		var i=f.cat.selectedIndex;
		var str=f.cat.options[i].text;
		document.modcat.vr_cat.value=str;
		document.modcat.cat_val.value=document.modcat.elements[0].value;
	}
	</script>

	<%@ page errorPage="errorpage.jsp" import="java.net.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
	<%
		Connection con = null;
		
		PreparedStatement stat = null;
		ResultSet rs = null;
		String query=null;
		try
		{
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres","");  
	
		query="select * from category_details";
		stat = con.prepareStatement(query);
	
		rs=stat.executeQuery();
	%>
		<br><h2>Modify Category:</h2>
		<form name="modcat" action="ModifyCategory.jsp">
		<table border=1>
		<tr>
		<td>Category</td>
		<td><select size="1" name="cat" onChange="sel_click();">
			<%
			while(rs.next())
			{%>
    			<option value="<%=rs.getString(1)%>">
			<%=rs.getString(2)%></option>
  			<%}%>
    			</select></td>
		</tr>
		<tr>
<td colspan=2><input type="text" name="vr_cat"><input type="text" name="cat_val"></td>
		<tr>
<td><input type="submit" value="   Modify  "></td><td><input type="Reset" value="   Clear    ">
</td>
		</table>
</form>
	<%
		}
		catch(Exception e)
		{
		//	out.print("Error = " + e + "<HR>");
		}
		finally
		{
			rs.close();
			con.close();	
		}
	%>
</BODY>
</HTML>
