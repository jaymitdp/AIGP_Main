/**
 * 
 */
var alterReserviorIcon = function()
    	 {
    		 var reserviorLeftPercentage = parseInt(parent.devframeR.document.getElementById('reserviorLeftInput').value);
    		 if(reserviorLeftPercentage != null && reserviorLeftPercentage != "")
    		 {
    			if(reserviorLeftPercentage <= 75 && reserviorLeftPercentage > 50)
 	   			{
 	   			  $('#reserviorAlert').removeClass().addClass("label label-info");
 	   			}
 	   			else if(reserviorLeftPercentage <= 50 && reserviorLeftPercentage > 20)
 				{
 				  $('#reserviorAlert').removeClass().addClass("label label-warning");
 				}
 	   			else if(reserviorLeftPercentage <= 20 && reserviorLeftPercentage > 5)
 				{
 				  $('#reserviorAlert').removeClass().addClass("label label-danger");
 				}
    		 }
    	 }
    	 
    	 function alterBatteryIcon()
    	 {
    	    var batteryLeftPercentage = parseInt(parent.devframeR.document.getElementById('chargeLeftInput').value);
    	    var isChargingOn = parent.devframeR.document.getElementById('isChargingOn').checked;
    	  	
   		  	if(batteryLeftPercentage != null && batteryLeftPercentage != "")
	   		   {
	   			if(!isChargingOn && batteryLeftPercentage <= 75 && batteryLeftPercentage > 50)
	   			{
	   			$('#batteryLeftIcon').removeClass("fa fa-battery-full").addClass("fa fa-battery-three-quarters");
	   			$('#batteryLeft').removeClass().addClass("label label-info");
	   			}
	   			else if(!isChargingOn && batteryLeftPercentage <= 50 && batteryLeftPercentage > 20)
				{
				  $('#batteryLeftIcon').removeClass("fa fa-battery-three-quarters").addClass("fa fa-battery-half");
				  $('#batteryLeft').removeClass().addClass("label label-warning");
				}
	   			else if(!isChargingOn && batteryLeftPercentage <= 20 && batteryLeftPercentage > 5)
				{
				  $('#batteryLeftIcon').removeClass("fa fa-battery-half").addClass("fa fa-battery-quarter");
				  $('#batteryLeft').removeClass().addClass("label label-danger");
				}
	   			else if(!isChargingOn && batteryLeftPercentage <= 5)
				{
				  $('#batteryLeftIcon').removeClass("fa fa-battery-quarter").addClass("fa fa-battery-empty");
				}
	   			else if(isChargingOn && batteryLeftPercentage > 5 && batteryLeftPercentage <= 20)
	   			{
	   				$('#batteryLeftIcon').removeClass("fa fa-battery-empty").addClass("fa fa-battery-quarter");
	   			}
	   			else if(isChargingOn && batteryLeftPercentage > 20 && batteryLeftPercentage <= 50)
	   			{
	   				  $('#batteryLeftIcon').removeClass("fa fa-battery-quarter").addClass("fa fa-battery-half");
					  $('#batteryLeft').removeClass().addClass("label label-warning");
	   			}
	   			else if(isChargingOn && batteryLeftPercentage > 50 && batteryLeftPercentage <= 75)
	   			{
	   				  $('#batteryLeftIcon').removeClass("fa fa-battery-half").addClass("fa fa-battery-three-quarters");
					  $('#batteryLeft').removeClass().addClass("label label-info");
	   			}
	   			else if(isChargingOn && batteryLeftPercentage > 75)
	   			{
	   				  $('#batteryLeftIcon').removeClass("fa fa-battery-three-quarters").addClass("fa fa-battery-full");
					  $('#batteryLeft').removeClass().addClass("label label-success");
	   			}
   			}
    	 }
    	 
    	 function getDateTime(setDate, getDate, getTime)
 	  	{
 	  		var date = new Date();
 	  		date.setDate(date.getDate() + setDate);
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
 			if(getDate)
 			{
 				return dd + "." + mm + "." + yyyy;	
 			}
 			if(getTime)
 			{
 				return hh + ":" + MM;	
 			}
 	  	}
    	 
    	 var updateNeedleTitle = function(increateDate){
 			$('#needleTitle').attr('title','Needs replacement on or before : ' + getDateTime(increateDate, true, false));	
 		}
    	 
    	 var updateData = function(glucoseData)
 		{
 	  		if(glucoseData != null && glucoseData != "")
 	  		{
       		glucoseData = glucoseData.replace(/['{]+/g, '');
 	        glucoseData = glucoseData.replace(/['"]+/g, '');
 	        glucoseData = glucoseData.replace(/['}]+/g, '');
 			var partedString = glucoseData.split(',');
 			var t, g, tEnd, gStart;
 			
 			if(partedString != null && partedString != "")
 			{
 				var gData = [];
 				
 				for(var i = 0; i < partedString.length; i++)
 					{
 						tEnd = partedString[i].lastIndexOf(':');
 						gStart = tEnd + 1;
 						t = partedString[i].substr(0, tEnd);
 						g = partedString[i].substr(gStart,partedString[i].length);
 						g = parseFloat(parseFloat(g).toFixed(2));
 						
 						if(g > 120 || g < 70)
 						{
 							bloodGlucoseUnsafeAlert.play();	
 							chart.options.theme = "dark1";
 							chart.data[0].options.lineColor = "red";
 						}
 						else
 							{
 							chart.options.theme = "light1";
 							chart.data[0].options.lineColor = "blue";
 							}
 						gData.push({x: t, y: g});
 						//dataPoints.push({x: t, y: parseInt(g)});
 					}
 					if(gData.length > 0)
 					{
 						dataSeries.dataPoints = gData;
 						chart.data[0].options.name = "Blood Glucose : "+ g;
 						chart.options.axisX.viewportMinimum = 0;//t-20;
 			  			chart.options.axisX.viewportMaximum = t;
 			  			chart.render();
 			  			parent.iframe2.contentWindow.updateReserviorInsulinConsumed();
 					}
 				}
 			}
 		}
 	  	
    	 function toggleManualMode(value)
     	 {
     		if(value=="false")
  			{
  				//$('#manualModeOnBtn').hide();
  				$('#manualModeOnBtn').attr("disabled", "disabled");
  			}
 	 		else{
 	 			//$('#manualModeOnBtn').show();
 	 			$('#manualModeOnBtn').removeAttr("disabled");
 	 		}
     	 }
    	  
    	  $('#carbIntake').focusout(function() {
          	if($(this).val() != "" && !$.isNumeric($(this).val()))
          	{
          		$(this).val('');
          		$(this).focus();
          	}
          	if($(this).val() != ""){
          		$('#carbIntakeBtn').prop("disabled", false);
          	}
          	else{
          		$('#carbIntakeBtn').prop("disabled", true);
          	}
          });
          
          $('#insulinIntake').focusout(function() {
          	if($(this).val() != "" && !$.isNumeric($(this).val()))
          	{
          		$(this).val('');
          		$(this).focus();
          	}
          	if($(this).val() != ""){
          		$('#insulinIntakeBtn').prop("disabled", false);
          	}
          	else{
          		$('#insulinIntakeBtn').prop("disabled", true);
          	}
          });
    	  
          $('#carbIntakeBtn').click(function(){
        	  var carbIntakeUnits = $('#carbIntake').val();
        	  if(carbIntakeUnits != null || carbIntakeUnits != "")
        	  {
        		  $.ajax({
        			type: "POST",
      	  			url : './../../glucoseSimulator',
      	  			data : {
      	  				carbIntakeCommit: true,
      	  				carbIntakeUnits: carbIntakeUnits
      	  			},
      	  			success : function(result) {
      	  			$('#carbIntake').val("");
      	  			$('#carbIntakeBtn').prop("disabled", true);
      	  			}
      	  		}); 
        	  }
          });
          
          $('#insulinIntakeBtn').click(function(){
        	  var insulinUnitsToConsumeVal = $('#insulinIntake').val();
        	  if(insulinUnitsToConsume != null || insulinUnitsToConsume != "")
        	  {
        		  $.ajax({
        			type: "POST",
      	  			url : './../../commonController',
      	  			data : {
      	  			insulinUnitsToConsume: true,
      	  			insulinUnitsToConsumeValue: insulinUnitsToConsumeVal
      	  			},
      	  			success : function(result) {
      	  			$('#insulinIntake').val("");
      	  			$('#insulinIntakeBtn').prop("disabled", true);
      	  			}
      	  		}); 
        	  }
          });