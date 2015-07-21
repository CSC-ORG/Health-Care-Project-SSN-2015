
var request;  

function createRequestObject0()  
{ 
	var w = document.myform.country.selectedIndex;
	var country_id = document.myform.country.options[w].value;
	var url="fetchStates.jsp?id=" + country_id;
  
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
document.getElementById("zero_dropdown_code").innerHTML = val;  
}  
}


function createRequestObject()  
    { 
    	var w = document.myform.statename.selectedIndex;
		var state_id = document.myform.statename.options[w].value;
		var url="fetchCities.jsp?id=" + state_id;
      
    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  

    try  
    {  
    request.onreadystatechange=getInfo;  
    request.open("GET",url,true);  
    request.send();  
    }  
    catch(e)  
    {  
    alert("Unable to connect to server");  
    }  
    }
    
    

	function getInfo(){  
    if(request.readyState==4){  
    var val=request.responseText;  
    document.getElementById("second_dropdown_code").innerHTML = val;  
    }  
    }
	
	
	 function createRequestObject1()  
	    { 
	    	var v = document.myform.cityname.selectedIndex;
			var city_id = document.myform.cityname.options[v].value;
			var url="FetchTowns.jsp?id=" + city_id;
	      
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
	    document.getElementById("third_dropdown_code").innerHTML = val;  
	    }  
	    }
		
		
		function createRequestObject2()  
	    { 
	    	var v = document.myform.townname.selectedIndex;
			var town_id = document.myform.townname.options[v].value;
			var url="fetchHospitals.jsp?id=" + town_id;
	      
	    if(window.XMLHttpRequest){  
	    request=new XMLHttpRequest();  
	    }  
	    else if(window.ActiveXObject){  
	    request=new ActiveXObject("Microsoft.XMLHTTP");  
	    }  

	    try  
	    {  
	    request.onreadystatechange=getInfo2;  
	    request.open("GET",url,true);  
	    request.send();  
	    }  
	    catch(e)  
	    {  
	    alert("Unable to connect to server");  
	    }  
	    }
	    
	    

		function getInfo2(){  
	    if(request.readyState==4){  
	    var val=request.responseText;  
	    document.getElementById("fourth_dropdown_code").innerHTML = val;  
	    }  
	    }
		
		
		function createRequestObject3()  
	    { 
	    	var v = document.myform.hospitalname.selectedIndex;
			var h_id = document.myform.hospitalname.options[v].value;
			var url="fetchSpecialisation.jsp?id=" + h_id;
	      
	    if(window.XMLHttpRequest){  
	    request=new XMLHttpRequest();  
	    }  
	    else if(window.ActiveXObject){  
	    request=new ActiveXObject("Microsoft.XMLHTTP");  
	    }  

	    try  
	    {  
	    request.onreadystatechange=getInfo3;  
	    request.open("GET",url,true);  
	    request.send();  
	    }  
	    catch(e)  
	    {  
	    alert("Unable to connect to server");  
	    }  
	    }
	    
	    

		function getInfo3(){  
	    if(request.readyState==4){  
	    var val=request.responseText;  
	    document.getElementById("fifth_dropdown_code").innerHTML = val;  
	    }  
	    }
	
		
		function createRequestObject4()  
	    { 
			var v1 = document.myform.townname.selectedIndex;
			var town_id = document.myform.townname.options[v1].value;
			
			var v2 = document.myform.hospitalname.selectedIndex;
			var h_id = document.myform.hospitalname.options[v2].value;
			
	    	var v3 = document.myform.specialisationname.selectedIndex;
			var s_id = document.myform.specialisationname.options[v3].value;
			
			var url="fetchDoctor.jsp?id1=" + h_id+"&id2="+ town_id+"&id3="+s_id;
	      
	    if(window.XMLHttpRequest){  
	    request=new XMLHttpRequest();  
	    }  
	    else if(window.ActiveXObject){  
	    request=new ActiveXObject("Microsoft.XMLHTTP");  
	    }  

	    try  
	    {  
	    request.onreadystatechange=getInfo4;  
	    request.open("GET",url,true);  
	    request.send();  
	    }  
	    catch(e)  
	    {  
	    alert("Unable to connect to server");  
	    }  
	    }
	    
	    

		function getInfo4(){  
	    if(request.readyState==4){  
	    var val=request.responseText;  
	    document.getElementById("sixth_dropdown_code").innerHTML = val;  
	    }  
	    }

		
		
		function createRequestObject5()  
	    { 
			
			var v2 = document.myform.hospitalname.selectedIndex;
			var h_id = document.myform.hospitalname.options[v2].value;
			
			var v3 = document.myform.townname.selectedIndex;
			var a_name = document.myform.townname.options[v3].value;
			
			var v4 = document.myform.doctorname.selectedIndex;
			var d_name = document.myform.doctorname.options[v4].value;
			
			var url="fetchDoctorSchedule.jsp?id1=" + h_id+"&id2="+a_name+"&id3="+d_name;
	      
	    if(window.XMLHttpRequest){  
	    request=new XMLHttpRequest();  
	    }  
	    else if(window.ActiveXObject){  
	    request=new ActiveXObject("Microsoft.XMLHTTP");  
	    }  

	    try  
	    {  
	    request.onreadystatechange=getInfo5;  
	    request.open("GET",url,true);  
	    request.send();  
	    }  
	    catch(e)  
	    {  
	    alert("Unable to connect to server");  
	    }  
	    }
	    
	    

		function getInfo5(){  
	    if(request.readyState==4){  
	    var val=request.responseText;
	    if(val==""){hideAlldiv();}else{

			var l1 = new Array();
			l1 = val.split("|");
			val1=l1[0].trim();
			val2=l1[1].trim();
			document.getElementById("viewdatesdiv").innerHTML = val2;
		hideAlldiv();
		showRowdiv("utbl");
		showRowdiv("udayHeader");
		var line = new Array();
		line = val1.split(";");
		for( var i=0;i<line.length;i++){
			var clmn = new Array();
			clmn = line[i].split("-");
			var day = "u"+clmn[0].trim();
			var s = "";
			if(clmn[3] == "Morning")
				s="m";
			else
				s="a";
			
			document.getElementById(day + s +"ftime").innerHTML=clmn[1];
			document.getElementById(day + s +"ttime").innerHTML=clmn[2];
			showRowdiv(day);
			showRowdiv(day+s);
			
				}
			} 	 
	    }
		}
		function getSelectedSchedule()
		{
			if(document.myform.schedule.value=="")
				alert("select atleast one");
			else{
				createRequestObject6();
			}
		}
		function createRequestObject6()  
	    { 
			var v1 = document.myform.schedule.value;
			
			var url="getDates.jsp?id1=" + v1;
	      
	    if(window.XMLHttpRequest){  
	    request=new XMLHttpRequest();  
	    }  
	    else if(window.ActiveXObject){  
	    request=new ActiveXObject("Microsoft.XMLHTTP");  
	    }  

	    try  
	    {  
	    request.onreadystatechange=getInfo6;  
	    request.open("GET",url,true);  
	    request.send();  
	    }  
	    catch(e)  
	    {  
	    alert("Unable to connect to server");  
	    }  
	    }
	    
		function getInfo6(){  
	    if(request.readyState==4){  
	    var val=request.responseText;  
	    document.getElementById("TwoDates").innerHTML = val;  
	    }  
	    }
		
		function validateBookAppnt()
		{
			if(document.myform.dates.value!=""){
				return true;
			}
			else{
				alert("select atleast one");
				return false;
			}
		}

