<%
    if (session.getAttribute("userid") == null || session.getAttribute("userid").toString().trim().isEmpty()) {
%>
    You are not logged in.<br/>
    <a href="index.jsp">Please Login</a>
<%
    } else {
%>
    Welcome <%= session.getAttribute("userid") %>!<br/>
    <a href='logout.jsp'>Log out</a>
<%
    }
%>