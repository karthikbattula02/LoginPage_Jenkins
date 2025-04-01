<%@ page import="java.sql.*" %>
<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");

    if (userName == null || password == null || userName.trim().isEmpty() || password.trim().isEmpty()) {
        out.println("Invalid input. <a href='index.jsp'>Try again</a>");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "Karthik@02");

        String sql = "SELECT * FROM user WHERE userName = ? AND password = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, userName);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("userid", userName);
            response.sendRedirect("success.jsp");
        } else {
            out.println("<h3>Invalid credentials. <a href='index.jsp'>Try again</a></h3>");
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>