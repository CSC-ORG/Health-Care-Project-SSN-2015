		  function onsubmitaction(){
			  var chkbox = document.ApproveAppointmentForm;
			    var txt = "";
			    var i;
			    for (i = 0; i < chkbox.length; i++) {
			        if (chkbox[i].checked) {
			            txt = txt + chkbox[i].value + " ";
			        }
			    }
			    document.getElementById("approvedAppointment").value=txt;
	    		if(txt!=""){
	    			hidewarningdiv();
	    			return true;
			    }
			    else
			    {
					document.getElementById("warninglink").style.display='block';
					document.getElementById("warningalert").style.display='block';
				    
			    }
		  return false;
		  }
		  
		  function onsubmitaction1(e){
			  var chkbox = document.ApproveAppointmentForm;
			    var txt = "";
			    var i;
			    for (i = 0; i < chkbox.length; i++) {
			        if (chkbox[i].checked) {
			            txt = txt + chkbox[i].value + " ";
			        }
			    }
			    document.getElementById("approvedAppointment").value=txt;
	    		if(txt!=""){
	    			hidewarningdiv();
	    			var v=document.ApproveAppointmentForm;
	    			v.setAttribute('action','RejectAppointmentController');
	    			return true;
			    }
			    else
			    {
					document.getElementById("warninglink").style.display='block';
					document.getElementById("warningalert").style.display='block';
			    }
	    		return false;
		  }
		  
		  
		  
		  function hidewarningdiv()
		  {
			  document.getElementById("warninglink").style.display='none';
				document.getElementById("warningalert").style.display='none';
				if(document.getElementById("reason").value=="success"||document.getElementById("reason").value=="failure"){
					document.getElementById("infotext").style.display='block';
					document.getElementById("infolink").style.display='block';
					document.getElementById("infoalert").style.display='block';
					if(document.getElementById("reason").value=="success"){
						document.getElementById("infotext").innerHTML="Approval/Rejection of reuqested Appointments was successful .";}
					else{
						document.getElementById("infotext").innerHTML="Sorry. There is some temporary problem. Please try again.";}
				}
				else {
					document.getElementById("infotext").style.display='none';
					document.getElementById("infolink").style.display='none';
					document.getElementById("infoalert").style.display='none';
					
				}	
		  }