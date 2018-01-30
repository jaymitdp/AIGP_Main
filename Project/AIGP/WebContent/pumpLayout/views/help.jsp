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
        <p class="login-box-msg"><b>User manual</b></p>
        <div class="row">
        	<div class="col-sm-4 col-md-2">
              <div class="box box-default">
                <div class="box-header with-border">
                  <i class="fa fa-tag"></i>
                  <h3 class="box-title">Color code</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div class="callout callout-danger">
                    <h4><i class="fa fa fa-ban"></i> Danger</h4>
                  </div>
                  <div class="callout callout-warning">
                    <h4><i class="fa fa-warning"></i> Warning</h4>
                  </div>
                  <div class="callout callout-info">
                    <h4><i class="fa fa-info"></i> Information</h4>
                  </div>
                  <div class="callout callout-success">
                    <h4><i class="fa fa fa-check"></i> Safe</h4>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-sm-4 col-md-2">
              <div class="box box-default">
                <div class="box-header with-border">
                  <i class="fa fa-battery-full"></i>
                  <h3 class="box-title">Battery</h3>
                </div>
                <div class="box-body">
                  <div class="callout callout-danger">
                    <h4><i class="fa fa-battery-empty"></i> Battery critically low!</h4>
                    Battery about to die.
                  </div>
                  <div class="callout callout-warning">
                    <h4><i class="fa fa-battery-quarter"></i> Battery low!</h4>
                    Battery requires immediate charging.
                  </div>
                  <div class="callout callout-info">
                    <h4><i class="fa fa-battery-three-quarters"></i> Battery discharging!</h4>
                    Battery requires immediate charging.
                  </div>
                  <div class="callout callout-success">
                    <h4><i class="fa fa-battery-full"></i> Battery Full!</h4>
                    Battery is charged fully.
                  </div>
                </div>
              </div>
            </div>
			
			<div class="col-sm-4 col-md-2">
              <div class="box box-default">
                <div class="box-header with-border">
                  <img src="${pageContext.request.contextPath}/pumpLayout/dist/img/syringe1.png" width="30" height="30" class="user-image" alt="Syringe" />
                  <h3 class="box-title">Needle</h3>
                </div>
                <div class="box-body">
                  <div class="callout callout-danger">
                    <h4><img src="${pageContext.request.contextPath}/pumpLayout/dist/img/syringe1.png" width="16" height="16" class="user-image" alt="Syringe" />
                    <i class="fa fa fa-warning"></i> Needle disconnected!</h4>
                    Needle is not attached with the pump currently.
                  </div>
                  <div class="callout callout-success">
                    <h4><img src="${pageContext.request.contextPath}/pumpLayout/dist/img/syringe1.png" width="16" height="16" class="user-image" alt="Syringe" /> Needle connected!</h4>
                    Needle is now connected with the pump.
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-sm-4 col-md-2">
              <div class="box box-default">
                <div class="box-header with-border">
                  <i class="fa fa-fw fa-flask"></i>
                  <h3 class="box-title">Reservior</h3>
                </div>
                <div class="box-body">
                  <div class="callout callout-danger">
                    <h4><i class="fa fa-fw fa-flask"></i>
                    <i class="fa fa fa-warning"></i> Reservior disconnected!</h4>
                    Reservior is not connected with the pump currently.
                  </div>
                  <div class="callout callout-success">
                    <h4><i class="fa fa-fw fa-flask"></i> Reservior connected!</h4>
                    Reservior is now connected with the pump.
                  </div>
                </div>
              </div>
            </div>
            
          </div>
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/pumpLayout/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/pumpLayout/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  </body>
</html>