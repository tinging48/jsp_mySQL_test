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
  request.setCharacterEncoding("UTF-8");
  String p_name = request.getParameter("name");
  String p_id = request.getParameter("id");
  String p_photo = request.getParameter("photo");
  String p_location = request.getParameter("location");
  String p_description = request.getParameter("description");
  if(p_name != null && p_id != null && p_photo != null && p_location != null && p_description != null){
    database.connectDB();
    database.editData(p_id , p_name , p_location , p_photo , p_description);
  }
  database.query("select * from travel;");
  ResultSet rs = database.getRS();
%>
<!DOCTYPE html>
<html lang="zh-hant">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../plugins/images/favicon.png">
    <title>管理後台</title>
    <!-- Bootstrap Core CSS -->
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="css/colors/default.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="fix-header">
    <!-- ============================================================== -->
    <!-- Preloader -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Wrapper -->
    <!-- ============================================================== -->
    <div id="wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header">
                <div class="top-left-part">
                    <!-- Logo -->
                    <a class="logo" href="index.jsp"></a>
                    <h style="font-size:25px;">旅遊景點後台管理</h>

                </div>
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        <!-- End Top Navigation -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav slimscrollsidebar">
                <div class="sidebar-head">
                    <h3><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span> <span class="hide-menu">Navigation</span></h3>
                </div>
                <ul class="nav" id="side-menu">
                    <li style="padding: 70px 0 0;">
                        <a href="#" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>資料管理</a>
                    </li>
                  </ul>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Left Sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page Content -->
        <!-- ============================================================== -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">資料管理</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="#">後台管理系統</a></li>
                            <li class="active">資料管理</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title">資料表單</h3>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
                              新增資料
                            </button>
                             <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>名稱</th>
                                            <th>地點</th>
                                            <th>描述</th>
                                            <th>相片</th>
                                            <th>新增時間</th>
                                            <th>修改資料</th>
                                            <th>刪除資料</th>
                                        </tr>
                                    </thead>
                                    <tbody>
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
                                        <tr>
                                          <form id = "form<%=id%>" action="index.jsp" method="POST">
                                            <td><%=id%></td>
                                            <td id = "name<%=id%>"><%=name%></td>
                                            <td id = "location<%=id%>"><%=location%></td>
                                            <td id = "description<%=id%>"><%=desc%></td>
                                            <td id = "photo<%=id%>"><img id = "photoURL<%=id%>" src="<%=photo%>" width=50></td>
                                            <td><%=createdAt%></td>
                                            <td>
                                              <button type = "button" id = "edit<%=id%>" type="button" class="btn btn-primary">修改</button>
                                            </td>
                                            <td>
                                              <button id = "delete<%=id%>" type="button" class="btn btn-danger">刪除</button>
                                            </td>
                                          </form>
                                        </tr>
                                        <%}}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" style="display: none;">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <h4 class="modal-title" id="exampleModalLabel1">新增景點資料</h4> </div>
                            <div class="modal-body">
                                <form action="new.jsp" method="post">
                                  <div class="form-group">
                                    <label for="name" class="control-label">名稱</label>
                                    <input type="text" class="form-control" name="name">
                                  </div>
                                  <div class="form-group">
                                      <label for="location" class="control-label">地點</label>
                                      <input type="text" class="form-control" name="location">
                                  </div>
                                  <div class="form-group">
                                      <label for="description" class="control-label">描述</label>
                                      <input type="text" class="form-control" name="description">
                                  </div>
                                  <div class="form-group">
                                      <label for="photo" class="control-label">相片連結</label>
                                      <textarea class="form-control" name = "photo"></textarea>
                                  </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
                                    <input type="submit" class="btn btn-primary" value="新增景點">
                                  </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <footer class="footer text-center"> 2017 &copy; JSP 網頁程式設計範例</footer>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="../plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.min.js"></script>
    <script>
    $(document).ready(function(){
      $("button").on("click",function(){
        var clickText = $(this).text();
        switch (clickText) {
          case "修改":
              var id = $(this).attr("id").split("edit")[1];
              $("#name"+id).html('<input type="text" name="name" id="input_name'+id+'"value="'+$("#name"+id).text()+'"/>');
              $("#photo"+id).html('<input type="text" name="photo" id="input_photo'+id+'"value="'+$("#photoURL"+id).attr("src")+'"/>');
              $("#location"+id).html('<input type="text" name="location" id="input_location'+id+'"value="'+$("#location"+id).text()+'"/>');
              $("#description"+id).html('<input type="textarea" name="description" id="input_description'+id+'"value="'+$("#description"+id).text()+'"/>');
              $(this).attr("id","storeEdit"+id);
              $(this).html("儲存");
            break;
          case "儲存":
              var id = $(this).attr("id").split("storeEdit")[1];
              var name = $("#input_name"+id).val();
              var photo = $("#input_photo"+id).val();
              var location = $("#input_location"+id).val();
              var description = $("#input_description"+id).val();
              // $("#name"+id).html(name);
              // $("#photo"+id).html('<img id = "photoURL"'+ id +'src="'+photo+'" width=50>');
              // $("#location"+id).html(location);
              // $("#description"+id).html(description);
              // $(this).attr("id","edit"+id);
              // $(this).html("修改");
              var id_input = $("<input>").attr("type","hidden").attr("name","id").val(id);
              $("#form"+id).append(id_input);
              $("#form"+id).append($("#input_name"+id));
              $("#form"+id).append($("#input_photo"+id));
              $("#form"+id).append($("#input_location"+id));
              $("#form"+id).append($("#input_description"+id));
              $("#form"+id).submit();
            break;
          case "刪除":
              var id = $(this).attr("id").split("delete")[1];
              var id_input = $("<input>").attr("type","hidden").attr("name","id").val(id);
              var name_input = $("<input>").attr("type","hidden").attr("name","name").val($("#name"+id).text());
              var photo_input = $("<input>").attr("type","hidden").attr("name","photo").val($("#photoURL"+id).attr("src"));
              var location_input = $("<input>").attr("type","hidden").attr("name","location").val($("#location"+id).text());
              var description_input = $("<input>").attr("type","hidden").attr("name","description").val($("#description"+id).text());

              $("#form"+id).attr("action","delete.jsp");
              $("#form"+id).append(id_input);
              $("#form"+id).append(name_input);
              $("#form"+id).append(photo_input);
              $("#form"+id).append(location_input);
              $("#form"+id).append(description_input);
              $("#form"+id).submit();
            break;
        }
      })
    });
    </script>
</body>

</html>
