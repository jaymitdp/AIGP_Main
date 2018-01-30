<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>AIGP</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="${pageContext.request.contextPath}/pumpLayout/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/pumpLayout/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/pumpLayout/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/webLayout/AIGP.png" type="image/x-icon" />
	<link href="${pageContext.request.contextPath}/pumpLayout/plugins/wizard/easyWizard.css" rel="stylesheet" type="text/css" />
</head>
<body>
<body class="lockscreen">
    <!-- Automatic element centering -->
    <div class="lockscreen-wrapper">
      <div class="lockscreen-logo">
        <a id="currentTime" href="#"></a><br/>
        <a id="currentDate" href="#"></a><br/>
        <a id="currentBloodGlucoseLevel" href="#"></a>
      </div>
      
      <div class="lockscreen-item" style="width:95%">
       <div class="row">	
			<div class="col-md-6">
                  <div class="box box-info">
                    <div class="box-header with-border">
                      <ul class="users-list clearfix">
                        <li style="width: 100%; align-content: center;">
                      		<a class="users-list-name" data-toggle="modal" data-target="#userGuide" href="#">
                          	<span class="users-list-date">USER GUIDE</span></a>
					  	</li>
					  </ul>
                    </div>
                    <div class="box-body no-padding">
	                  <ul class="users-list clearfix">
                        <li>
                          <a class="users-list-name" href="${pageContext.request.contextPath}/pumpLayout/views/doctorView.jsp">
                          <img src="${pageContext.request.contextPath}/pumpLayout/dist/img/doctor-icon.png" alt="User Image"/>
                          </a>
                          <span class="users-list-date">Doctor</span>
                        </li>
                        <li>
                          <a class="users-list-name" href="${pageContext.request.contextPath}/pumpLayout/views/patientView.jsp">
                          <img src="${pageContext.request.contextPath}/pumpLayout/dist/img/userPatient.png" alt="User Image"/></a>
                          <span class="users-list-date">${sessionScope.patientName}</span>
                          <span class="users-list-date">Patient</span>
                        </li>
                        <li>
                          <a class="users-list-name" href="${pageContext.request.contextPath}/emergencyAccess">
                          <img src="${pageContext.request.contextPath}/pumpLayout/dist/img/Nurse.png" alt="User Image"/>
                          </a>
                          <span class="users-list-date">Emergency access</span>
                        </li>
                      </ul>             
                    </div>
                  </div>
                </div>
              </div>
      </div>
    </div>

	<div class="modal fade" id="userGuide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header" style="height: 35px;">
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                    <h5 style="font-weight: bold;" class="modal-title" id="myModalLabel">USER GUIDE</h5>
	                </div>
	                <div class="modal-body wizard-content">
	                    <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 1 : Select an appropriate view</h5><br/>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/1.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                    <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 2 : Lockscreen->Doctor - 'Dashboard of doctor view'</h5>
	                        <h6 align="center" style="line-height: 8px;">'Click <b><i class="fa fa-gears"></i></b>'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/2.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 3 : Lockscreen->Doctor->Settings</h5> 
	                        <h6 align="center" style="line-height: 8px;">'Click <b>Configurations</b> to configure pump'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/3.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  <div class="wizard-step">
	                  		<h5 style="line-height: 8px;">Step 4 : Lockscreen->Doctor->Settings->Configurations</h5> 
	                        <h6 align="center" style="line-height: 8px;"><b>'Configure pump'</b></h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/4.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  <div class="wizard-step" Style="margin:none;">
	                        <h5 style="line-height: 8px;">Step 5 : Lockscreen->Doctor->Settings->Configurations</h5> 
	                        <h6 align="center" style="line-height: 8px;">'Provide correct reset values to save settings'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/5.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 6 : Dashboard of patient view in automatic mode</h5>
	                        <h6 align="center" style="line-height: 8px;">'Click <b><i class="fa fa-gears"></i></b>'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/6.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 7 : Lockscreen->Patient->Settings</h5> 
	                        <h6 align="center" style="line-height: 8px;">'Available options'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/8.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 8 : Lockscreen->Patient->Settings->Profile</h5> 
	                        <h6 align="center" style="line-height: 8px;">'Edit profile & click <b>save</b>'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/9.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  
	                  <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 9 : Dashboard of patient view in manual mode</h5>
	                        <h6 align="center" style="line-height: 8px;">'Click <b>Manual Mode->On</b> to start manual mode'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/7.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 10 : Dashboard of emergency view</h5>
	                        <h6 align="center" style="line-height: 8px;">'Inject button appears only in case of emergency'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/10.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 11 : Lockscreen->Relatives/Nurse->Settings</h5> 
	                        <h6 align="center" style="line-height: 8px;">'Click <b><i class="fa fa-gears"></i></b>'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/11.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 12 : Lockscreen->Relatives/Nurse->Settings->Help</h5> 
	                        <h6 align="center" style="line-height: 8px;">'Click <b>AIGP</b> to return'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/12.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 13 : Lockscreen->Doctor/Patient/Relatives-Nurse</h5> 
	                        <h6 align="center" style="line-height: 8px;">'Click <img src="${pageContext.request.contextPath}/pumpLayout/dist/img/syringe1.png" width="16" height="16" class="user-image" alt="Syringe" /> and follow instructions to replace needle'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/15.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                  <div class="wizard-step">
	                        <h5 style="line-height: 8px;">Step 14 : Lockscreen->Doctor/Patient/Relatives-Nurse</h5> 
	                        <h6 align="center" style="line-height: 8px;">'Click <b><i class="fa fa-fw fa-flask"></i></b> and follow instructions to refill reservior'</h6>
	                        <div style="text-align: center">
	                        <img height="400px" width="360px" src="${pageContext.request.contextPath}/pumpLayout/dist/img/user_guide/16.JPG" alt="User Image"/>
	                        </div>
	                  </div>
	                </div>
	                <div class="modal-footer wizard-buttons">
	                    <!-- The wizard button will be inserted here. -->
	                </div>
	            </div>
	        </div>
	    </div>

    <script src="${pageContext.request.contextPath}/pumpLayout/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/pumpLayout/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
	
	var date = new Date();
	var dd = date.getDate();
	var mm = date.getMonth() + 1;
	var yyyy = date.getFullYear();
	var hh = date.getHours();
	var MM = date.getMinutes();
	if(dd < 10)
	{
		dd = '0' + dd;
	}
	if(mm < 10)
	{
		mm = '0' + mm;
	}
	if(MM < 10)
	{
		MM = '0' + MM;
	}
	document.getElementById("currentDate").innerHTML = '<b><small style="font-weight:bold; font-size:36px;">' + dd + '.' + mm + '.' + yyyy + '</small></b>';
	document.getElementById("currentTime").innerHTML = '<b><large style="font-weight:bold; font-size:60px;">' + hh + ':' + mm + '</large></b>';
	
	$.fn.wizard = function(config) {
        if (!config) {
          config = {};
        };
        
        var containerSelector = config.containerSelector || ".wizard-content";
        var stepSelector = config.stepSelector || ".wizard-step";
        var steps = $(this).find(containerSelector+" "+stepSelector);
        var stepCount = steps.size();
        var exitText = config.exit || 'Back';
        var backText = config.back || 'Back';
        var nextText = config.next || 'Next';
        var finishText = config.finish || 'Finish';
        var isModal = config.isModal || true;
        var validateNext = config.validateNext || function(){return true;};
        var validateFinish = config.validateFinish || function(){return true;};

		  var step = 1;
          var container = $(this).find(containerSelector);
          steps.hide();
          $(steps[0]).show();
          if (isModal) {
            $(this).on('hidden.bs.modal', function () {
              step = 1;
              $($(containerSelector+" .wizard-steps-panel .step-number")
                .removeClass("done")
                .removeClass("doing")[0])
              .toggleClass("doing");
              
              $($(containerSelector+" .wizard-step")
                .hide()[0])
              .show();

              btnBack.hide();
              btnExit.show();
              btnFinish.hide();
              btnNext.show();

            });
          };
          $(this).find(".wizard-steps-panel").remove();
          var stepsPanel = $(this).find(".wizard-steps-panel");
          $(this).find(".wizard-steps-panel .step-"+step).toggleClass("doing");
          var contentForModal = "";
          if(isModal){
            contentForModal = ' data-dismiss="modal"';
          }
          var btns = "";
          btns += '<button type="button" id="btnExit" class="btn btn-default wizard-button-exit"'+contentForModal+'>'+ exitText +'</button>';
          btns += '<button type="button" id="btnBack" class="btn btn-default wizard-button-back">'+ backText +'</button>';
          btns += '<button type="button" id="btnNext" class="btn btn-default wizard-button-next">'+ nextText +'</button>';
          btns += '<button type="button" id="btnFinish" class="btn btn-primary wizard-button-finish" '+contentForModal+'>'+ finishText +'</button>';
          $(this).find(".wizard-buttons").html("");
          $(this).find(".wizard-buttons").append(btns);
          var btnClose = $(this).find(".close");
          var btnExit = $(this).find(".wizard-button-exit");
          var btnBack = $(this).find(".wizard-button-back");
          var btnFinish = $(this).find(".wizard-button-finish");
          var btnNext = $(this).find(".wizard-button-next");

          btnClose.on("click", function () {
              if(!validateNext(step, steps[step-1])){
                return;
              };
              if(!!config.onfinish){
                  config.onfinish();
                }
              step=1;
              btnExit.hide();
              btnBack.show();
            });
          
          btnNext.on("click", function () {
            if(!validateNext(step, steps[step-1])){
              return;
            };
            $(container).find(".wizard-steps-panel .step-"+step).toggleClass("doing").toggleClass("done");
            step++;
            steps.hide();
            $(steps[step-1]).show();
            $(container).find(".wizard-steps-panel .step-"+step).toggleClass("doing");
            if(step>0){
          	  if($(container).selector.indexOf("reserviorWizard")>=0)
          		  {
          	  		addReserviorAlert();
          		  }
          	  if($(container).selector.indexOf("needleWizard")>=0)
      		  {
          		  addNeedleAlert();
      		  }
            }
            if(step==stepCount){
              btnFinish.show();
              btnNext.hide();
            }
            btnExit.hide();
            btnBack.show();
          });

          btnBack.on("click", function () {
            $(container).find(".wizard-steps-panel .step-"+step).toggleClass("doing");
            step--;
            steps.hide();
            $(steps[step-1]).show();
            $(container).find(".wizard-steps-panel .step-"+step).toggleClass("doing").toggleClass("done");
            if(step==1){
              btnBack.hide();
              btnExit.show();
            }
            btnFinish.hide();
            btnNext.show();
          });

          btnFinish.on("click", function () {
            if(!validateFinish(step, steps[step-1])){
              return;
            };
            if(!!config.onfinish){
              config.onfinish();
            }
            if($(container).selector.indexOf("reserviorWizard")>=0)
  		  {
          	  removeReserviorAlert();
  		  }
            if($(container).selector.indexOf("needleWizard")>=0)
  		  {
  			  removeNeedleAlert();
  		  }
          });
          
          btnBack.hide();
          btnFinish.hide();
          return this;
        };
  	
        function removeReserviorAlert()
        {
      	  if($('#reserviorAlert') != null)
      		  {
      		  	if(parent.devframeR.document.getElementById('reserviorLeftInput').value != "")
      	    	 {
      	    		 var reserviorLeftPercentage = parseInt(parent.devframeR.document.getElementById('reserviorLeftInput').value);
      	    		 $('#reserviorAlert').removeClass("label label-danger").addClass("label label-success");
      	        	 $('#reserviorAlert').html(reserviorLeftPercentage + "%");
      	    	 }
      		  }
        }
        
        function addReserviorAlert()
        {
      	  var reserviorAlertElement = parent.devframeL.document.getElementById('reserviorAlert');
      	  if(reserviorAlertElement != null)
      		  {
      		  $('#reserviorAlert').removeClass("label label-success").addClass("label label-danger");
      		  reserviorAlertElement.innerHTML = "!";//"label label-success"
      		  }
        }
        function removeNeedleAlert()
        {
      	  var needleAlertElement = parent.devframeL.document.getElementById('needleAlert');
      	  if(needleAlertElement != null)
      		  {
      		  needleAlertElement.innerHTML = "";
      		  }
        }
        
        function addNeedleAlert()
        {
      	  var needleAlertElement = parent.devframeL.document.getElementById('needleAlert');
      	  if(needleAlertElement != null)
      		  {
      		  needleAlertElement.innerHTML = "!";
      		  }
        }
        $('#needleWizard').on( "hide", function(){
        $("#needleWizard").wizard();
        });
        $("#userGuide").wizard();
        
       function getCurrentBloodGlucoseLevel()
       {
	       $.ajax({
	  	        url: '/AIGP/commonController',
	  	        type: 'POST',
	  	      data : {
	  	    	patientBloodGlucoseSeeker : true
	  			},
	  	        success: function(data) {
	  	        	if(data){
	  	        		if(data != null && data != "")
	  	        		{
	  	        			data = parseFloat(data).toFixed(2);
	  	        			$('#currentBloodGlucoseLevel').html('<large style="font-weight:600; font-size:20px;">Blood Glucose: ' + data + 'mg/dl</large>');
	  	        		}
	  	        	}
	  	        }
	  	    });
	       window.setTimeout(function(){getCurrentBloodGlucoseLevel();}, 1000);
       }
       getCurrentBloodGlucoseLevel();
	</script>
  </body>
</body>
</html>