<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ include file="jdbc.jsp" %>

<html>
<head>
<title>YOUR NAME Grocery Shipment Processing</title>
</head>
<body>

<%@ include file="header.jsp" %>

<%
	try{
		getConnection();
		Statement stmt = con.createStatement();
		// TODO: Get order id
		String orderId = request.getParameter("orderId");
		
		// TODO: Check if valid order id
		int id = -1;
		try{
			id = Integer.parseInt(orderId);
		}
		catch(Exception e){
			out.println("invalid order id: " + orderId);
		}
		
		// TODO: Start a transaction (turn-off auto-commit)
		con.setAutoCommit(false);
		
		// TODO: Retrieve all items in order with given id
		String sql = "SELECT * FROM orderproduct WHERE orderId = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		String sql_insert = "INSERT INTO shipment (shipmentDate, warehouseId) VALUES (?, 1)";
		pstmt = con.prepareStatement(sql_insert);
		boolean success = true;
		int productId = -1;
		int productQty = -1;
		while(rs.next()){
			productId = rs.getInt("productId");
			productQty = rs.getInt("quantity");
			// TODO: Create a new shipment record.
			pstmt = con.prepareStatement(sql_insert, Statement.RETURN_GENERATED_KEYS);
			java.util.Date utilDate = new java.util.Date();
    		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			pstmt.setDate(1, sqlDate);
			pstmt.executeUpdate();
			ResultSet keys = pstmt.getGeneratedKeys();
			keys.next();
			int shipmentId = keys.getInt(1);
			// TODO: For each item verify sufficient quantity available in warehouse 1.
			sql = "SELECT quantity FROM productinventory WHERE productId = ? AND warehouseId = 1";
			PreparedStatement pstmt1 = con.prepareStatement(sql);
			pstmt1.setInt(1, productId);
			ResultSet rs1 = pstmt1.executeQuery();
			int inven_qty = 0;
			if(rs1.next())
				inven_qty = rs1.getInt("quantity");
			
			if(inven_qty >= productQty){
				int newInvenQty = inven_qty - productQty;
				pstmt = con.prepareStatement("UPDATE productinventory SET quantity = ? WHERE productId = ? AND warehouseId = 1");
				pstmt.setInt(1, newInvenQty);
				pstmt.setInt(2, productId);
				pstmt.executeUpdate();
				// print out productinventory summary
				out.println("<h3>Ordered product: "+productId + " qty: " + productQty);
				ResultSet qtyRs = stmt.executeQuery("SELECT quantity FROM productinventory WHERE productId = "+productId+" AND warehouseId = 1");
				qtyRs.next();
				int newQty = qtyRs.getInt("quantity");
				out.print(" Old inventory: "+ inven_qty);
				out.println(" New inventory: " + newQty + "</h3>");
			}
			else{
				// TODO: If any item does not have sufficient inventory, cancel transaction and rollback. Otherwise, update inventory for each item.
				success = false;
				break;
			}
		}
		if(success){
			con.commit();
			out.println("<h2>Shipment successfully processed.</h2>");
		}
		else{
			con.rollback();
			out.println("<h2><b>Shipment is not done. Insufficient inventory for product id: "+productId+"</b></h2>");
		}
		// TODO: Auto-commit should be turned back on
		con.setAutoCommit(true);

		// output shipment summary to web page
		//ResultSet shipments = stmt.executeQuery("SELECT * FROM shipment");
		//while(shipments.next()){
		//	out.println("<h3>shipmentId: "+shipments.getInt(1));
		//	out.println(" "+shipments.getString(2));
		//	out.println(" "+shipments.getString(3));
		//	out.println(" "+shipments.getInt(4)+"</h3>");
		//}
	}
	catch(SQLException e){
		out.println(e); con.rollback();
	}
	finally{
		closeConnection();
	}
%>                       				

<h2><a href="shop.html">Back to Main Page</a></h2>

</body>
</html>
