<HTML>
<HEAD>
<TITLE>Product Details Modified</TITLE>
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
</HEAD>

<BODY>
<link rel="stylesheet" type="text/css" href="prac.css">


	<CENTER> 	
<font size=8>Online Grocery Shop Management System </font size=8> 
	</CENTER> 
<br>
<ul>
  <li><a class="active" href="Logout.jsp">Logout</a></li>
  <li><a class="active" href="Modify_Product.jsp">Back</a></li>
 <li><a class="active" href="Admin.html">Admin Home</a></li>
<li><a class="active" href="Modify.jsp">Goto Modify</a></li>

  </ul><br>
	<HR>
	<BR>
	<BR>
	<%@ page errorPage="errorpage.jsp" import="java.net.*" %>
	<%@ page import="java.io.*" %>
	<%@ page import="java.sql.*" %>
	<%
		Connection con = null;
		//Statement stat = null;
		PreparedStatement stat = null;
		//Statement stat1 = null;
		PreparedStatement stat1 = null;
		ResultSet rs = null;

		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres",""); 
		
		
		int rs_int;
		int int_ProductID,int_CATEGORYID,int_PRICE,int_QUANTITY;
		
		String query=null;
		String str_TITLE,str_Company,str_Dealer,str_DESCRIPTION;

 		int_ProductID=Integer.parseInt(request.getParameter("productid"));
 		int_CATEGORYID=Integer.parseInt(request.getParameter("categoryid"));
 		str_TITLE=request.getParameter("title");
 		str_Company=request.getParameter("company");
 		str_Dealer=request.getParameter("dealer");
 		
 		int_PRICE=Integer.parseInt(request.getParameter("bprice"));
 		int_QUANTITY=Integer.parseInt(request.getParameter("bqty"));
 		str_DESCRIPTION=request.getParameter("bdesc");
 
 		
		query="update product_details set categoryid=?,title=?,company=?,dealer=?,price=?,quantity=?,description=? where productid=?";
		stat = con.prepareStatement(query);
		stat.setInt(1,int_CATEGORYID);
		stat.setString(2,str_TITLE);
		stat.setString(3,str_Company);
		stat.setString(4,str_Dealer);
		stat.setInt(5,int_PRICE);
		stat.setInt(6,int_QUANTITY);
		stat.setString(7,str_DESCRIPTION);
		stat.setInt(8,int_ProductID);
		
                rs_int=stat.executeUpdate();

		if (rs_int==1)
		{
			out.println("Product details for Product Id "+int_ProductID+"  successfully modified.");	
		}
		else
		{
			out.println("Sorry Transaction not Completed");
		}
 	%>
 	
</BODY>
</HTML>
