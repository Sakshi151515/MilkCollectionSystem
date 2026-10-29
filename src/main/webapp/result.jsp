<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Saved All Records</title>
</head>
<body>

<%
String name = request.getParameter("name");
String litres = request.getParameter("litres");
String fat = request.getParameter("fat");
String rate = request.getParameter("rate");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/milk_collection",
    "root",
    "root123"
);
if (name != null) {
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO milk_collection (Supplier, Litres, Fat, Rate) VALUES (?, ?, ?, ?)"
    );
    ps.setString(1, name);
    ps.setDouble(2, Double.parseDouble(litres));
    ps.setDouble(3, Double.parseDouble(fat));
    ps.setDouble(4, Double.parseDouble(rate));
    ps.executeUpdate();
    ps.close();
}
%>
<h2 align="center">Saved All Records</h2>
<table border="1" align="center" cellpadding="8">
<tr>
    <th>ID</th>
    <th>Supplier</th>
    <th>Litres</th>
    <th>Fat</th>
    <th>Rate</th>
</tr>
<%
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM milk_collection");
while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getDouble(3) %></td>
    <td><%= rs.getDouble(4) %></td>
    <td><%= rs.getDouble(5) %></td>
</tr>
<%
}
rs.close();
st.close();
con.close();
%>
</table>
<p align="center">
    <a href="index.html">Add another record</a>
</p>
</body>
</html>