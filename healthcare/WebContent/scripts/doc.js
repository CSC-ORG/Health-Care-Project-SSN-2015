var request;  

function myfn()  
{   
	var v=document.detailsaddform.hname.value;
    var url="FetchId.jsp?val="+v;
    if(window.XMLHttpRequest){  
    	request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    	request=new ActiveXObject("Microsoft.XMLHTTP");	  
    }  
    try  {  
    	request.onreadystatechange=getInfodoc;  
    	request.open("GET",url,true);  
    	request.send();  
    }  
    catch(e)  {  
    	alert("Unable to connect to server");  
    }  
    }  
    function getInfodoc(){  
    if(request.readyState==4){  
    	var val=request.responseText;
    	document.detailsaddform.hid.value=val;  
    }  
    }  

function myfn3(val)
{
	document.detailsaddform.hid.value=val;
}
function myfn4(val)
{
	document.schedule.hid.value=val;  
	myfn2();
}
    
    function myfn1()  
    {   
    	var v=document.schedule.hname.value;
        var url="FetchId.jsp?val="+v;  
        if(window.XMLHttpRequest){  
        	request=new XMLHttpRequest();  
        }  
        else if(window.ActiveXObject){  
        	request=new ActiveXObject("Microsoft.XMLHTTP");	  
        }  
        try  {  
        	request.onreadystatechange=getInfo2;  
        	request.open("GET",url,true);  
        	request.send();  
        }  
        catch(e)  {  
        	alert("Unable to connect to server");  
        }  
        }  
        function getInfo2(){  
        if(request.readyState==4){  
        	var val=request.responseText;  
        	document.schedule.hid.value=val;  
        	myfn2();
        }  
        }  
        

        function myfn2()  
        {   
        	var v=document.schedule.hid.value;
        	var v2=document.schedule.mcid.value;
            var url="FetchSchedule.jsp?val="+v+"&mcid="+v2;  
            if(window.XMLHttpRequest){  
            	request=new XMLHttpRequest();  
            }  
            else if(window.ActiveXObject){  
            	request=new ActiveXObject("Microsoft.XMLHTTP");	  
            }  
            try  {  
            	request.onreadystatechange=getInfo3;  
            	request.open("GET",url,true);  
            	request.send();  
            }  
            catch(e)  {  
            	alert("Unable to connect to server");  
            }  
            }  
            function getInfo3(){  
            	if(request.readyState==4){	  
            		var val=request.responseText;
            		hideAll('u');
            		showRow("utbl");
            		showRow("udayHeader");
            		var line = new Array();
            		line = val.split(";");
            		for( var i=0;i<line.length;i++){
            			var clmn = new Array();
            			clmn = line[i].split("-");
            			var day = "u"+clmn[0].trim();
            			var s = "";
            			if(clmn[3] == "Morning")
            				s="m";
            			else
            				s="a";
            			
            			document.getElementById(day + s +"ftime").value=clmn[1];
            			document.getElementById(day + s +"ttime").value=clmn[2];
            			showRow(day);
            			showRow(day+s);
            			
            		}
            	}  
            }  

            
            function showRow(id) {
		    	var row = document.getElementById(id);
		      row.style.display ='';
		    }

		    function hideRow(id,val) {
		    	if(val==1 && id!='tbl' && id!='dayHeader' && id!='utbl' && id!='udayHeader' ){
		    		var f = id+"ftime";
		    		var t = id+"ttime";
		    		document.getElementById(f).value="";
		    		document.getElementById(t).value="";
		    	}
		      var row = document.getElementById(id);
		      row.style.display = 'none';
		    }
		    
		    

		    function hideAll(s) {
		    	
		    	hideRow(s+'Sun',0);
				hideRow(s+'Mon',0);
				hideRow(s+'Tue',0);
				hideRow(s+'Wed',0);
				hideRow(s+'Thu',0);
				hideRow(s+'Fri',0);
				hideRow(s+'Sat',0);
				
				hideRow(s+'Sunm',1);
				hideRow(s+'Monm',1);
				hideRow(s+'Tuem',1);
				hideRow(s+'Wedm',1);
				hideRow(s+'Thum',1);
				hideRow(s+'Frim',1);
				hideRow(s+'Satm',1);
				
				hideRow(s+'Suna',1);
				hideRow(s+'Mona',1);
				hideRow(s+'Tuea',1);
				hideRow(s+'Weda',1);
				hideRow(s+'Thua',1);
				hideRow(s+'Fria',1);
				hideRow(s+'Sata',1);
				
				hideRow(s+'dayHeader',0);
				hideRow(s+'tbl',0);
			}
		    
            function showRowdiv(id) {
		    	var row = document.getElementById(id);
		      row.style.display ='';
		    }

		    function hideRowdiv(id,val) {
		      var row = document.getElementById(id);
		      row.style.display = 'none';
		    }

		    function hideAlldiv() {
		    	
		    	hideRowdiv('uSun',0);
				hideRowdiv('uMon',0);
				hideRowdiv('uTue',0);
				hideRowdiv('uWed',0);
				hideRowdiv('uThu',0);
				hideRowdiv('uFri',0);
				hideRowdiv('uSat',0);
				
				hideRowdiv('uSunm',1);
				hideRowdiv('uMonm',1);
				hideRowdiv('uTuem',1);
				hideRowdiv('uWedm',1);
				hideRowdiv('uThum',1);
				hideRowdiv('uFrim',1);
				hideRowdiv('uSatm',1);
				
				hideRowdiv('uSuna',1);
				hideRowdiv('uMona',1);
				hideRowdiv('uTuea',1);
				hideRowdiv('uWeda',1);
				hideRowdiv('uThua',1);
				hideRowdiv('uFria',1);
				hideRowdiv('uSata',1);
				
				hideRowdiv('udayHeader',0);
				hideRowdiv('utbl',0);
			}
		    
		    

		function newfields(){
			var key1=document.getElementById("selectedDays").innerHTML;
	    	var x = new Array();
	    	x = key1.split(",");
	    	var str = "";
	    	hideAll('');
	    	if(x.length!=0){
	    		showRow('tbl');
	    		showRow('dayHeader');
	    	}
	    	for(var i=0;i<x.length;i++){
	    		str = str + x[i] + " ";
	    		var row = x[i][0] + x[i][1] + x[i][2] ;
	    		showRow(row);
	    		showRow(x[i]);
	    		showRow(x[i]+"m");
	    		showRow(x[i]+"a");
	    	}
	    	document.detailsaddform.sdays.value=str;
	    	
		}