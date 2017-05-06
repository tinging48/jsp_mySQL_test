<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.54.114" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="jspuser" />
  <jsp:setProperty property="user" name="database" value="jspuser" />
  <jsp:setProperty property="password" name="database" value="jspuser" />
</jsp:useBean>
<%
  database.connectDB();
  database.query("select * from travel;");
  ResultSet rs = database.getRS();
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
    <style>
        .card-header {
            font-size: 20px;
            font-weight: bold;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>

    <script>
        $(".button-collapse").sideNav();
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  </head>
  <body>
    <div class="navbar-fixed">
        <nav>
            <div class="nav-wrapper">
                <center>
                    <h style="font-size:25px;font-weight:bold;">旅遊景點</h>
                </center>
            </div>
        </nav>
    </div>
    <div class="row">
      <%
      if(rs!=null){
        while(rs.next()){
          String id = rs.getString("id");
          String name = rs.getString("name");
          String location = rs.getString("location");
          String desc = rs.getString("description");
          String createdAt = rs.getString("createdAt");
          String photo = rs.getString("photo");
      %>
      <div class="col s6">
        <div class="card horizontal">
          <div class="card-image" style="padding:2vh;">
            <img src="<%=photo%>" style="width:17vh;height:19vh;">
            </div>
            <div class="card-stacked">
              <div class="card-content">
                <h style="font-size:20px;font-weight:bold;"><%=name%></h>
                <p>地點：<%=location%></p>
                <p>建立於：<%=createdAt%></p>
              </div>
              <div class="card-action">
                <a href="detail.jsp?id=<%=id%>">詳細咨詢</a>
              </div>
            </div>
          </div>
        </div>
        <%}}%>
    </div>
  </body>
</html>
