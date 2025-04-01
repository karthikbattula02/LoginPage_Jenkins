<%@ page import="java.sql.*" %>
<%
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");

    if (firstName == null || lastName == null || email == null || userName == null || password == null ||
        firstName.trim().isEmpty() || lastName.trim().isEmpty() || email.trim().isEmpty() ||
        userName.trim().isEmpty() || password.trim().isEmpty()) {
        out.println("All fields are required. <a href='register.jsp'>Try Again</a>");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "Karthik@02");

        // Check if username exists
        PreparedStatement checkUser = con.prepareStatement("SELECT * FROM user WHERE userName = ?");
        checkUser.setString(1, userName);
        ResultSet rs = checkUser.executeQuery();

        if (rs.next()) {
            out.println("<h3>Username already exists. <a href='register.jsp'>Try Again</a></h3>");
        } else {
            // Insert user
            PreparedStatement ps = con.prepareStatement("INSERT INTO user (firstName, lastName, email, userName, password) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, userName);
            ps.setString(5, password);
            ps.executeUpdate();

            response.sendRedirect("welcome.jsp");
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>