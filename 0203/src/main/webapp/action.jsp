<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>
<% request.setCharacterEncoding("UTF-8"); 

	String saleno = request.getParameter("saleno");
	String pcode = request.getParameter("pcode");
	String saledate = request.getParameter("saledate");
	String scode = request.getParameter("scode");
	String amount = request.getParameter("amount");
	
	Connection conn = null;
	Statement stmt = null;
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "insert into tbl_salelist_01 values("+
				saleno+ ",'" + pcode +"', to_data('"+ saledate+ "', 'yyyy-mm-dd'), '"+ scode +"',"+ amount+")";
		stmt.executeUpdate(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("insert.jsp");
%>