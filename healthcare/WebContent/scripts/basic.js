function alertbox(){
    		var r = 0 ;
    		var p1 = document.getElementById("pagereason").value;
    		var message = document.getElementById("mymessage");
    		if(p1 == "forgotpwd"||p1 == "doclogin"){
    			r=1;
    			message.innerHTML="New password has been sent to you email ID.";
    		}else if(p1 == "dnotactive" || p1=="dsignup"){
    			r=1;
    			message.innerHTML="Account has been created successfully. Please wait until our admin verifies the doctor. This won't take much time. Thank You.";
    		}
    		else if (p1=="logout")
    			{
    			r=1;
    			message.innerHTML="Please login to continue.";
    			}
    		else if(p1 == "noaccount"){
    			r=1;
    			message.innerHTML="You dont have an account. Kindly SignUp to login.";
    			
    		}else if(p1 == "appts"){
    			r=1;
    			message.innerHTML="Your appointment has been booked successfully. You will receive a mail once the hospital approves your request.";
    			
    		}else if(p1 == "failure"){
    			r=1;
    			message.innerHTML="You email ID and password do not match.";
    		} else if( p1 == "unknown"){
    			r=1;
    			message.innerHTML="Sorry. There is some temporary problem. Please try again.";
    		} else if( p1 == "nocreate"){
    			r=1;
    			message.innerHTML="You already have an account! Activation link has been sent to your mail.";
    		} else if(p1 == "norecreate" || p1 == "dnorecreate"){
    			r=1;
    			message.innerHTML="You already have an account! Please login to continue.";
    		} else if(p1 == "notactive"){
    			r=1;
    			message.innerHTML="Your account is not yet activated. Activation link has been sent to your mail.";
    		} else if( p1 == "success" || p1 == "signup"){
    			r=1;
    			message.innerHTML="Account has been successfully created. Please login to continue";
    		} else if( p1 == "reset"){
    			r=1;
    			message.innerHTML="New password has been sent to your mail.";
    		}
    		if(r==1){
    			message.style.display='block';
    			document.getElementById("msgcontainer").style.display='block';
    			document.getElementById("message").style.display='block';
    			document.getElementById("mymessagelogin").style.display='block';
    			var w=window.open("#message","_self");
    		}
    		else{
    			message.style.display='none';
    			document.getElementById("msgcontainer").style.display='none';
    			document.getElementById("message").style.display='none';
    			document.getElementById("mymessagelogin").style.display='none';
    		}
    	}
    	function validateForm(form,p1,p2,e) {
    		  if(p1.value == "" || p1.value != p2.value) {
    			  p1.value = "";
    			  p2.value = "";
    			  document.getElementById(e).innerHTML="Password do not match. Please re-enter.";
	    	    return false;
    		  }
    		  else{
    			  document.getElementById(e).innerHTML="";
    			  document.e.innerHTML="";
    		  }
    		  return true;
    	}
    	function setemail(p1,tbl){
    		document.forgotpwd.reason.value=tbl;
    		var p3 = p1.value;
    		var p2 = document.forgotpwd.femail; 
   			p2.value = p1.value;
    		
    	}
