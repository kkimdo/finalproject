$(function(){
$('.area_list li a').click(function () {
	$(this).addClass('on');
});
});

/*
		R.area.find(R.areaZone).on('click', 'a', function () { // 영화지역탭 클릭이벤트
        var idx = $(this).parent().parent().index();
        $(this).addClass('on').parent().next().addClass('on').parent().siblings().find('.area_cont').removeClass('on').prev().find('a').removeClass('on');

        // 2016.05.13 웹접근성
        $('.area_zone').find('.blind').remove();

        if ($(this).find('.blind').length == 0) {
            $(this).append('<div class="blind">선택됨</div>');
        }
    });
});*/