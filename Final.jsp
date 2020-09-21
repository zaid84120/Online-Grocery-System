<html>
<head>
<title>Order placed</title>
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

<body>
<link rel="stylesheet" type="text/css" href="prac.css">


	<CENTER> 	
<font size=8>Online Grocery Shop Management System </font size=8> 
	
</CENTER> 
<br>
<ul>
  <li><a class="active" href="home.html">Home</a></li>
<li><a class="active" href="Logout.jsp">Logout</a></li>
  
  </ul><br>
	<center><H1>Order Details</H1>
</center>
	<BR>
	<%@  page errorPage="errorpage.jsp" language="java"  import="java.sql.*,java.util.*,java.text.*"  %>
	
<%! 
int OrderID,price;
%>
<%
	
	String user_src=(String)session.getValue("user");
   	if (user_src!= null)
   	{
		try{
	   	Connection conn;
		conn=null;
		ResultSet rs=null;
		Class.forName("org.postgresql.Driver");
		conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres",""); 
				
		PreparedStatement stat1=null,stat_sel=null,stat_ins=null;
		
		OrderID=(int)(10000*Math.random()+1);
		price=Integer.parseInt((String)session.getValue("pPrice"));
		int counter=0;
		counter=Integer.parseInt((String)session.getValue("TotalSel"));

		int[] productid=new int[counter];
		int[] pk_quantity=new int[counter];
		int org_pkqty=0;
		int i=0;
		
		String ins_query="";
		String sel_qtyQuery="";
		String ins_qty="";		
		
		for(i=1;i<=counter;i++)
		{
			ResultSet rs_sql=null;
			if((String)session.getValue("chk_var"+i)!=null)
			{
				productid[i-1]=Integer.parseInt((String)session.getValue("chk_var"+i));
			}
			
			if((String)session.getValue("productqty"+i)!=null)
			{
				pk_quantity[i-1]=Integer.parseInt((String)session.getValue("productqty"+i));
			}	
			
			ins_query="INSERT INTO ORDER_DETAILS VALUES(?,?,?)";
			stat1=conn.prepareStatement(ins_query);
			stat1.setInt(1,OrderID);
			stat1.setInt(2,productid[i-1]);
			stat1.setInt(3,pk_quantity[i-1]);
			int rs_int=0;
			
			rs_int=stat1.executeUpdate();	
			sel_qtyQuery="SELECT QUANTITY FROM PRODUCT_DETAILS WHERE PRODUCTID = ?";
					

			
			stat_sel = conn.prepareStatement(sel_qtyQuery);			
			stat_sel.setInt(1,productid[i-1]);
			rs_sql=stat_sel.executeQuery();
			if(rs_sql.next())
			{
				org_pkqty=rs_sql.getInt(1);
			}
			rs_sql.close();
			String ns_qty="UPDATE PRODUCT_DETAILS SET QUANTITY=? WHERE PRODUCTID=?";
			stat_ins=conn.prepareStatement(ns_qty);
			
			stat_ins.setInt(1,org_pkqty-pk_quantity[i-1]);
			stat_ins.setInt(2,productid[i-1]);
			rs_int=stat_ins.executeUpdate();	
		

			}		
			}catch(Exception e){}



		%>
		<form name="newsrc"  method="POST">
		<BR><font size="3"><b>
		Your order has been successfully placed.
		<BR><BR>Order Number is : <%=OrderID%>
		<BR><BR>Total Amount is : <%=price%>
		<BR><BR>Date of Order is:
		<%
               
		out.println((new java.util.Date()).toLocaleString());
		%>
		<BR><BR>
	        Your Order will be delivered within next 3 working hours

		
<%
	
	String card_no=request.getParameter("Card");
	Connection con= null;
	Class.forName("org.postgresql.Driver");
	con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/shop","postgres","");  
	java.util.Date now = new java.util.Date();
	DateFormat df1 = DateFormat.getDateInstance(DateFormat.SHORT);
        String s1 = df1.format(now);			
	try
         {
        String str = "insert into order_table values(?,?,?,?)";
	PreparedStatement stat= con.prepareStatement(str);

	stat.setInt(1,OrderID);
	stat.setString(2,user_src);
	stat.setInt(3,price);
	stat.setString(4,s1);
	
	int x = stat.executeUpdate();
        
        }catch(Exception e){out.println(e); }
        
	}	
	else
	{
		response.sendRedirect("Unauthorised.htm");
	} 	

	%>	




</body>

</html>
