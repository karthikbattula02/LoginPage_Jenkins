<%@ page import="java.sql.*" %>
<%
    String userName = request.getParameter("uname");
    String password = request.getParameter("password");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/USER", "root", "Karthik@02");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM USER ");
        // Process the result set
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>