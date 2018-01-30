<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="${pageContext.request.contextPath}/pumpLayout/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/pumpLayout/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/pumpLayout/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/pumpLayout/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
</head>
<body class="register-page">
    <div class="register-box">
      <div class="register-logo">
        <a href="patientView.jsp"><b>AIGP</b></a>
      </div>

      <div class="register-box-body">
        <p class="login-box-msg"><b>Edit Profile<b></p>
        <form action="../../editProfile" method="post">
          <div class="form-group has-feedback">
            <input type="text" name="patientName" value="${sessionScope.patientName}" class="form-control" placeholder="Full name"/>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="text" name="patientDOB" id="patientdob" value="${sessionScope.patientDOB}" class="form-control" placeholder="Date of birth" data-inputmask="'DOB': 'dd.mm.yyyy'" data-mask/>
            <!-- <input type="text" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>-->
            <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="pull-center">
              <button type="submit" class="btn btn-block btn-primary btn-lg">Save</button>
            </div>
          </div>
        </form>
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/pumpLayout/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/pumpLayout/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/pumpLayout/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/pumpLayout/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/pumpLayout/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/pumpLayout/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%'
        });
        
      //patientdob date mask
        $("#patientdob").inputmask("dd.mm.yyyy", {"placeholder": "dd.mm.yyyy"});
      
      });
    </script>
  </body>
</html>