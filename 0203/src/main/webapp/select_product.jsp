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
	<h4>상품별 판매액</h4>
	<table border = "1">
		<tr>
			<td>상품코드</td>
			<td>상품명</td>
			<td>상품별판매액</td>
		</tr>
	<%
	Connection conn = null;
	Statement stmt = null;
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "select p.pcode as 상품코드, p.name as 상품명, " +
					 "TO_CHAR(sum(s.amount * p.cost), '999,999,999,999') as 상품별판매액 " +
					 "from tbl_product_01 p, tbl_salelist_01 s " +
					 "where p.pcode = s.pcode " +
					 "group by p.pcode, p.name ";
		ResultSet rs = stmt.executeQuery(sql); 
		while(rs.next()){
%>
	<tr>
		<td><%= rs.getString("상품코드") %></td>
		<td><%= rs.getString("상품명") %></td>
		<td><%= rs.getString("상품별판매액") %></td>
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