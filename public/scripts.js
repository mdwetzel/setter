$(function() {
	//$('form').slideUp('medium');
	
	$('.header').click(function() {
		$(this).nextUntil('tr.header').slideToggle();
	});
});