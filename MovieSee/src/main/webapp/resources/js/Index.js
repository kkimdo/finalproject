$(function(){
$('.slidePoster li').mouseenter(function () {
            //console.log($(this).index());
            $(this).addClass('hover');
        }).mouseleave(function () {
            $(this).removeClass('hover');
        });

        $('.slidePoster li > a').focusin(function () {
            $(this).parent().addClass('hover').siblings().removeClass('hover');
        });
});

$(document).ready(function(){
	var sBtn = $(".header .gnb > ul > li")
	sBtn.find(" > a").click(function(){
	sBtn.removeClass("active");
		$(this).parent().addClass("active");
	});
});

$(function(){
	$('.curr_list li').mouseenter(function () {
	            //console.log($(this).index());
	            $(this).addClass('hover');
	        }).mouseleave(function () {
	            $(this).removeClass('hover');
	        });

	        $('.curr_list li > a').focusin(function () {
	            $(this).parent().addClass('hover').siblings().removeClass('hover');
	        });
	});

	