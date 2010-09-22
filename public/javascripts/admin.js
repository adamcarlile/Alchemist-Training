function loadAppSpecificAdminJavascript()
{
		
	$('div#Callouts div.active ul.callouts').sortable({
	  dropOnEmpty:false, 
	  cursor: 'move',
	  opacity: 0.8,
	  scroll: true,
	  update: function(){
	    $.ajax({
	        type: 'post', 
	        data: $('div#Callouts div.active ul.callouts').sortable('serialize'), 
	        dataType: 'script', 
	        url: callout_sort_path
				})
	    }
	  })
}