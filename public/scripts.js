$(function() {
	$('.header').click(function() {
		$(this).nextUntil('tr.header').slideToggle();
	});
});