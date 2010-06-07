<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="guestbook.Greeting" %>
<%@ page import="guestbook.PMF" %>


<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<html>
<head>
<meta http-equiv="refresh" content="13" >
</head>
  <body bgcolor="D3F9BC" >
  <right><img src="http://code.google.com/appengine/images/appengine-noborder-120x30.gif"
alt="Powered by Google App Engine" /></right>

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>
<p>Xin chao, <%= user.getNickname() %>! (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
    } else {
%>
<p>Xin chao!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
với username của bạn để chat.</p>
<%
    }
%>

<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    String query = "select from guestbook.Greeting order by date desc range 0,5";
    List<Greeting> greetings = (List<Greeting>) pm.newQuery(query).execute();
    if (greetings.isEmpty()) {
%>
<p>Hiện không có messages nào.</p>

<%
    } else {
        for (Greeting g : greetings) {
            if (g.getAuthor() == null) {
%>
<p>Một anonymous đã viết:</p>
<%
            } else {
%>
<p><b><%= g.getAuthor().getNickname() %></b>:</p>
<%
            }
%>
<blockquote>
<div>
<textarea name = "show" rows= "3" cols=60" readonly="readonly">
<%= g.getContent() %>
</textarea>
</div>

</table>
</blockquote>
<% 
        }
    }
    pm.close();
%>

<form action="/sign" method="post">
    <div><textarea name="content" rows="3" cols="60"></textarea></div>
    <div><input type="submit" value="Gửi tin" /></div>
</form>

  </body>
</html>
