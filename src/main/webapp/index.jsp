<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
</head>
<body bgcolor="silver">
    <form method="post" action="login.jsp">
        <center>
        <table border="0" width="30%" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="2">Login Page using Java & Jenkins </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="userName" required /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" required /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Login" /></td>
                    <td><input type="reset" value="Reset" /></td>
                </tr>
                <tr>
                    <td colspan="2">New User? <a href="register.jsp">Register Here</a></td>
                </tr>
            </tbody>
        </table>
        </center>
    </form>
</body>
</html>
