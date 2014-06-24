function updateStatus(sel,rowId,bid,start_date,end_date,room_id)
{
/*	$.ajax({
		url:'../administrare/updateStatus.php',
		type:'GET',
		data:{ status: sel.options[sel.selectedIndex].text, id: bid },
		success: sugiPula(xhr.responseText),

	});*/

	//$.post( "../administrare/updateStatus.php", { status: sel.options[sel.selectedIndex].text } );


	  if (window.XMLHttpRequest) {
	    // code for IE7+, Firefox, Chrome, Opera, Safari
	    xmlhttp=new XMLHttpRequest();
	  } else { // code for IE6, IE5
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	 
	  xmlhttp.open("GET","../administrare/updateStatus.php?status="+sel.options[sel.selectedIndex].text+"&id="+bid,true);
	  xmlhttp.send();
	  if(sel.options[sel.selectedIndex].text == "Confirmat"){

	  	var rid = 'rid_'+room_id;
	  	var curStartDate = $(rowId).find("td:eq(3)").text();
	  	var parts = curStartDate.split('/');
	  	var startDay = parseInt(parts[0]);
	  	var startMonth = parseInt(parts[1]);
	  	var startYear = parseInt(parts[2]);

	  	var curEndDate = $(rowId).find("td:eq(4)").text();
	  	var parts1 = curEndDate.split('/');
	  	var endDay = parseInt(parts1[0]);
	  	var endMonth = parseInt(parts1[1]);
	  	var endYear = parseInt(parts1[2]);

	  	$("#test5 tbody tr[rid='"+rid+"']").each(function(){
	  		if($(this).attr("id") != $(rowId).attr("id")){
	  			var thisStartDate = $(this).find("td:eq(3)").text();
	  			var thisEndDate = $(this).find("td:eq(4)").text();
	  			
	  			var startSplit = thisStartDate.split('/');
	  			var endSplit = thisEndDate.split('/');
	  			
	  			$(this).find("td:eq(8)").find("select").attr('disabled','disabled');
	  		}
	  		//console.log($(this).attr("id"));
	  	});
	  	//console.log($("#test5 tbody tr[rid='"+rid+"']"));
	  	console.log(start_date+" "+end_date+" "+room_id);
	  	console.log(rooms);
	  } else {
	  	var rid = 'rid_'+room_id;
	  	$("#test5 tbody tr[rid='"+rid+"']").each(function(){
	  		if($(this).attr("id") != $(rowId).attr("id")){
	  			$(this).find("td:eq(8)").find("select").removeAttr('disabled');
	  		}
	  		//console.log($(this).attr("id"));
	  	});
	  }

}
$(document).ready(function(){
	$('#test5 tbody tr').each(function(){
		var rid = $(this).attr('rid');
		var confirmed = false;
		/*if($("#test5 tbody tr[rid='"+rid+"'] select option[selected='selected']").text() == "Confirmat"){
			confirmed = true;
			var id = $("#test5 tbody tr[rid='"+rid+"']").find('select option[selected="selected"]').parent().attr("id");
			console.log("test");
		}*/
		var id = "none";
		$("#test5 tbody tr[rid='"+rid+"'] select option[selected='selected']").each(function(){
			if($(this).text() == "Confirmat"){

				confirmed = true;
				id = $(this).parent().attr("id");
				console.log(id);
			}
			//console.log(rid+" "+$(this).find('select option[selected="selected"]').text());
		});
		if(confirmed == true){
			$("#test5 tbody tr[rid='"+rid+"'] select").each(function(){
				if($(this).attr("id") != id){
					$(this).attr('disabled','disabled');
				}
			});
		}
		
	});
});

