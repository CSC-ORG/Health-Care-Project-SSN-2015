

var request;  

function getPaitentDetails()

{ 
	var w = document.hist.pid.value
	var url="fetchPatientDetails.jsp?id=" + w;
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  

try  
{  
request.onreadystatechange=getInfo0;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}



function getInfo0(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById("fetchedDetails").innerHTML = val;  
}  
}












function getPaitentDetails1()

{ 
	var w = document.hist1.pid.value
	var url="fetchPatientDetails1.jsp?id=" + w;
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  

try  
{  
request.onreadystatechange=getInfo1;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}



function getInfo1(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById("fetchedDetails1").innerHTML = val;  
}  
}



