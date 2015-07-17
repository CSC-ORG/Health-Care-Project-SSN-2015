function myselected(res)
		{
			var chkbox = document.forms[0];
		    var txt = "";
		    var i;
		    for (i = 0; i < chkbox.length; i++) {
		        if (chkbox[i].checked) {
		            txt = txt + chkbox[i].value + " ";
		        }
		    }
		    document.getElementById("approvedDoctors").value=txt;
    		var line = new Array();
    		line = txt.split(" ");
    		var l="";
    		for( var i=0;i<line.length;i++){
    			l=l+"<br>"+line[i];
    		}
    		
		    if(res==1)
		    {
		    	document.getElementById("modalText").innerHTML="Are you sure that you want to reject the Doctors with the following Medical Mouncil ID?<br>"+l;
		    	var v=document.forms[0];
		    	v.setAttribute('action','RejectDoctorController');
		    }
		    else
		    	{
		    	document.getElementById("modalText").innerHTML="Are you sure that you want to approve the Doctors with the following Medical Mouncil ID?<br>"+l;
		    	}
		    if(txt!=""){
		    	hidewarningdiv();
		    $('#myModal').modal('show');
		    }
		    else
		    {
				document.getElementById("warninglink").style.display='block';
				document.getElementById("warningalert").style.display='block';
			    
		    }
		}

function setaction(a){
			  document.ApproveDoctorForm.yesorno.value=a.value;
			  
		  }
		  function onsubmitaction(){
			  if(document.getElementById("modalText").innerHTML=="")
				  {
				  alert("false");
				  return false;
				  }
			 if(document.ApproveDoctorForm.yesorno.value=="Confirm")
				 return true;
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
						document.getElementById("infotext").innerHTML="Aprroval or rejection of selected Doctor account was successful.";}
					else{
						document.getElementById("infotext").innerHTML="Sorry. There is some temporary problem. Please try again.";}
				}
				else {
					document.getElementById("infotext").style.display='none';
					document.getElementById("infolink").style.display='none';
					document.getElementById("infoalert").style.display='none';
					
				}	
		  }