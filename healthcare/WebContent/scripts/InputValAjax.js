function getSuggestion()  
{  
	var v=document.detailsaddform.hname.value;  
var url="HospitalSuggest.jsp?val="+v;  

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

		var parent_id="hospitalnames";
        var parent = document.getElementById(parent_id);
        var childArray = parent.children;
        var cL = childArray.length;
        while(cL > 0) {
            cL--;
            parent.removeChild(childArray[cL]);
        }
    	var x = new Array();
    	x = val.split("...");
    	for(var i=0;i<x.length;i++){
	    var z = document.createElement("OPTION");
	    z.setAttribute("value", x[i]);
	    document.getElementById("hospitalnames").appendChild(z);
    	}
    }  
}  
