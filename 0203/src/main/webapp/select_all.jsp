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
	<h4>판매현황</h4>
	<table border = "1">
		<tr>
			<td>비번호</td>
			<td>상품코드</td>
			<td>판매날짜</td>
			<td>매장코드</td>
			<td>상품명</td>
			<td>판매수량</td>
			<td>총판매액</td>
		</tr>
	<%
	Connection conn = null;
	Statement stmt = null;
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "select s.saleno as 비번호, s.pcode as 상품코드, " + 
					 "to_char(s.saledate, 'YYYY-MM-DD') as 판매날짜, " +
					 "s.scode as 매장코드, p.name as 상품명, s.amount as 판매수량, (p.cost * s.amount) as 총판매액 " +
					 "from tbl_product_01 p, tbl_salelist_01 s " + 
					 "where p.pcode = s.pcode ";
		ResultSet rs = stmt.executeQuery(sql); 
		while(rs.next()){
%>
	<tr>
		<td><%= rs.getString("비번호") %></td>
		<td><%= rs.getString("상품코드") %></td>
		<td><%= rs.getString("판매날짜") %></td>
		<td><%= rs.getString("매장코드") %></td>
		<td><%= rs.getString("상품명") %></td>
		<td><%= rs.getString("판매수량") %></td>
		<td><%= rs.getString("총판매액") %></td>
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