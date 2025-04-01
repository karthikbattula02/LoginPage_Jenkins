<%@ page import="java.sql.*" %>
<%
    String userName = (String) session.getAttribute("userid");

    if (userName == null || userName.trim().isEmpty()) {
%>
    You are not logged in.<br/>
    <a href="index.jsp">Please Login</a>
<%
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "Karthik@02");

            // Fetch user details
            PreparedStatement ps = con.prepareStatement("SELECT firstName, lastName, email FROM user WHERE userName = ?");
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                String email = rs.getString("email");
%>
                <h2>Welcome, <%= firstName %> <%= lastName %>!</h2>
                <p><strong>Name:</strong> <%= firstName %> <%= lastName %></p>
                <p><strong>Username:</strong> <%= userName %></p>
                <p><strong>Email:</strong> <%= email %></p>
                <a href='logout.jsp'>Log out</a>
<%
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }
%>
