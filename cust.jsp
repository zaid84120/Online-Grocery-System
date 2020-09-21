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
</head>



<HTML>
<HEAD>
<TITLE>Customer Details</TITLE>
</HEAD>

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

	<H1>Customer Details</H1>
	</CENTER>
	
	<%@ page errorPage="errorpage.jsp" import="java.net.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
	<%
		Connection con = null;
		
		PreparedStatement stat = null;
			
		ResultSet rs = null;
		String query=null;
		int ctr=0;
		try
		{
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres",""); 
		
			
		query="Select * from User_Profile";
		stat = con.prepareStatement(query);
		
		rs=stat.executeQuery();
	%>
		<br><h3>List of Customers:</h3>
		<form name="Mod">
		<table border=1>
		<tr>
		<td>S.No</td>
		<td>First Name</td>
		<td>Middle Name</td>
		<td>Last Name</td>
		<td>Address 1</td>
		<td>Address 2</td>
		<td>City</td>
		<td>State</td>
		<td>PinCode</td>
		<td>Email</td>
		<td>Phone</td>
		</tr>
		<% 
		String str_FirstName,str_MiddleName,str_LastName,
str_Address1,str_Address2,str_City,str_State,str_PinCode,str_Email,str_Phone;
		while(rs.next())
		{
			ctr=ctr+1;
			out.println("<tr><td>"+ctr);
			
						
			str_FirstName=rs.getString(3);
			out.println("<td>");
			out.println(str_FirstName);
			
			str_MiddleName=rs.getString(4);
			out.println("<td>");
			out.println(str_MiddleName);
				
			str_LastName=rs.getString(5);
			out.println("<td>");
			out.println(str_LastName);
			
			
			str_Address1=rs.getString(6);
			out.println("<td>");
			out.println(str_Address1);
			
			str_Address2=rs.getString(7);
			out.println("<td>");
			out.println(str_Address2);

			str_City=rs.getString(8);
			out.println("<td>");
			out.println(str_City);

			str_State=rs.getString(9);
			out.println("<td>");
			out.println(str_State);
			
			str_PinCode=rs.getString(10);
			out.println("<td>");
			out.println(str_PinCode);

			str_Email=rs.getString(11);
			out.println("<td>");
			out.println(str_Email);

			out.println("<td>");
			out.println(rs.getString(12));
			
			out.println("</tr>");
		}
	%>
		
		</table>
		</form>
	<%
		}
		catch(Exception e)
		{
		out.print("Error = " + e + "<HR>");
	}
	%>
</BODY>
</HTML>
