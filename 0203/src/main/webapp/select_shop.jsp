<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header><jsp:include page="header.jsp"></jsp:include></header>
	<nav><jsp:include page="nav.jsp"></jsp:include></nav>
	
	<section>
	<h4>매장별 판매액</h4>
	<table border = "1">
		<tr>
			<td>매장코드</td>
			<td>매장명</td>
			<td>매장별판매액</td>
		</tr>
	<%
	Connection conn = null;
	Statement stmt = null;
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "select sh.scode as 매장코드 , sh.sname as 매장명, " +
					 "TO_CHAR(sum(s.amount * p.cost),'999,999,999,999') as 매장별판매액 " +
					 "from tbl_product_01 p, tbl_shop_01 sh, tbl_salelist_01 s " + 
					 "where p.pcode = s.pcode and sh.scode = s.scode " + 
					 "group by sh.scode, sh.sname ";
		ResultSet rs = stmt.executeQuery(sql); 
		while(rs.next()){
%>
	<tr>
		<td><%= rs.getString("매장코드") %></td>
		<td><%= rs.getString("매장명") %></td>
		<td><%= rs.getString("매장별판매액") %></td>
	</tr>
<%			
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	</table>
	</section>
	<footer><jsp:include page="footer.jsp"></jsp:include></footer>
</body>
</html>