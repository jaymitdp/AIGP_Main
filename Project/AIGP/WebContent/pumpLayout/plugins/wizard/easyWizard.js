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
            container.prepend('<div class="wizard-steps-panel steps-quantity-'+ stepCount +'"></div>');
            var stepsPanel = $(this).find(".wizard-steps-panel");
            for(s=1;s<=stepCount;s++){
              stepsPanel.append('<div class="step-number step-'+ s +'"><div class="number">'+ s +'</div></div>');
            }
            $(this).find(".wizard-steps-panel .step-"+step).toggleClass("doing");
            //////////////////////
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
        	  //var reserviorAlertElement = parent.devframeL.document.getElementById('reserviorAlert');
        	  if($('#reserviorAlert') != null)
        		  {
        		  	if(parent.devframeR.document.getElementById('reserviorLeftInput').value != "")
        	    	 {
        	    		 $('#reserviorAlert').removeClass("label label-danger").addClass("label label-success");
        	        	 $('#reserviorAlertVal').html(100);
        	        	 parent.iframe2.contentWindow.reserviorRefilled();
        	        	 parent.iframe2.contentWindow.refreshReserviorStatus();
        	        	 parent.iframe2.contentWindow.updateReserviorInsulinConsumed();
        	    	 }
        		  }
          }
          
          function addReserviorAlert()
          {
        	  var reserviorAlertElement = parent.devframeL.document.getElementById('reserviorAlert');
        	  var reserviorAlertValElement = parent.devframeL.document.getElementById('reserviorAlertVal');
        	  if(reserviorAlertElement != null)
        		  {
        		  $('#reserviorAlert').removeClass("label label-success").addClass("label label-danger");
        		  reserviorAlertValElement.innerHTML = "!";
        		  }
          }
          function removeNeedleAlert()
          {
        	  var needleAlertElement = parent.devframeL.document.getElementById('needleAlert');
        	  if(needleAlertElement != null)
        		  {
        		  needleAlertElement.innerHTML = "";
        		  parent.iframe1.contentWindow.updateNeedleTitle(7);
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