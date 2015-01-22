$(window).load(function() {
	adjustStyle($(this).width(), $(this).height());
});


$(window).resize(function() {
	adjustStyle($(this).width(), $(this).height());
});

function adjustStyle(width, height) {
    width = parseInt(width);
    height = parseInt(height);
    
    if (width < 350) {
        $('#logo_area').css('margin', '0 auto').css('width', width*0.44).css('max-width', width*0.44);
        $('#logo').css('width', width*0.44);
    	$('#account').css('margin', '0 auto').css('width', width).css('max-width', width);
    	$('#welcome').css('margin', '0 auto').css('width', width).css('max-width', width);
    } else {
    	$('#logo_area').css('margin', '0 auto').css('width', '154px').css('max-width', '154px');
    	$('#logo').css('width', '154px');
    	$('#account').css('margin', '0 auto').css('width', '350px').css('max-width', '350px');
    	$('#welcome').css('margin', '0 auto').css('width', '385px').css('max-width', '385px');
    }
    
    if(height < 420) {
    	$('#logo_area').css('margin-top', '20px').css('margin-bottom', '20px');
    } else {
    	$('#logo_area').css('margin-top', (height-500)/2).css('margin-bottom', '20px');
    }
}