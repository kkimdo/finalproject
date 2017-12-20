
/************************************************************************************************* 
 *  @Author : 이인수 (is@madive.co.kr)
 *  @Description : web 티켓 예매
 *  @Version  1.1.3
************************************************************************************************/

var ticketUtill;
var timeUtill;
var activeUtill;
var playUtill;
var ticketCookie;
var _movieCode; //선택한 영화코드
var ticketReservation;

var groupBy = function (xs, key) {
	return xs.reduce(function (rv, x) {
		(rv[x[key]] = rv[x[key]] || []).push(x);
		return rv;
	}, {});
};

$(function () {

    $.fn.ticketReservation = function (option) {
        var S = $.extend({ target: '', member: '', step: 0, leng: 'KR', screenData: '1', areaData: '1', cinemaData: '1016', movieData: '' }, option);

        // class="ticket_booking"으로 설정된 div
        this.target = $(S.target);
        // 날짜 출력 영역
        this.calendar = this.target.find('.calendar');
        // 전체영화관 및 스페셜관 전체 출력 영역
        this.area = this.target.find('.theater_zone');
        // 전체영화관 및 스페셜관 탭 선택 시 출력되는 영화관 영역
        this.cinema = '.area_list';
        // 영화관 지역 목록
        this.areaZone = '.area_zone';
        // 전체영화관 및 스페셜관 탭 영역
        this.areaTab = this.target.find('.theater_list');
        // 탭의 기본 선택 값(전체영화관)
        this.areaTabVar = 0;
        // 영화 목록 출력 영역
        this.movie = this.target.find('.movie_list');
        // 마이영화관 출력 영역
        this.favoriteLogin = this.target.find('.ticket_My');
        // 로그인 시 출력되는 마이영화관 목록
        this.favorite = this.target.find('.favorite_list');
        // 회차 출력 영역
        this.timeArea = this.target.find('.time_inner');
        // 상영시간의 영화별조회 탭 선택시 회차정보를 표현하는 div 태그
        this.timeList = this.target.find('.time_list01');
        // 상영시간의 영화관별조회 탭 선택시 회차정보를 표현하는 div 태그
        this.cineList = this.target.find('.time_list02');
        this.favoriteCinema = '';
        // 회차 출력 시 영화명 바로 하단의 각 회차를 감싸는 영역
        this.viewPass = this.target.find('.time_box').find('dd');

        // 영화관 종류(일반 or 스페셜관) 기본값 설정
        this.movieType = '1';

        // 예매 진입 체크 '0':일반진입, '1':영화관선택 진입, '2':영화선택 진입(쿠키로 대체됨)
        this.step = S.step;
        this.stepData = S.stepData; // (X)
        this.date = '';
        // 날자 영역을 좌우로 드래그 시 드래그 가능 횟수
        // 드래그 가능 여부를 판단(현재 드래그 횟수와 총 드래그 가능 횟수 비교)
        this.dateTotal = 0;
        // 현재 드래그 횟수
        this.dateCurNo = 0;
        // 현재 선택한 날짜의 인덱스
        // 예매 화면에서 선택한 날짜는 쿠키에 저장
        this.dateCookie = 0;
        // 이벤트 등록 여부
        // 화면 초기 로딩 시에만 이벤트 등록을 위해
        this.eventFalse = true;

        // 선택한 영화관 유형 저장(최대 2개) - 일반관(1), 스페셜관(2)
        this.screenArray = new Array(); // 선택 타입
        // 선택 지역 저장(최대 2개)
        this.areaArray = new Array(); // 선택 지역
        // 선택한 영화관 코드 저장(최대 2개) - 1016(월드타워)
        this.cinemaArray = new Array(); // 선택 극장(쿠키에 저장하기 위한 영화관 정보)
        this.cinemaCount = 0; // 선택극장 갯수

        // 영화관이 선택된 상태로 예매 화면으로 진입했을 경우
        if (this.step == 1) {
            this.screenArray = new Array(S.screenData); // 선택 타입
            this.areaArray = new Array(S.areaData.substr(-1)); // 선택 지역
            this.cinemaArray = new Array(S.cinemaData); // 선택 극장
            this.cinemaCount = 1; // 선택극장 갯수
        };

        this.movieCount = 0; // 선택영화 갯수
        this.movieArray = new Array(); // 선택 영화
        this.sortBull = true;// 쿠키에 저장된 데이터를 기반으로 초기 화면 설정 (X)

        this.cinemaCurNo = 0; // 지역선택 정보 (X)
        // 예매 화면에서 선택한 영화관 정보
        this.cinemaSelect = new Array();
        // 쿠키에 저장된 선택 날짜가 있을 경우 저장
        this.cookieDate = '';
        // 영화 목록의 예매순, 평점순 정렬 항목
        this.cookieSort = this.target.find('.movie_cont').find('.tkMTab').find('a').first().attr('data-sort');
        // 상영시간 영역의 전체, 2D, 3D 선택 상자에서 첫번째 항목의 값 저장
        this.cookieDraw = this.target.find('.time_inner').find('.select_box').find('select').find('option').first().val();

        this, activeCinema = '';//(X)
        this, activeMovie = '';//(X)

        // 회원정보
        this.member = S.member;
        // 현재 선택된 언어
        this.leng = S.leng;

        // 요일정보
        this.monthArray = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
        // 상영관 코드 정보(일반관:100, 샤롯데:300 등)
        this.specialType = new Array();
        this.noMovie = this.timeArea.find('.time_noData');
        this.noDataText = '상영시간이 조회되지 않았습니다.';
        this.noDataText2 = 'Running time cannot be found.';

        // 회원 정보
        // 쿠키에 저장된 회원 정보를 memberInfo 변수로 저장한 경우가 아닐 경우 로그인 상태를 false로 설정
        if (memberInfo.MemberNoOn == 'undefined' || memberInfo.MemberNoOn == '' || memberInfo.MemberNoOn == null) {
            this.login = false;
            this.memberID = '';
        } else {
            this.login = true;
            this.memberID = memberInfo.MemberNoOn;
        };

        // 초기설정
        this.init();
    };

    $.fn.ticketReservation.prototype = {
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 예메 데이터 리셋
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        init: function () {

            //설정위치 이동 $('.ad_pic').hide();
            //$('.footBnImg').hide();
            // 좌석 쿠키 삭제
            $.fn.cookieChanges('del', 'ticketingState.seatSelect.SeatType', 'arr');
            $.fn.cookieChanges('del', 'ticketingState.seatSelect.SeatCodes', 'arr');
            $.fn.cookieChanges('del', 'ticketingState.seatSelect.seatArray', 'arr');
            $.fn.cookieChanges('del', 'ticketingState.seatSelect.transNo', '');
            $.fn.cookieChanges('del', 'ticketingState.goods', 'arr');

            // 예매 첫페이지 예매 정보 호출
            // 날짜, 영화관, 영화정보 호출
            var obj = { MethodName: "GetTicketingPage", channelType: "HO", osType: BrowserAgent(), osVersion: navigator.userAgent, memberOnNo: this.memberID };
            JsonCall(CinemaServiceDomain + '/LCWS/Ticketing/TicketingData.aspx', obj, this.jsonData);

            // 사용자가 선택한 예매 정보를 저장하는 쿠키에 저장하기 위한 예매 정보 객체 생성
            ticketCookie = $.cookie('ticketingState');
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 예메 데이터 로드 - 초기 예매 데이터 로딩
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        jsonData: function (data) {// 예매 첫페이지 예매 정보 설정
            try {
                ticketUtill = data.responseJSON;
                ticketReservation.cookieCheck();
            }
            catch (e) {
                //alert('ticketError');
            }
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 쿠키 체크 - 쿠키에 저장된 데이터가 있는지 여부
        // 예매 페이지나 다른 페이지에서 영화관, 영화등을 쿠키에 저장하고 이동했는지의 여부 판단
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        cookieCheck: function () {
            if (cookieJson != '' && cookieJson != 'undefined') {
                if (ticketUtill != 'undefinded') {
                    switch (this.step) { // 예매 진입 체크 '0':일반진입, '1':영화관선택 진입, '2':영화선택 진입(쿠키로 대체됨)
                        case 0:
                            this.dataDraw(true);
                            this.cinemaDraw(true);
                            break;
                        case 1:
                            this.dataDraw(true);
                            this.ticketingPlaySeq(); // 영화관 선택 정보가 있을 경우는 회차 정보까지 조회
                            break;
                    };
                };
            } else {
                this.dataDraw(false);
            };
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 데이터 드로우 - 달력 리스트, 영화관 리스트, 선호영화관 리스트, 영화 리스트
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        dataDraw: function (cookie) {
            var T = this;
            var html = '';

            // 상영일 목록을 저장
            var dateNode = $(ticketUtill.MoviePlayDates.Items.Items); //달력 노드
            var YearData = dateNode[0].Year; // 시작 년도
            var monthData = dateNode[0].Month; // 시작달

            T.cookieDate = cookieJson.ticketingState.ticketing.playDate; // 날짜 쿠키
            T.cookieSort = cookieJson.ticketingState.ticketing.sortMovieCode; // 영화 정렬 쿠키
            T.cookieDraw = cookieJson.ticketingState.ticketing.sortFilmCode; // 회차 정렬 쿠키

            // 상영일 목록 상단에 월과 년 영문월을 표현
            T.calendar.find('fieldset').append('<span class="month" style="top:-47px; left:47px;"><em>' + monthData + '</em><span>' + YearData + ' ' + T.monthArray[monthData - 1] + '</span></span>');

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // 달력 드로우
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            T.dateTotal = Math.ceil(dateNode.length / 14) - 1;
            var dateInterval = 0;

            // 상영일 목록을 화면에 출력
            dateNode.each(function (n) {
                if (T.leng == 'KR') {
                    var weekData = $(this)[0].DayOfWeekKR; // 요일 string
                } else {
                    var weekData = $(this)[0].DayOfWeekEN; // 요일 string
                };

                var YearData2 = $(this)[0].Year; // 시작 년도
                var monthData2 = $(this)[0].Month; // 시작달
                var dayData = $(this)[0].Day; // 일 string
                var playData = $(this)[0].PlayDate; // 일 string
                var activeDate = $(this)[0].IsPlayDate;
                var holiday = $(this)[0].HolidayYN;

                if (T.cookieDate == playData) T.dateCookie = n;

                html = '<input type="radio" name="day" value="' + playData + '" id="' + T.monthArray[monthData2 - 1] + dayData + '">';
                html += '<label for="' + T.monthArray[monthData2 - 1] + dayData + '" class="month-picker-label" style="left:' + (n * 60) + 'px"><span>' + weekData + '</span><em>' + dayData + '</em></label>';
                T.calendar.find('.calendarArea').append(html).find('label').eq(n).data({ 'date': playData, 'year': YearData2, 'month': monthData2, 'day': dayData, 'week': weekData, 'active': activeDate });

                if (activeDate == 'N') {
                    T.calendar.find('.calendarArea').find('input').eq(n).attr('disabled', true);
                    T.calendar.find('.calendarArea').find('label').eq(n).addClass('noDate');
                };

                // 주말 여주에 따라 클래스 적용
                switch (weekData) { //주말 체크
                    case '토':
                    case 'SAT':
                        T.calendar.find('.calendarArea').find('label').eq(n).addClass('sat');
                        break;
                    case '일':
                    case 'SUN':
                        T.calendar.find('.calendarArea').find('label').eq(n).addClass('sun');
                        break;
                };

                // 공유일 여부에 따라 클래스 적용
                if (holiday == 'Y') {
                    T.calendar.find('.calendarArea').find('label').eq(n).addClass('sun');
                };

                // 년도가 변경되거나 월이 바뀔 경우
                if (monthData != monthData2) { // 년도 및 월 체인지 체크
                    monthData = monthData2;
                    YearData = YearData2;
                    // 이전월이나 이전년도와 다를 경우는 해당 월 년영문월을 상영일 상단에 출력
                    var pos = T.calendar.find('.calendarArea').find('label').last().position();
                    T.calendar.find('fieldset').append('<span class="month" style="top:-47px; left:' + ((pos.left) + 47) + 'px"><em>' + monthData2 + '</em><span>' + YearData2 + ' ' + T.monthArray[monthData2 - 1] + '</span></span>');

                    // 상영일 우측 >에 noData 클래스 추가
                    if (activeDate == 'N') T.calendar.find('fieldset').find('> span').last().addClass('noDate');

                    // 좌측 < 비활성화
                    if (n > 0 && n < 3) {
                        T.calendar.find('fieldset').find('> span').eq(0).hide();
                    };

                    // 우측 > 비활성화
                    if (n >= 11 && n <= 13) {
                        T.calendar.find('fieldset').find('> span').last().find('span').hide();
                    };

                    // 우측 > 비활성화
                    if (n > 13) {
                        T.calendar.find('fieldset').find('> span').last().hide();
                    };
                };
            });

            // 쿠키에 저장된 날자가 있을 경우
            if (T.cookieDate != '') {
                // 쿠키에 저장된 날짜를 기본 선택 상태로 설정
                T.calendar.find('.calendarArea').find('input').eq(T.dateCookie).prop('checked', true).next().addClass('ckon');
                T.calendar.find('.calendarArea').find('label').eq(T.dateCookie).data('date');
                T.date = T.calendar.find('.calendarArea').find('input').eq(T.dateCookie).val();

                T.dateCurNo = Math.ceil((T.dateCookie + 1) / 14) - 1;
                if (T.dateCurNo == -1) T.dateCurNo = 0;
                // 쿠키에 저장된 상영일을 선택 상태로 설정하고 상영일 출력 영역의 위치 조정 
                T.calendar.find('.calendarArea').find('label').css({ 'left': '-=' + (840 * T.dateCurNo) });
                T.calendar.find('fieldset').find('> span').css({ 'left': '-=' + (840 * T.dateCurNo) });

                // 선택 내용을 보여주는 화면 중간 영역에 상영일 텍스트 설정
                $('.viewCinemaDate').text(T.calendar.find('.calendarArea').find('label').eq(T.dateCookie).data('year') + '.' + T.calendar.find('.calendarArea').find('label').eq(T.dateCookie).data('month') + '.' + T.calendar.find('.calendarArea').find('label').eq(T.dateCookie).data('day') + '(' + T.calendar.find('.calendarArea').find('label').eq(T.dateCookie).data('week') + ')');

                // 쿠키에 선택 상영일 저장
                $.fn.cookieChanges('add', 'ticketingState.ticketing.playWeek', T.calendar.find('.calendarArea').find('label').eq(T.dateCookie).data('week'));
            } else {
                // 쿠키에 저장된 상영일 정보가 없다면 첫번째 항목을 기본으로 선택
                T.calendar.find('.calendarArea').find('input').first().prop('checked', true).next().addClass('ckon');
                T.calendar.find('.calendarArea').find('label').first().data('date');
                T.date = T.calendar.find('.calendarArea').find('input').first().val();

                $('.viewCinemaDate').text(T.calendar.find('.calendarArea').find('label').first().data('year') + '.' + T.calendar.find('.calendarArea').find('label').first().data('month') + '.' + T.calendar.find('.calendarArea').find('label').first().data('day') + '(' + T.calendar.find('.calendarArea').find('label').first().data('week') + ')');

                // 쿠키에 선택 상영일 저장
                $.fn.cookieChanges('add', 'ticketingState.ticketing.playDate', T.calendar.find('.calendarArea').find('label').first().data('date'));
                // 쿠키에 선택 상영일에 해당하는 주차 저장
                $.fn.cookieChanges('add', 'ticketingState.ticketing.playWeek', T.calendar.find('.calendarArea').find('label').first().data('week'));
            };

            // 상영일 개수가 15보다 작으면 우측 > 에 nodata 클래스 추가
            if (dateNode.length < 15) {
                T.calendar.find('> a').addClass('nodata');
            } else {
                // 첫번째 상영일 세트를 보고 있다면 좌측 < 에 더이상 이동할 상영일 세트가 없다는 의미의 nodata 클래스 추가
                if (T.dateCurNo == 0) {
                    T.calendar.find('.prev').addClass('nodata').siblings('a').removeClass('nodata');
                // 마지막 상영일 세트로 이동했다면 우측 > 에 nodata 클래스 추가
                } else if (T.dateCurNo == T.dateTotal) {
                    T.calendar.find('.next').addClass('nodata').siblings('a').removeClass('nodata');
                // 마지막 상영일 세트로 이동하지 않았다면 우측 > 에 nodata 클래스 삭제
                } else if (T.dateCurNo > 0 && T.dateCurNo < T.dateTotal) {
                    T.calendar.find('> a').removeClass('nodata');
                };
            };
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 영화관 드로우
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        cinemaDraw: function () {
            var T = this;
            var html = '';

            // 로그인 상태에서 마이영화관 설정 정보가 있다면 해당 내용을 저장
            if (T.login && ticketUtill.FavoriteCinemas.Cinemas != null) {
                var favoriteNode = $(ticketUtill.FavoriteCinemas.Cinemas.Items); //선호영화관 노드
            };
            
            var areaNode = $(ticketUtill.CinemaDivison.AreaDivisions.Items); //지역 노드
            var specialNode = $(ticketUtill.CinemaDivison.SpecialTypeDivisions.Items); //스페셜관 노드
            var cinemaNode = $(ticketUtill.Cinemas.Cinemas.Items); //영화관 노드

            T.cinemaCount = cookieJson.ticketingState.ticketing.cinemaCodes.length; // 영화관 갯수 쿠키
            T.cinemaArray = cookieJson.ticketingState.ticketing.cinemaCodes; //영화관 쿠키
            T.screenArray = cookieJson.ticketingState.ticketing.screentype; //스크립 타입 쿠키
            T.areaArray = cookieJson.ticketingState.ticketing.areaCodes; //지역 타입 쿠키

            // SortSequnce 값에 맞게 각 데이터 정렬
            areaNode.sort(function (a, b) { // 지역 정렬
                return a.SortSequence < b.SortSequence ? -1 : a.SortSequence > b.SortSequence ? 1 : 0;
            });
            specialNode.sort(function (a, b) { // 스페셜관 정렬
                return a.SortSequence < b.SortSequence ? -1 : a.SortSequence > b.SortSequence ? 1 : 0;
            });
            cinemaNode.sort(function (a, b) { // 영화관 정렬
                return a.SortSequence < b.SortSequence ? -1 : a.SortSequence > b.SortSequence ? 1 : 0;
            });

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // MY영화관 드로우
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //***********************************************************************************************************
            //2016. 01. 10. by johnharu
            // 회원 여부를 판단하는 필드로 MemberGubun 대신 LotteCinemaMemberGubun 으로 수정
            // LotteCinemaMemberGubun 값의 유형
            // 1 : 정회원
            // 2 : 간편회원(준회원)
            // 3 : 비회원
            //***********************************************************************************************************
            if (memberInfo.LotteCinemaMemberGubun == '1') {
                // 로그인 전 메시지 출력 영역을 비활성화
                T.favoriteLogin.find('.list').show().siblings('dd').hide();
                // 마이시네마 목록이 하나 이상일 경우
                if (ticketUtill.FavoriteCinemas.Cinemas.Items.length > 0) { // 데이터 체크
                    // 로그인 후 출력되는 메시지 중 'MY 영화관을 등록해 주십시오' 부분을 숨김처리
                    T.favoriteLogin.find('.list').find('span').hide();

                    // 마이시네마 목록을 화면에 노출
                    favoriteNode.each(function (n) {
                        var categorData = $(this)[0].DivisionCode;
                        var subData = $(this)[0].DetailDivisionCode;
                        var codeData = $(this)[0].CinemaID;

                        if (T.leng == 'KR') {
                            var favoritData = $(this)[0].CinemaNameKR;
                        } else {
                            var favoritData = $(this)[0].CinemaNameUS;
                        };

                        html = '<li class="' + categorData + '' + subData + '' + codeData + '">';
                        html += '   <a href="#"><em>' + favoritData + '</em></a>';
                        html += '</li>';

                        T.favorite.append(html).find('a').eq(n).data({ 'type': categorData, 'area': subData, 'code': codeData, 'favorit': favoritData, 'cinemaSelect': categorData + '' + subData + '' + codeData });

                        if (n == 0) {
                            T.favorite.find('li').eq(0).addClass('on');
                            T.favoriteCinema = { 'type': categorData, 'area': subData, 'code': codeData, 'name': favoritData };
                            if (categorData == T.movieType) {
                                T.areaTabVar = 0;
                                T.areaTab.find('li').first().addClass('on');
                            } else {
                                T.areaTabVar = 1;
                                T.areaTab.find('li').last().addClass('on');
                            };
                        };
                    });
                } else {
                    // 로그인 상태이지만 마이시네마를 등록하지 않았다면 'MY 영화관을 등록해 주십시오' 문구 노출
                    T.favoriteLogin.find('.list').find('span').show();
                };
            // 비회원 로그인 상태일 경우는 '정회원으로 로그인하시면 MY영화관을 확인하실 수 있습니다.' 문구 노출
            } else if (memberInfo.LotteCinemaMemberGubun == '3') {
                T.favoriteLogin.find('.other').show().siblings('dd').hide();
                T.area.eq(0).find('.area_cont').eq(0).addClass('on');
                T.area.eq(0).find('.area_zone').eq(0).find('a').addClass('on');
            // 비로그인 상태일 경우는 '로그인 후 확인하실 수 있습니다.' 문구 노출
            } else {
                T.favoriteLogin.find('.default').show().siblings('dd').hide();
            };

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // 지역 드로우 - 영화관 지역 목록을 화면에 출력
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            areaNode.each(function (n) {
                var areaData = $(this)[0].DivisionCode;
                var typeData = $(this)[0].DetailDivisionCode;
                var noData = $(this)[0].SortSequence;
                var countData = $(this)[0].CinemaCount;

                if (T.leng == 'KR') {
                    var nameData = $(this)[0].GroupNameKR;
                } else {
                    var nameData = $(this)[0].GroupNameUS;
                }

                html = '<li>';
                // 2016.05.03 웹접근성
                html += '   <span class="area_zone"><a href="#"><h4>' + nameData + '(<em>' + countData + '</em>)</h4></a></span>';
                html += '   <div class="area_cont">';
                html += '       <ul class="area_list d' + typeData + '">';
                html += '       </ul>';
                html += '   </div>';
                html += '</li>';

                T.area.eq(0).append(html).find('> li').eq(n).addClass('area' + typeData).data({ 'count': countData }).find('.area_zone').find('> a').data({ 'code': areaData, 'name': nameData, 'type': typeData, 'count': countData });

                //if (T.login) {
                //    console.log(ticketUtill.FavoriteCinemas.Cinemas);
                //    if (ticketUtill.FavoriteCinemas.Cinemas != null) { // 데이터 체크
                //        if (T.areaTabVar == 0 && T.favoriteCinema.area == typeData) {
                //            T.area.eq(T.areaTabVar).find('.area_zone').eq(n).find('> a').addClass('on').parent().next('.area_cont').addClass('on');
                //        };
                //    } else {
                //        T.area.eq(0).find('.area_cont').eq(0).addClass('on');
                //        T.area.eq(0).find('.area_zone').eq(0).find('a').addClass('on');
                //    };
                //} else {
                //    T.area.eq(0).find('.area_cont').eq(0).addClass('on');
                //    T.area.eq(0).find('.area_zone').eq(0).find('a').addClass('on');
                //};
                T.area.eq(0).find('.area_cont').eq(0).addClass('on');
                T.area.eq(0).find('.area_zone').eq(0).find('a').addClass('on');

                // 2016.05.13 웹접근성
                if (T.area.eq(0).find('.area_zone').eq(0).find('a').find('.blind').length == 0) {
                    T.area.eq(0).find('.area_zone').eq(0).find('a').append('<div class="blind">선택됨</div>');
                }
            });

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // 스페셜 드로우 - 스페셜관 목록을 화면에 출력
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            specialNode.each(function (n) {
                var areaData = $(this)[0].DivisionCode;
                var typeData = $(this)[0].DetailDivisionCode;
                var noData = $(this)[0].SortSequence;
                var countData = $(this)[0].CinemaCount;
                if (T.leng == 'KR') {
                    var nameData = $(this)[0].GroupNameKR;
                } else {
                    var nameData = $(this)[0].GroupNameUS;
                };

                html = '<li>';
                html += '   <span class="area_zone"><a href="#">' + nameData + '(<em>' + countData + '</em>)</a></span>';
                html += '   <div class="area_cont">';
                // 2016.05.03 웹접근성법
                html += '       <h5 class="blind">' + nameData + '</h5>';
                html += '       <ul class="area_list s' + typeData + '">';
                html += '       </ul>';
                html += '   </div>';
                html += '</li>';

                T.specialType[n] = typeData;
                T.area.eq(1).append(html).find('> li').eq(n).addClass('area' + typeData).data({ 'count': countData }).find('.area_zone').find('> a').data({ 'name': nameData, 'area': areaData, 'type': typeData, 'count': countData });

                if (1 == T.areaTabVar && T.favoriteCinema.area == typeData) {
                    T.area.eq(T.areaTabVar).find('.area_zone').eq(n).find('> a').addClass('on').parent().next('.area_cont').addClass('on');
                };
            });

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // 영화관 드로우
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            var areaCount = null, cinemaCount = 0, specialCount = 0; // 가상데이터 카운트 변수
            cinemaNode.each(function (n) {
                var typeData = $(this)[0].DivisionCode;
                var areaData = $(this)[0].DetailDivisionCode;
                var codeData = $(this)[0].CinemaID;
                var noData = $(this)[0].SortSequence;
                var spVar = 0;

                if (T.leng == 'KR') {
                    var nameData = $(this)[0].CinemaNameKR;
                } else {
                    var nameData = $(this)[0].CinemaNameUS;
                }

                var html = '<li>';
                html += '   <a href="#">' + nameData + '</a>';
                html += '</li>';

                // 전체영화관, 스페셜관 탭 영역과 각 지역에 맞게 영화관을 추가
                if (typeData != T.movieType) { // 데이터 분기 '100' 은 일반 영화관
                    T.area.eq(1).find('.s' + areaData).append(html).find('a').last().addClass(typeData + '' + areaData + codeData).data({ 'code': codeData, 'area': areaData, 'type': typeData, 'name': nameData, 'cinemaSelect': typeData + '' + areaData + '' + codeData });
                } else {
                    T.area.eq(0).find('.d' + areaData).append(html).find('a').last().addClass(typeData + '' + areaData + codeData).data({ 'code': codeData, 'area': areaData, 'type': typeData, 'name': nameData, 'cinemaSelect': typeData + '' + areaData + '' + codeData });
                };
            });

            // 첫번째 지역을 선택 상태로 설정
            T.area.eq(0).find('.area_cont').eq(0).addClass('on');

            T.movieDraw();

            // 선택된 지역에 추가
            // 2016.05.19 웹접근성
            $.each($('.area_cont').find('a.on'), function () {
                if ($(this).find('.blind').length == 0) {
                    $(this).append('<div class="blind">선택됨</div>');
                }
            });
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 영화 드로우
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        movieDraw: function (sortVar) {
            var T = this;
            // 영화 출력 영역을 초기화
            T.movie.empty();

            // 영화 목록을 저장
            var movieNodes = $(ticketUtill.Movies.Movies.Items);

            T.movieCount = cookieJson.ticketingState.ticketing.movieCodes.length; //영화 갯수 쿠키
            T.movieArray = cookieJson.ticketingState.ticketing.movieCodes; //영화 쿠키

            // 예매순, 평점순에 따라 영화를 정렬할 것인지, 
            // BookingsortSequence에 따라 영화를 정렬할 것인지
            if (sortVar) {
                movieNodes.sort(function (a, b) { // 영화 소트
                    return a[sortVar] < b[sortVar] ? -1 : a[sortVar] > b[sortVar] ? 1 : 0;
                });
            } else {
                movieNodes.sort(function (a, b) { // 영화 소트
                    return a.BookingSortSequence < b.BookingSortSequence ? -1 : a.BookingSortSequence > b.BookingSortSequence ? 1 : 0;
                });
            };

            // 영화데이터를 이용해 화면에 영화 목록을 출력
            movieNodes.each(function (n) {
                var ageData = $(this)[0].ViewGradeCode;
                var ageData2 = ageData;
                var movieCode = $(this)[0].RepresentationMovieCode;
                var ticketing = $(this)[0].BookingRate;
                var releaseSort = $(this)[0].ReleaseDate;
                var viewSort = $(this)[0].ViewSortSequence;
                var bookingSort = $(this)[0].BookingSortSequence;
                if (T.leng == 'KR') {
                    var subjectData = $(this)[0].MovieNameKR;
                    var ageView = $(this)[0].ViewGradeNameKR;
                } else {
                    var subjectData = $(this)[0].MovieNameUS;
                    var ageView = $(this)[0].ViewGradeNameUS;
                };

                if (ageData == 00) {
                    if (T.leng == 'KR') {
                        ageData = '전체';
                        ageData2 = 'all';
                    } else {
                        ageData = 'all';
                        ageData2 = 'all2';
                    };
                };

                if (ageData == 18) {
                    if (T.leng != 'KR') {
                        ageData = '18';
                        ageData2 = '19';
                    }
                };

                html = '<li><a href="javascript:void(0);" class="mov' + movieCode + '"><span class="grade_' + ageData2 + '">' + ageData + '</span><em>' + subjectData + '</em></a></li>';

                T.movie.append(html);

                T.movie.find('a').eq(n).data({ 'code': movieCode, 'name': subjectData, 'sortTicketing': ticketing, 'releaseSort': releaseSort, 'viewSort': viewSort, 'bookingSort': bookingSort });
            });

            if (T.eventFalse) {
                T.eventFalse = false;

                // a 태그의 href="#"으로 등록된 내용을 'javascript:void(0)'으로 변환
                $.fn.linkHashChange();
                // 이벤트 등록
                T.event();

                // 마이영화관이 하나 이상일 경우 마이영화관을 기본 선택 상태로 설정
                if (T.favoriteCinema != '' && T.cinemaArray.length < 1) {
                    T.favoriteSet();
                // 사용자의 예매 선택 상태를 저장하는 쿠키에 저장된 영화관이나 영화가 있을 경우는 해당 내용을 기본 선택 상태로 설정 
                } else if (T.cinemaArray.length > 0 || T.movieArray.length > 0) {
                    T.cinemaMemory();
                };
            };

            T.activeList(T.date);
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 선호영화관에 의한 체크 설정
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        favoriteSet: function () {
            var Z = this;

            // 마이영화관의 상영관유형, 지역코드, 상영관코드 조합으로 클래스 정의
            var insCode = '.' + Z.favoriteCinema.type + '' + Z.favoriteCinema.area + '' + Z.favoriteCinema.code;

            // 마이영화관이 소속된 지역을 선택 상태로 설정
            Z.area.eq(Z.favoriteCinema.type - 1).find('.area' + Z.favoriteCinema.area).find('.area_zone').find('a').addClass('on');
            Z.area.eq(Z.favoriteCinema.type - 1).find('.area' + Z.favoriteCinema.area).find(insCode).addClass('on');

            Z.area.find('.area_cont').removeClass('on');
            Z.area.find('.area_zone').find('a').removeClass('on');

            // 영화관을 선택 상태로 설정
            Z.area.find('.area' + Z.favoriteCinema.area).find('.area_cont').addClass('on').prev().find('a').addClass('on');

            // 마이영화관의 첫번재 영화관을 선택 상태로 저장
            Z.screenArray[0] = Z.favoriteCinema.type;
            Z.areaArray[0] = Z.favoriteCinema.area;
            Z.cinemaArray[0] = Z.favoriteCinema.code;
            Z.cinemaSelect[0] = Z.favoriteCinema.type + '' + Z.favoriteCinema.area + '' + Z.favoriteCinema.code;
            Z.cinemaCount++;

            try {
                // 20160920 - FileLog 추가
                setFileLog(Z.favoriteCinema.code, Z.favoriteCinema.name, 1, "선호영화관", 1);
            } catch (e) { }

            // 화면 중앙의 선택 정보를 출력하는 영역에 선택된 영화관 설정
            var html = '<li>' + Z.favoriteCinema.name + '<a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_mv_close.gif" alt="close" /></a></li>';
            $('.viewCinemaList').prev('span').hide();
            $('.viewCinemaList').append(html).parent().find('li').eq(0).addClass(Z.screenArray[0] + '' + Z.areaArray[0] + '' + Z.cinemaArray[0]).data({ 'type': Z.screenArray[0], 'area': Z.areaArray[0], 'code': Z.cinemaArray[0], 'cinemaSelect': Z.screenArray[0] + '' + Z.areaArray[0] + '' + Z.cinemaArray[0] });

            // 마이영화관을 선택된 영화관으로 쿠키에 저장
            $.fn.cookieChanges('add', 'ticketingState.ticketing.screentype', Z.screenArray);
            $.fn.cookieChanges('add', 'ticketingState.ticketing.areaCodes', Z.areaArray);
            $.fn.cookieChanges('add', 'ticketingState.ticketing.cinemaCodes', Z.cinemaArray);

            // 선택된 영화가 있을 경우 화면 중앙의 선택 정보를 출력하는 영역에 선택된 영화 설정
            if (Z.movieCount > 0) {
                $('.viewMovieList').prev('span').hide();

                for (i = 0; i < Z.movieCount; i++) {
                    var html = '<li class="mov' + Z.movieArray[i] + '">' + Z.movie.find('.mov' + Z.movieArray[i]).find('em').text() + '<a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_mv_close.gif" alt="close" /></a></li>';
                    $('.viewMovieList').append(html);
                };
            } else {
            }

            if (Z.movieCount > 0) {
                $('.viewMovieList').empty().prev('span').hide();

                for (i = 0; i < this.movieCount; i++) {
                    if (i < 2) {
                        if (Z.movie.find('a').hasClass('mov' + Z.movieArray[i])) {
                            var html = '<li class="mov' + Z.movieArray[i] + '">' + Z.movie.find('.mov' + Z.movieArray[i]).find('em').text() + '<a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_mv_close.gif" alt="close" /></a></li>';

                            $('.viewMovieList').append(html);

                            Z.movie.find('.mov' + Z.movieArray[i]).addClass('on');
                        };
                    };
                };
            };

            var cinemaList = '';
            for (i = 0; i < Z.screenArray.length; i++) {
                if (i == 1) cinemaList += ','
                cinemaList += Z.screenArray[i] + '|' + Z.areaArray[i] + '|' + Z.cinemaArray[i];
            };

            // 선택 영화관이 있을 경우 선택된 상영일과 영화관 정보를 이용해 예매 가능한 영화 목록을 가져옴
            // 예매 가능한 영화 목록은 활성화 상태로 표현하고, 그렇지 않으면 비활성화 상태로 표현(표현만 하고 클릭은 가능)
            if (cinemaList != '') {
                Z.activeList(Z.date);
            } else {
                Z.movie.find('a').removeClass('disabled');
            };

            Z.checkSlected();
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 쿠키에 의한 체크 설정 - 쿠키에 저장된 영화관 및 영화 정보를 설정
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        cinemaMemory: function () {
            this.sortBull = false;

            if (this.cinemaArray.length > 0) {
                $('.viewCinemaList').empty().prev('span').hide();

                this.favorite.find('li').removeClass('on');

                this.area.find('.area_cont').removeClass('on');
                this.area.find('.area_zone').find('a').removeClass('on');

                for (i = 0; i < this.cinemaArray.length; i++) {
                    if (i < 2) {
                        if (this.area.find('a').hasClass(this.screenArray[i] + '' + this.areaArray[i] + '' + this.cinemaArray[i])) {
                            this.cinemaSelect[i] = this.screenArray[i] + '' + this.areaArray[i] + '' + this.cinemaArray[i];

                            this.area.find('.area' + this.areaArray[i]).find('.' + this.cinemaSelect[i]).addClass('on');

                            this.favorite.find('.' + this.cinemaSelect[i]).addClass('on');

                            var html = '<li>' + this.area.find('.' + this.cinemaSelect[i]).text() + '<a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_mv_close.gif" alt="close" /></a></li>';

                            $('.viewCinemaList').append(html).parent().find('li').eq(i).addClass(this.cinemaSelect[i]).data({ 'type': this.screenArray[i], 'area': this.areaArray[i], 'code': this.cinemaArray[i], 'cinemaSelect': this.cinemaSelect[i] });
                            
                            try {
                                // 20160920 - FileLog 추가
                                setFileLog(this.cinemaArray[i], this.area.find('.' + this.cinemaSelect[i]).text(), 1, "쿠키값설정", 1);
                            } catch (e) { }

                            if (i == 0) {
                                var idx = this.target.find('.screen' + this.screenArray[i]).parent('.tab_cont').index();
                                this.target.find('.theater_list').find('a').removeClass('on').eq(idx).addClass('on');
                                this.target.find('.screen' + this.screenArray[i]).parents('.tab_cont').addClass('on').siblings('.tab_cont').removeClass('on');
                                this.target.find('.screen' + this.screenArray[i]).find('.area' + this.areaArray[i]).find('.area_zone').find('a').addClass('on');
                                if (this.areaArray[i] != '') {
                                    this.target.find('.theater_zone').find('.area_cont').removeClass('on');
                                    this.target.find('.screen' + this.screenArray[i]).find('.area' + this.areaArray[i]).find('.area_cont').addClass('on');
                                };
                            };
                        } else {
                            this.area.find('.area_zone').eq(0).find('a').addClass('on');
                            this.area.find('.area_zone').eq(0).next().show();
                        }
                    };
                };
            } else {
                this.area.eq(0).find('.area_cont').eq(0).addClass('on');
                this.area.eq(0).find('.area_zone').eq(0).find('a').addClass('on');
            }

            if (this.movieCount > 0) {
                $('.viewMovieList').empty().prev('span').hide();

                for (i = 0; i < this.movieCount; i++) {
                    if (i < 2) {
                        if (this.movie.find('a').hasClass('mov' + this.movieArray[i])) {
                            var html = '<li class="mov' + this.movieArray[i] + '">' + this.movie.find('.mov' + this.movieArray[i]).find('em').text() + '<a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_mv_close.gif" alt="close" /></a></li>';

                            $('.viewMovieList').append(html);
                            this.movie.find('.mov' + this.movieArray[i]).addClass('on');
                        };
                    };
                };
            };

            // 2016.05.13 웹접근성 영화 선택
            $.each(this.movie.find('a.on'), function () {
                if ($(this).find('.blind').length == 0) {
                    $(this).append('<div class="blind">선택됨</div>');
                }
            });

            this.activeList(this.date);

            if (this.cookieDraw != '') {
                this.target.find('.time_inner').find('.select_box').find('select').val(this.cookieDraw).change();
                var drawText = this.target.find('.time_inner').find('.select_box').find('select').find('option:selected').text();
                var drawIdx = this.target.find('.time_inner').find('.select_box').find('select').find('option:selected').index();
                this.target.find('.time_inner').find('.select_box').find('> a').text(drawText).next('ul').find('a').removeClass('on').eq(drawIdx).addClass('on');
            };

            if (this.cookieSort != '') {
                this.target.find('.movie_cont').find('.tkMTab').find('a.' + this.cookieSort).parent().addClass('on').siblings().removeClass('on');

                $.fn.linkHashChange();
                this.movieDraw(this.cookieSort);
            } else {
                this.target.find('.movie_cont').find('.tkMTab').find('li').first().addClass('on');
            };

            this.checkSlected();

            // 2016.05.13 웹접근성 영화관 선택
            $.each(T.area.find('.area_cont').find('a.on'), function () {
                if ($(this).find('.blind').length == 0) {
                    $(this).append('<div class="blind">선택됨</div>');
                }
            });
        },

        // 사용자가 선택한 상영일, 영화관 정보를 이용해 예매 가능한 영화 목록을 호출
        // 예매 가능한 영화 목록을 이용해 활성화 비활성화를 표현, 활성이건 비활성 상태이건 클릭은 가능
        activeList: function (playDt) {

            var cinemaList = '';
            var movieCd = '';

            if (this.screenArray.length > 0) {
                for (i = 0; i < this.screenArray.length; i++) {
                    if (i == 1) cinemaList += ','
                    // 20170630 - cinemaList에 'undefinded'가 포함되는 오류 수정
                    if (this.screenArray[i] != undefined && this.screenArray[i] != 'undefined' && this.screenArray[i] != null && this.screenArray[i] != "" && this.areaArray[i] != undefined && this.areaArray[i] != 'undefined' && this.areaArray[i] != null && this.areaArray[i] != "" && this.cinemaArray[i] != undefined && this.cinemaArray[i] != 'undefined' && this.cinemaArray[i] != null && this.cinemaArray[i] != "") {
                        cinemaList += this.screenArray[i] + '|' + this.areaArray[i] + '|' + this.cinemaArray[i];
                    }
                };
            } else {
                cinemaList = '';
            };

            if (this.movieArray.length > 0) {
                for (i = 0; i < this.movieArray.length; i++) {
                    if (i == 1) movieCd += ','
                    // 20170630 - cinemaList에 'undefinded'가 포함되는 오류 수정
                    if (this.movieArray[i] != undefined && this.movieArray[i] != 'undefined' && this.movieArray[i] != null && this.movieArray[i] != "") {
                        movieCd += this.movieArray[i];
                    }
                };
            } else {
                movieCd = '';
            };

            this.activeCinema = cinemaList;
            this.activeMovie = movieCd;

            if (movieCd == '') {
                this.area.find('> li').each(function () {
                    var cinemaSum = $(this).data('count');
                    $(this).find('.area_zone').find('em').text(cinemaSum);
                });
            };

            // 데이터 호출
            if (movieCd != '' || cinemaList != '') {
                var obj = {
                    MethodName: "GetInvisibleMoviePlayInfo", channelType: "HO", osType: BrowserAgent(), osVersion: navigator.userAgent
                    , cinemaList: cinemaList
                    , movieCd: movieCd
                    , playDt: playDt
                };

                JsonCall(CinemaServiceDomain + "/LCWS/Ticketing/TicketingData.aspx", obj, this.activeData);
            } else {
                this.area.find('a').removeClass('disabled');
                this.movie.find('a').removeClass('disabled');
            };
        },

        activeData: function (data) {// 예매 첫페이지 예매 정보 설정
            try {
                activeUtill = data.responseJSON;
                ticketReservation.activeAction();
            }
            catch (e) {
                //alert('ticketError');
            }
        },

        // 영화 목록의 활성화 비활성화 상태 표현
        activeAction: function () {
            var T = this;

            var cinema = $(activeUtill.Cinemas.Items);
            var movie = $(activeUtill.Movies.Items);

            T.area.find('a').removeClass('disabled');
            T.movie.find('a').removeClass('disabled');

            if (T.screenArray.length > 0) {
                movie.each(function () {
                    T.movie.find('.mov' + $(this)[0].RepresentationMovieCode).addClass('disabled');
                });
            };

            if (T.movieArray.length > 0) {
                cinema.each(function () {
                    T.area.find('.' + $(this)[0].DivisionCode + '' + $(this)[0].DetailDivisionCode + '' + $(this)[0].CinemaID).addClass('disabled');
                });

                T.area.find('> li').each(function () {
                    var cinemaSum = $(this).find('.area_list').find('a').not('.disabled').length;
                    $(this).find('.area_zone').find('em').text(cinemaSum);
                });
            };
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 이벤트
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        event: function () {
            var R = this;

            // 날짜 클릭 시 선택된 날짜를 화면 중앙의 선택 정보를 출력하는 상영일 영역에 표현
            // 선택 상영일에 따라 예매 가능한 영화 목록을 호출하고 영화 목록에 활성 비활성화 상태를 표현
            R.calendar.find('fieldset').on('click', 'input', function () { // 날짜 클릭이벤트
                if (!$(this).next().hasClass('noDate')) {
                    R.date = $(this).next().data('date');
                    R.week = $(this).next().find('span').text();
                    $(this).next().addClass('ckon').siblings('label').removeClass('ckon');
                    $.fn.cookieChanges('add', 'ticketingState.ticketing.playDate', R.date);
                    $.fn.cookieChanges('add', 'ticketingState.ticketing.playWeek', R.week);

                    if (R.step == 0) {
                        R.ticketingPlaySeq();
                    };

                    $('.viewCinemaDate').text($(this).next().data('year') + '.' + $(this).next().data('month') + '.' + $(this).next().data('day') + '(' + $(this).next().data('week') + ')');

                    R.movie.find('a').removeClass('disabled');
                    R.area.find('.area_list').find('a').removeClass('disabled');

                    R.activeList(R.date);
                };
            });

            // 화면 우측의 > 클릭 시 다음 상영일 세트로 이동
            R.calendar.find('> a').on('click', function () { // 날짜 이동
                if (!$(this).hasClass('nodata')) {
                    if (R.calendar.find('fieldset').find('label').is(':animated')) return false;
                    if ($(this).hasClass('prev')) {
                        if (R.dateCurNo > 0) {
                            R.dateCurNo--;
                            R.calendar.find('.calendarArea').find('label').animate({ 'left': '+=' + 840 }, 300);
                            R.calendar.find('fieldset').find('> span').animate({ 'left': '+=' + 840 }, 300, function () {
                                var ins = T.calendar.find('fieldset').find('> span').last().position();
                                if (ins.left > 880) {
                                    T.calendar.find('fieldset').find('> span').last().hide();
                                };
                            });

                            //if (n > 13) {
                            //    T.calendar.find('fieldset').find('> span').last().hide();
                            //};
                        } else {
                            $(this).addClass('nodata');
                            return false;
                        }
                    } else {
                        if (R.dateCurNo < R.dateTotal) {
                            R.dateCurNo++;
                            R.calendar.find('.calendarArea').find('label').animate({ 'left': '-=' + 840 }, 300);
                            R.calendar.find('fieldset').find('> span').show().animate({ 'left': '-=' + 840 }, 300);
                        } else {
                            $(this).addClass('nodata');
                            return false;
                        };
                    };
                    R.calendarMove();
                };
            });

            // 마이영화관 목록 중 특정 영화관을 선택했을 경우
            if (R.favoriteCinema != 'undefinded') { // 선호영화관 클릭이벤트
                R.favorite.on('click', 'a', function () {
                    var inType = $(this).data('type');
                    var inArea = $(this).data('area');
                    var inCode = $(this).data('code');
                    var inName = $(this).data('favorit');
                    var inSelect = $(this).data('cinemaSelect');
                    var inArr = $.inArray(inSelect, R.cinemaSelect);
                    // 영화관 선택 상태를 설정하고 회차 정보 호출
                    // (영화관선택여부, 선택영화관, 지역, 영화관코드, 선택영화관목록, 마이영화관, this, 상영관유형)
                    R.screenSelector(true, inSelect, inArea, inCode, inArr, inName, $(this), inType);

                    // 2016.05.19 웹접근성
                    $('.area_cont').find('a:not(.on)').find('.blind').remove();

                    // 2016.05.19 웹접근성
                    $.each($('.area_cont').find('a.on'), function () {
                        if ($(this).find('.blind').length == 0) {
                            $(this).append('<div class="blind">선택됨</div>');
                        }
                    });
                });

                R.favoriteLogin.find('.btnCinema').on('click', function () {
                    //alert('선호영화관을 세개까지 설정하실 수 있습니다.');
                    //var _params = "?pageCode=Tickecting";
                    var popSet = new $.fn.modalPopGeneration({ type: 'load', url: '/LCHS/View/favorite-cinema-setting.html', btns: false, btnParam1: false, btnParam2: true, elem: $(this) });

                });
            };

            // 예매화면 초기 진입 시 
            if (R.step == 0) {
                // 영화관 클릭 시
                R.area.find(R.cinema).on('click', 'a', function () { // 영화관 클릭이벤트
                    var inArea = $(this).data('area');
                    var inCode = $(this).data('code');
                    var inName = $(this).data('name');
                    var inSelect = $(this).data('cinemaSelect');
                    var inArr = $.inArray(inSelect, R.cinemaSelect);
                    // (영화관선택여부, 선택영화관, 지역, 영화관코드, 선택영화관목록, 마이영화관, this, 상영관유형)
                    R.screenSelector(false, inSelect, inArea, inCode, inArr, inName, $(this));

                    // 2016.05.13 웹접근성
                    $(this).parent().parent().find('a:not(.on)').find('.blind').remove();

                    if ($(this).hasClass('on') && $(this).find('.blind').length == 0) {
                        $(this).append('<div class="blind">선택됨</div>');
                    }
                });

                // 전체영화관, 스페셜관 탭 클릭 시
                R.areaTab.on('click', 'a', function () { // 영화관 타입탭 클릭이벤트
                    // 2016.05.04 웹접근성
                    $('#cinema_title_h4').text($(this).find('span').first().text());

                    var idx = $(this).parent().index();
                    $(this).addClass('on').parent().siblings().find('a').removeClass('on');
                    $('.tab_cont').hide().eq(idx).show();
                    R.area.eq(idx).find(R.areaZone).find('a').removeClass('on').parent().next().removeClass('on');
                    R.area.eq(idx).find(R.areaZone).eq(0).find('a').addClass('on').parent().next().addClass('on');
                });

                // 영화관 지역 클릭 시
                R.area.find(R.areaZone).on('click', 'a', function () { // 영화지역탭 클릭이벤트
                    var idx = $(this).parent().parent().index();
                    $(this).addClass('on').parent().next().addClass('on').parent().siblings().find('.area_cont').removeClass('on').prev().find('a').removeClass('on');

                    // 2016.05.13 웹접근성
                    $('.area_zone').find('.blind').remove();

                    if ($(this).find('.blind').length == 0) {
                        $(this).append('<div class="blind">선택됨</div>');
                    }
                });

                // 영화 클릭 시
                R.movie.on('click', 'a', function () { // 영화 클릭이벤트
                    var inCode = $(this).data('code');
                    var inName = $(this).data('name');
                    var inArr = $.inArray(inCode, R.movieArray);
                    R.movieSelector(inCode, inArr, inName, $(this));

                    // 2016.05.13 웹접근성
                    $(this).parent().parent().find('a:not(.on)').find('.blind').remove();

                    if ($(this).hasClass('on') && $(this).find('.blind').length == 0) {
                        $(this).append('<div class="blind">선택됨</div>');
                    }
                });

                $('.selectMv_Area').on('click', 'a', function () {
                    var ins = $(this).parents('dl').index();
                    if (ins == 2) {
                        R.movie.find('.' + $(this).parent().attr('class')).trigger('click');
                    } else if (ins != 2) {
                        R.area.find('.' + $(this).parent().attr('class')).trigger('click');
                    }
                });

                // 영화의 예매순, 평점순 클릭 시
                // 영화의 정렬 방법을 쿠키에 저장하고, 영화 목록을 선택된 정렬 방법으로 정렬해서 다시 그림
                R.target.find('.movie_cont').find('.tkMTab').find('a').on('click', function () { // 영화 소트
                    if (!$(this).parent().hasClass('on')) {
                        var sortVar = $(this).attr('data-sort');

                        // 2016.05.03 웹접근성법
                        if (sortVar == 'BookingSortSequence') {
                            $('#title_h4').text('예매순');
                        }
                        else {
                            $('#title_h4').text('평점순');
                        }

                        $(this).parent().addClass('on').siblings().removeClass('on');

                        $.fn.cookieChanges('add', 'ticketingState.ticketing.sortMovieCode', sortVar);
                        R.movieDraw(sortVar);
                    };
                });
            };

            // 전체, 2D, 3D 선택 상자 선택 시
            R.target.find('.time_inner').find('.select_box').find('select').change(function () { // 회차 정렬
                var sortVar = $(this).val();

                $.fn.cookieChanges('add', 'ticketingState.ticketing.sortFilmCode', sortVar);
                R.filmSort(sortVar);
            });

            $('.time_Lk a').click(function () { // 상영정보 보기 버튼(X)
                $('html, body').stop().animate({ 'scrollTop': $('.time_inner').offset().top }, 300);
            });

            // 상영시간의 영화관별 조회, 영화별 조회 클릭 시
            $('.time_tab a').click(function () {
                var thisIdx = $(this).parent().index();
                $(this).addClass('on').parent().siblings().find('a').removeClass('on');

                // 2016.05.03 웹접근성
                $('#time_tab_title').text($(this).text());

                if (R.noMovie.is(':visible')) {
                    $('.time_box').hide();
                } else {
                    $('.time_box').hide().eq(thisIdx).show();
                };
            });
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 회차정보 리턴
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        platEvent: function () {
            var T = this;

            // 회차 하나를 클릭했을 경우
            T.target.find('.time_box').find('.time_active').on('click', function (e) {
                if ($(this).data('possibilltyYN') == 'N') // 마감
                {
                    e.preventDefault(); // 브라우저 이벤트 리셋
                    return;
                }
                else if ($(this).data('possibilltyYN') == 'J') // 상영준비중
                {
                    e.preventDefault(); // 브라우저 이벤트 리셋
                    return;
                }
                else if ($(this).data('possibilltyYN') == 'E') // 매진
                {
                    e.preventDefault(); // 브라우저 이벤트 리셋
                    return;
                }

                // 판매 완료가 아닐 경우
                if (!$(this).parent().hasClass('soldout')) {
                    //if (Number($(this).data('messageYN')) == 1) {

                    //    var viewError = new $.fn.modalPopGeneration({ type: 'server', lang: this.leng, btns: true, btnParam1: false, btnParam2: true, serverTitle: '알림', serverMessage: '현재 4D효과가 없는 2D영화가<br> 상영 중이며 일반요금이 책정됩니다.', elem: $(this) });

                    //    $('.pop_wrap .btnc_confirm').off().on('click', function () {
                    //        $(this).parents('.pop_wrap').remove();

                    //        // 부킹 가능여부
                    //        JsonCall(CinemaServiceDomain + "/LCWS/Ticketing/TicketingData.aspx", obj, T.ticketData);
                    //    });
                    //} else if (Number($(this).data('messageYN')) == 0) {

                    //    var viewError = new $.fn.modalPopGeneration({ type: 'server', lang: this.leng, btns: true, btnParam1: false, btnParam2: true, serverTitle: '알림', serverMessage: '4D 영화는 좌석의 움직임이 있는 입체 체감효과와 <br>특수효과가 있어 다음 고객은 관람이 제한됩니다.<br>-임산부/노약자/음주자/심장병, 요통, 고혈압 등의<br> 질환자/신장 100cm 이하 어린이/만 4세미만 <br>(만 4세이상 7세미만은 부모님 동반 하에 관람 가능)', elem: $(this) });

                    //    $('.pop_wrap .btnc_confirm').off().on('click', function () {
                    //        $(this).parents('.pop_wrap').remove();

                    //        // 부킹 가능여부
                    //        JsonCall(CinemaServiceDomain + "/LCWS/Ticketing/TicketingData.aspx", obj, T.ticketData);
                    //    });
                    //};

                    // 예매 가능여부 판단
                    var obj = { MethodName: "GetBookPossible", channelType: "HO", osType: BrowserAgent(), osVersion: navigator.userAgent, multiLanguageID: T.leng, screenID: $(this).data('screenCode'), playDate: T.date, playSequence: $(this).data('playSequence') };

                    // 팝업을 띄워줘야 할지 여부를 판단함
                    // 슈퍼4D관을 위해 메세지 표시 위한 기능
                    // 0 : 메세지 기능 없음
                    // 1 : 수퍼4D관 2D 영화
                    // 2 : 수퍼4D관 4D 영화
                    // 3 : 무대인사 (HS, MW 해당) 

                    // 무대인사 코드 1603306
                    // 20170222 - 40 추가
                    //if ($(this).data('AccompanyTypeCode') == '30' || $(this).data('AccompanyTypeCode') == '40') {
                    if ($(this).data('AccompanyTypeCode') == '30') {
                        $(this).data('messageYN', 3);
                    }
                    else if ($(this).data('AccompanyTypeCode') == '40') {
                        $(this).data('messageYN', 40);
                    }
                    else if ($(this).data('AccompanyTypeCode') == '240' || $(this).data('AccompanyTypeCode') == '250') {
                        $(this).data('messageYN', 250);
                    }
                    //20170502 sunho 츄잉쳇 조건 추가 AccompanyTypeCode 240 250 일경우 츄잉쳇 따라서 기존의 아닐경우로 들어감
                    if (Number($(this).data('messageYN')) > 0 && $(this).data('AccompanyTypeCode') != '240' && $(this).data('AccompanyTypeCode') != '250') {
                        var serverMessageTxt;
                        if (Number($(this).data('messageYN')) == 1) {
                            serverMessageTxt = '현재 4D효과가 없는 2D영화가 상영 중이며 일반요금이 책정됩니다.';
                        } else if (Number($(this).data('messageYN')) == 2) {
                            serverMessageTxt = '4D 영화는 좌석의 움직임이 있는 입체 체감효과와 <br>특수효과가 있어 다음 고객은 관람이 제한됩니다.<br>-임산부/노약자/음주자/심장병, 요통, 고혈압 등의<br> 질환자/신장 100cm 이하 어린이/만 4세미만 <br>(만 4세이상 7세미만은 부모님 동반 하에 관람 가능)';
                        } else if (Number($(this).data('messageYN')) == 3) { // 1603306
                            serverMessageTxt = '원활한 진행을 위해 예매취소는 영화시작<br>24시간 이전까지만 가능합니다.';//20170518 무대 인사 문구 제거 
                        }
                        else if (Number($(this).data('messageYN')) == 4) { // 20160714 4D3D 추가
                            serverMessageTxt = '현재 4D효과가 없는 3D영화가 상영 중이며 3D요금이 책정됩니다.';
                        } else if (Number($(this).data('messageYN')) == 40) { // 1603306
                            serverMessageTxt = '원활한 행사 진행을 위해 예매취소는 영화시작<br>24시간 이전까지만 가능합니다.';
                        }
                      
                        var viewError = new $.fn.modalPopGeneration({ type: 'server', lang: this.leng, btns: true, btnParam1: false, btnParam2: true, serverTitle: '알림', serverMessage: serverMessageTxt, elem: $(this) });

                        // 알림창 출력 후 '확인' 버튼 클릭 시 예매 가능여부를 판단하는 서비스 호출
                        $('.pop_wrap .btnc_confirm').off().on('click', function () {
                            $(this).parents('.pop_wrap').remove();

                            // 부킹 가능여부
                            JsonCall(CinemaServiceDomain + "/LCWS/Ticketing/TicketingData.aspx", obj, T.ticketData);
                        });

                    } else if ($(this).data('AccompanyTypeCode') == '240' || $(this).data('AccompanyTypeCode') == '250') {//20170502 sunho 츄잉쳇 조건 추가
                        var popSet = new $.fn.modalPopGeneration({ type: 'load', url: '/LCHS/View/ticketing/chewing-chat.html', btns: false, btnParam1: false, btnParam2: false });
                        setTimeout(function (e) {
                            // 알림창 출력 후 '확인' 버튼 클릭 시 예매 가능여부를 판단하는 서비스 호출
                            $('.pop_wrap .btnc_confirm').off().on('click', function () {
                                $(this).parents('.pop_wrap').remove();

                                // 부킹 가능여부
                                JsonCall(CinemaServiceDomain + "/LCWS/Ticketing/TicketingData.aspx", obj, T.ticketData);
                            });

                            // 알림창 출력 후 '확인' 버튼 클릭 시 예매 가능여부를 판단하는 서비스 호출
                            $('.pop_wrap .pop_btn_close').off().on('click', function () {
                                $(this).parents('.pop_wrap').remove();

                                // 부킹 가능여부
                                JsonCall(CinemaServiceDomain + "/LCWS/Ticketing/TicketingData.aspx", obj, T.ticketData);
                            });

                        }, 1500);
                    } else if ($(this).data('AccompanyTypeCode') == '20') {//20170627 sunho 엄마랑 아기랑
                        var popSet = new $.fn.modalPopGeneration({ type: 'load', url: '/LCHS/View/ticketing/mom-and-baby-popup.html', btns: false, btnParam1: false, btnParam2: false });
                        setTimeout(function (e) {
                            // 알림창 출력 후 '확인' 버튼 클릭 시 예매 가능여부를 판단하는 서비스 호출
                            $('.pop_wrap .btnc_confirm').off().on('click', function () {
                                $(this).parents('.pop_wrap').remove();

                                // 부킹 가능여부
                                JsonCall(CinemaServiceDomain + "/LCWS/Ticketing/TicketingData.aspx", obj, T.ticketData);
                            });

                            // 알림창 출력 후 '확인' 버튼 클릭 시 예매 가능여부를 판단하는 서비스 호출
                            $('.pop_wrap .pop_btn_close').off().on('click', function () {
                                $(this).parents('.pop_wrap').remove();

                                // 부킹 가능여부
                                JsonCall(CinemaServiceDomain + "/LCWS/Ticketing/TicketingData.aspx", obj, T.ticketData);
                            });

                        }, 1500);
                    }
                    else {
                        // 메시지 출력이 필요 없을 경우 예매 가능여부 확인을 위한 서비스 호출
                        JsonCall(CinemaServiceDomain + "/LCWS/Ticketing/TicketingData.aspx", obj, T.ticketData);
                    }



                    // 쿠키에 사용자가 선택한 예매 정보 저장
                    $(this).parent().addClass('on');
                    $.fn.cookieChanges('add', 'ticketingState.ticketing.playDate', $(this).data('playDate')); // 1603307
                    $.fn.cookieChanges('add', 'ticketingState.ticketing.playWeek', $(this).data('playWeek')); // 1603307

                    $.fn.cookieChanges('del', 'ticketingState.ticketing.screenName', 'arr');
                    $.fn.cookieChanges('add', 'ticketingState.ticketing.screenName', $(this).data('screenName'));   // 160607
                    $.fn.cookieChanges('add', 'ticketingState.ticketing.brandName', $(this).data('brandName'));   // 170116
                    $.fn.cookieChanges('del', 'ticketingState.ticketing.playSequenceCode', 'arr');
                    $.fn.cookieChanges('add', 'ticketingState.ticketing.playSequenceCode', { 'cinemaCode': $(this).data('cinemaCode'), 'cinemaName': $(this).data('cinemaName'), 'screenCode': $(this).data('screenCode'), 'movieCode': $(this).data('movieCode'), 'playSequence': $(this).data('playSequence'), 'startTime': $(this).data('startTime'), 'endTime': $(this).data('endTime'), 'sequenceCode': $(this).data('typeCode'), 'weekCode': $(this).data('weekCode'), 'screenDiv': $(this).data('screenDiv'), 'cinemaType': $(this).data('cinemaType') });

                    try {
                        // 20170425001 - 페이스북에서 유입된 정보가 있을 경우 페이스북에서 유입된 영화과 선택된 영화가 다르면 주문 완료 페이지에서 로그를 남기지 않기 위해 쿠키에서 해당 데이터 삭제
                        if (cookieJson.ticketingState.facebookActLogMovieCode != undefined && cookieJson.ticketingState.facebookActLogMovieCode != 'undefined' && cookieJson.ticketingState.facebookActLogMovieCode != null && cookieJson.ticketingState.facebookActLogMovieCode != "" && cookieJson.ticketingState.facebookActLogMovieCode != $(this).data('movieCode')) {
                            $.fn.cookieChanges('del', 'ticketingState.facebookActLogConnectionID', '');
                            $.fn.cookieChanges('del', 'ticketingState.facebookActLogMovieCode', '');
                            $.fn.cookieChanges('del', 'ticketingState.facebookActLogPageUrl', '');
                        }
                    } catch (e) { }
                };
            });

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // 영화 상세보기(레이어 모달팝업)
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            $(".time_box").find(".btn_detail").on("click", function () {
                _movieCode = $(this).data("movieCode");

                // 2016.02.25 홍상길 수정 : 새창으로
                goUrl('/LCHS/Contents/Movie/Movie-Detail-View.aspx?movie=' + _movieCode, '2');
                //var popSet = new $.fn.modalPopGeneration({ type: 'load', url: '/LCHS/View/Movie/movie-detail-popup.html', btns: false, btnParam1: false, btnParam2: false });

            });
        },

        // 부킹 가능여부에 대한 결과 처리
        ticketData: function (data) {// 부킹 가능여부
            try {
                timeUtill = data.responseJSON;
                ticketReservation.ticketFalse();
            }
            catch (e) {
                //alert('ticketError');
            }
        },

        ticketFalse: function () {
            var timeBull = timeUtill.IsOK;
            var timeMessage = timeUtill.ResultMessage;

            // 예매가 가능하지 않을 경우
            // 알림 메시지 출력 후 예매 페이지에 머무름
            if (!timeBull) {
                var timeError = new $.fn.modalPopGeneration({ type: 'server', lang: this.leng, btns: true, btnParam1: false, btnParam2: true, serverTitle: '알림', serverMessage: timeMessage, elem: $(this) });

                $('.pop_wrap .btnc_confirm').off().on('click', function () {
                    $(this).parents('.pop_wrap').remove();

                    window.location.href = '/LCHS/Contents/ticketing/ticketing.aspx';
                });
            } else {
                // 예매 가능 시 쿠키에 저장된 데이터 추출
                // 월드타워 할로윈 이벤트 20161028/월드타워/닥터 스트레인지/슈퍼플렉스G/20:00
                var cinemacode = cookieJson.ticketingState.ticketing.playSequenceCode[0].cinemaCode;
                var moviecode = cookieJson.ticketingState.ticketing.playSequenceCode[0].movieCode;
                var specialType = cookieJson.ticketingState.ticketing.playSequenceCode[0].screenDiv;
                var startTime = cookieJson.ticketingState.ticketing.playSequenceCode[0].startTime;
                var playDate = cookieJson.ticketingState.ticketing.playDate;
                // 20170214 sunho 슈퍼플렉스만 추가 2/11~2/28 end date 변경 20170216 sunho 변경 
                var mYear = playDate.split('-')[0];
                var mMonth = playDate.split('-')[1]-1;
                var mDay = playDate.split('-')[2];

                var playendDate = new Date(mYear, mMonth, mDay);
                var endDate = new Date(2017, 2, 1);

                //console.log("playDate : " + playDate + "   startTime : " + startTime);

                // 조건에 따른 팝업 메시지 출력 후 좌석 페이지로 이동
                //if (playDate == '2016-10-14' && cinemacode == '1004' && moviecode == '10371' && specialType == '100' && startTime == '20:55') {
                if (playDate == '2016-10-28' &&cinemacode == '1016' && moviecode == '10844' && specialType == '941' && startTime == '20:00') {
                    var popSet = new $.fn.modalPopGeneration({ type: 'confirm', code: 'LBL9999', lang: 'KR', btns: true, btnParam1: true, btnParam2: true, elem: $(this), execution: comfirmExec, execution2: cancelExec });
                    function comfirmExec() {
                        // 비호그인시 로그인 팝업 추가 홍상길 - 2015.11.26
                        if (checkLogin() == false) {
                            openLoginPopupWithParam(undefined, '/LCHS/Contents/ticketing/person-seat-select.aspx', 'Type01')
                        } else {
                            try {
                                // 20160920 - FileLog 추가
                                setFileLog(T.target.find('.time_box').find('.time_active').data('cinemaCode'), T.target.find('.time_box').find('.time_active').data('cinemaName'), 1, "최종선택," + cookieJson.ticketingState.ticketing.playDate + "," + cookieJson.ticketingState.ticketing.playSequenceCode[0].screenCode + "," + cookieJson.ticketingState.ticketing.playSequenceCode[0].playSequence, 1);
                            } catch (e) { }

                            window.location.href = '/LCHS/Contents/ticketing/person-seat-select.aspx';
                        };
                    }
                    function cancelExec() {
                        T.timeArea.find('.theater_time ').find('li').removeClass('on');
                    }
                // 월드타워 수퍼플레스 G관일 경우 메시지 팝업을 실행하고, 해당 메시지 팝업에서 '확인' 버튼 클릭 시 좌석 페이지로 이동
                }else if (playendDate.getTime() < endDate.getTime() && specialType == '941' && cinemacode == '1016') {//html에 로그인 확인 있음 
                        var popSet = new $.fn.modalPopGeneration({ type: 'load', url: '/LCHS/View/ticketing/superflex-event.html', btns: false, btnParam1: false, btnParam2: false,  elem: $(this) });
                }
                // 월드타워 씨네패밀리 관일 경우 메시지 팝업을 실행하고, 해당 메시지 팝업에서 '확인' 버튼 클릭 시 좌석 페이지로 이동
                else if (cinemacode == "1016" && specialType == "960") {//20170515 sunho 씨네 패밀리 html에 로그인 확인 있음 
                        var popSet = new $.fn.modalPopGeneration({ type: 'load', url: '/LCHS/View/ticketing/cinefamily-popup.html', btns: false, btnParam1: false, btnParam2: false });
                }
                // 월드타워 샤롯데/샤롯데 프라이빗 알림창 20170927 기능 추가
                else if (playDate >= '2017-09-30' && playDate <= '2017-10-09' && cinemacode == "1016" && specialType == "300") {//20170515 sunho 씨네 패밀리 html에 로그인 확인 있음 
                    var popSet = new $.fn.modalPopGeneration({ type: 'load', url: '/LCHS/View/ticketing/shylotte-popup.html', btns: false, btnParam1: false, btnParam2: false });
                }
                // 원주무관일떄 S-cube 나 S-cube 일때 조건 20170721 sunho
                else if (cinemacode == "9062" && specialType == "982") {//20170721 sunho S-cube 일때  
                    var popSet = new $.fn.modalPopGeneration({ type: 'load', url: '/LCHS/View/ticketing/s-cube.html', btns: false, btnParam1: false, btnParam2: false });
                }
                // 원주무관일떄 S-cube 나 G-cube 일때 조건 20170721 sunho
                else if (cinemacode == "9062" && specialType == "984") {//20170721 sunho G-cube 일때  
                    var popSet = new $.fn.modalPopGeneration({ type: 'load', url: '/LCHS/View/ticketing/g-cube.html', btns: false, btnParam1: false, btnParam2: false });
                }
                else {
                    // 2017414 - 월드타워 5관 선택시 팝업 추가
                    // 20170425 - 월드타워 5관 선택시 팝업 제거
                    //if (cookieJson.ticketingState.ticketing.playSequenceCode[0].cinemaCode == "1016" && cookieJson.ticketingState.ticketing.playSequenceCode[0].screenCode == "101605") {
                    //    var popSet = new $.fn.modalPopGeneration({ type: 'load', url: '/LCHS/View/ticketing/worldtower-seat-popup.html', btns: false, btnParam1: false, btnParam2: false, elem: $(this) });
                    //}
                    //else {
                        // 비호그인시 로그인 팝업 추가 홍상길 - 2015.11.26
                        if (checkLogin() == false) {
                            openLoginPopupWithParam(undefined, '/LCHS/Contents/ticketing/person-seat-select.aspx', 'Type01')
                        } else {
                            try {
                                // 20160920 - FileLog 추가
                                setFileLog(T.target.find('.time_box').find('.time_active').data('cinemaCode'), T.target.find('.time_box').find('.time_active').data('cinemaName'), 1, "최종선택," + cookieJson.ticketingState.ticketing.playDate + "," + cookieJson.ticketingState.ticketing.playSequenceCode[0].screenCode + "," + cookieJson.ticketingState.ticketing.playSequenceCode[0].playSequence, 1);
                            } catch (e) { }
                            window.location.href = '/LCHS/Contents/ticketing/person-seat-select.aspx';
                        };
                    //}
                }
            };
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 달력 슬라이드 시 이동버튼 콘트롤
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        calendarMove: function () {
            var R = this;

            if (R.dateCurNo == 0) {
                R.calendar.find('.prev').addClass('nodata').siblings('a').removeClass('nodata');
            } else if (R.dateCurNo == R.dateTotal) {
                R.calendar.find('.next').addClass('nodata').siblings('a').removeClass('nodata');
            } else if (R.dateCurNo > 0 && R.dateCurNo < R.dateTotal) {
                R.calendar.find('> a').removeClass('nodata');
            }
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 영화관 선택
        // (영화관선택여부, 선택영화관, 지역, 영화관코드, 선택영화관목록, 마이영화관, this, 상영관유형)
        // inArr은 이미 선택되어진 영화관 목록이 있는 상태에서 동일한 영화관을 선택했는지의 여부를 판단하기 위한 값
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        screenSelector: function (bull, inSelect, inArea, inCode, inArr, inName, thisCinema, inType) {
            if (inArr < 0) {//이미 선택된 것인지 체크 - 영와관과 로직은 동일
                // 선택영화관이 2보다 작을 경우(하나 이상을 선택했을 경우)
                if (this.cinemaCount < 2) {
                    // 쿠키 저장을 위한 각 변수에 현재 선택된 영화관 정보를 저장
                    this.screenArray.push(thisCinema.data('type'));
                    this.areaArray.push(thisCinema.data('area'));
                    this.cinemaArray.push(inCode);
                    this.cinemaSelect.push(thisCinema.data('cinemaSelect'));

                    // 영화관명은 선택된 영화관으로 설정
                    var cineName = inSelect; // 초기 영화관

                    // 선택된 영화관이 있는 관계로 화면 중앙에 선택 정보를 노출하는 영역에서 
                    // 영화관 영역의 '영화관을 선택하세요. (최대 2개)' 메시지를 숨김 처리
                    $('.viewCinemaList').prev('span').hide();

                    if (!bull) { // false = 영화관 클릭
                        // 선택한 영화관을 선택 상태로 설정
                        thisCinema.addClass('on');
                        cineName = thisCinema.data('name');
                    } else {
                        var T = this;

                        // 영화관 클릭이 아닌 경우는 영화관 목록에서 선택 상태로 설정해야할 영화관을 찾아 선택 상태로 설정
                        T.area.find(T.cinema).find('a').each(function () {
                            if ($(this).data('cinemaSelect') == inSelect) {
                                $(this).addClass('on');
                                cineName = $(this).data('name');

                                T.area.find(T.areaZone).find('a').removeClass('on').parent().next().removeClass('on');
                                T.area.find('.area' + inArea).find(T.areaZone).find('a').addClass('on').parent().next().addClass('on');
                            };
                        });
                    };

                    // 마이영화관에 선택 영화관이 있을 경우 해당 영화관을 선택 상태로 설정
                    this.favorite.find('.' + thisCinema.data('cinemaSelect')).addClass('on');

                    // 선택된 영화관이 있는 관계로 화면 중앙에 선택 정보를 노출하는 영역에 선택 영화관을 표현
                    if (this.cinemaSelect.length > 1) {
                        var html = '<li>' + cineName + '<a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_mv_close.gif" alt="close" /></a></li>';
                        $('.viewCinemaList').append(html).find('li').last().addClass(this.cinemaSelect[1]).data({ 'type': this.screenArray[1], 'area': this.areaArray[1], 'code': this.cinemaArray[1], 'cinemaSelect': this.cinemaSelect[1] });
                    } else {
                        var html = '<li>' + cineName + '<a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_mv_close.gif" alt="close" /></a></li>';
                        $('.viewCinemaList').append(html).find('li').last().addClass(this.cinemaSelect[0]).data({ 'type': this.screenArray[0], 'area': this.areaArray[0], 'code': this.cinemaArray[0], 'cinemaSelect': this.cinemaSelect[0] });
                    };

                    // 선택영화관의 개수를 증가
                    // 최대 2개까지 선택 가능하므로, 2개 이상을 선택하려 할때 알림 메시지 출력
                    this.cinemaCount++; // 카운트 업

                    try {
                        // 20160920 - FileLog 추가
                        setFileLog(inCode, inName, 1, "직접선택", 1);
                    } catch (e) { }

                } else {
                    // 2개 이상을 선택하려 했을 경우 알림 메시지 출력
                    var popSet = new $.fn.modalPopGeneration({ type: 'message', code: 'COM1000', lang: this.leng, btns: true, btnParam1: false, btnParam2: true, elem: thisCinema });
                };
            } else {
                // 이미 선택한 영화관을 재 선택했을 경우 화면에서 해당 영화관에 대한 선택 상태를 해제
                // 쿠키에 저장할 영화관 목록에서 제외
                // 마이영화관의 선택 상태도 해제
                // 화면 중앙의 선택 정보를 보여주는 영역에서도 제외
                if (!bull) { // 이미 선택한 영화관 선택 시 리셋
                    thisCinema.removeClass('on');
                    this.screenArray.splice(inArr, 1);
                    this.areaArray.splice(inArr, 1);
                    this.cinemaArray.splice(inArr, 1);
                    this.cinemaSelect.splice(inArr, 1);
                    (this.cinemaCount > 0) ? this.cinemaCount-- : this.cinemaCount = 0;

                    this.favorite.find('.' + thisCinema.data('cinemaSelect')).removeClass('on');

                    $('.viewCinemaList').find('li').each(function () {
                        if ($(this).data('cinemaSelect') == thisCinema.data('cinemaSelect')) {
                            $(this).remove();
                        };

                        if ($('.viewCinemaList').find('li').length < 1) {
                            $('.viewCinemaList').prev('span').show();
                        };
                    });

                    try {
                        // 20160920 - FileLog 추가
                        setFileLog(inCode, inName, 1, "직접선택", 2);
                    } catch (e) { }

                };
            };

            // 쿠키에 저장
            $.fn.cookieChanges('add', 'ticketingState.ticketing.screentype', this.screenArray); // 쿠키 저장
            $.fn.cookieChanges('add', 'ticketingState.ticketing.areaCodes', this.areaArray);
            $.fn.cookieChanges('add', 'ticketingState.ticketing.cinemaCodes', this.cinemaArray);

            // 선택된 상영일과 영화관 정보를 이용해 영화 목록을 가져온 후 활성화 비활성화 상태를 표현
            this.activeList(this.date);

            this.ticketingPlaySeq(); // 영화관 선택에 따른 회차정보 호출
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 영화 선택
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        movieSelector: function (inCode, inArr, inName, thisMovie) {
            if (inArr < 0) { // 이미 선택된 것인지 체크 - 영와관과 로직은 동일
                // 2개 이하로 선택했을 경우에만 선택 영화를 쿠키에 저장할 수 있도록 배열에 저장
                // 화면 중앙에 선택 영화 목록 표현
                if (this.movieCount < 2) {
                    $('.viewMovieList').prev('span').hide();

                    this.movieArray.push(inCode);
                    thisMovie.addClass('on');
                    this.movieCount++;

                    var html = '<li class="mov' + thisMovie.data('code') + '">' + inName + '<a href="javascript:void(0);"><img src="/LCHS/Image/Btn/btn_mv_close.gif" alt="close" /></a></li>';
                    $('.viewMovieList').append(html);
                } else {
                    // 2개 이상 선택시 알림 메시지 출력
                    var popSet = new $.fn.modalPopGeneration({ type: 'message', code: 'COM1001', lang: this.leng, btns: true, btnParam1: false, btnParam2: true, elem: thisMovie });
                }
            // 이미 선택한 영화를 재 선택시 해당 영화를 쿠키 및 화면 중앙의 선택 정보 노출 영역에서 제외
            } else {
                this.movieArray.splice(inArr, 1);
                (this.movieCount > 0) ? this.movieCount-- : this.movieCount = 0;
                thisMovie.removeClass('on');

                $('.viewMovieList').find('.mov' + thisMovie.data('code')).remove();

                if ($('.viewMovieList').find('li').length < 1) {
                    $('.viewMovieList').prev('span').show();
                };
            };

            // 쿠키에 선택 영화정보 저장
            $.fn.cookieChanges('add', 'ticketingState.ticketing.movieCodes', this.movieArray);

            // 선택된 상영일과 영화관 정보를 이용해 영화 목록을 가져온 후 활성화 비활성화 상태를 표현
            this.activeList(this.date);

            this.checkSlected();
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 영화 선택 시 영화관 선택이 있을 경우에만 회차정보 호출
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        checkSlected: function () {
            if (this.cinemaArray.length > 0) this.ticketingPlaySeq();
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 회차 데이터 호출
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ticketingPlaySeq: function () {
            if (this.screenArray.length == 0) {
                var cinemaData = '';
            } else if (this.screenArray.length == 1) {
                var cinemaData = this.screenArray[0] + '|' + this.areaArray[0] + '|' + this.cinemaArray[0];
            } else {
                var cinemaData = this.screenArray[0] + '|' + this.areaArray[0] + '|' + this.cinemaArray[0] + ',' + this.screenArray[1] + '|' + this.areaArray[1] + '|' + this.cinemaArray[1];
            };

            if (this.movieArray.length == 0) {
                var movieData = '';
            } else if (this.movieArray.length == 1) {
                var movieData = this.movieArray[0];
            } else {
                var movieData = this.movieArray[0] + ',' + this.movieArray[1];
            };

            // 회차 데이터 호출용 파라미터 설정
            var obj = { MethodName: "GetPlaySequence", channelType: "HO", osType: BrowserAgent(), osVersion: navigator.userAgent, playDate: this.date, cinemaID: cinemaData, representationMovieCode: movieData };

            // 회차 데이터 호출
            JsonCall(CinemaServiceDomain + "/LCWS/Ticketing/TicketingData.aspx", obj, this.playData);
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 회차 데이터 로드
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        playData: function (data) {
            try {
                playUtill = data.responseJSON;

                ticketReservation.playCinemaDraw();
            }
            catch (e) {
                //alert('playError');
            }
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 회차 정보 디폴트 리셋
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        playReset: function () {
            this.noMovie.hide();

            var drawIdx = this.target.find('.time_inner').find('.select_box').find('select').find('option').first().text();
            var drawData = this.target.find('.time_inner').find('.select_box').find('select').find('option').first().val();
            this.target.find('.time_inner').find('.select_box').find('select').val(drawData).change();
            this.target.find('.time_inner').find('.select_box').find('> a').text(drawIdx);
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 회차 정보 드로우 - 영화별
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        playMovieDraw: function () {
            T = this;
            var html = '';

            var cinemaNode = $(playUtill.PlaySeqsHeader.Items); // 상영관정보 노드
            var timeNode = $(playUtill.PlaySeqs.Items); // 회차 노드

            var cinemaTotal = 0;
            var cinemaBull = '', movieBull = '', filmBull = ''; // 영화관순 정렬 변수
            var timeBull = '', cineBull = ''; // 영화순 정렬 변수

            //cinemaNode.sort(function (a, b) { // 상영관정보 정렬
            //    return a.BookingSortSequence < b.BookingSortSequence ? -1 : a.BookingSortSequence > b.BookingSortSequence ? 1 : 0;
            //});

            timeNode.sort(function (a, b) { // 회차 정렬
                return a.StartTime < b.StartTime ? -1 : a.StartTime > b.StartTime ? 1 : 0;
            });

            // 20170725 - 샤롯데/샤롯데프라이빗 표기 수정
            // 샤롯데, 샤롯데/샤롯데프라이빗, 샤롯데프라이빗 형태로 수정
            var tempByMovieCinemaDDArray = new Array();
            var tempByMovieScreenDDArray = new Array();
            var tempByMovieMovieDDArray = new Array();
            var tempByMovieScrrenDDArrayIndex = 0;

            cinemaNode.each(function (n) {
                var cinemaCode = $(this)[0].CinemaID;
                var movieCode = $(this)[0].MovieCode;
                var screenCode = $(this)[0].ScreenID;
                var movieRep = $(this)[0].RepresentationMovieCode;
                var brandYN = $(this)[0].BrandYN;                                                                   // 160628
                if (T.leng == 'KR') {
                    var arrayName = $(this)[0].ScreenNameKR;
                    var cinemaName = $(this)[0].CinemaNameKR;
                    var movieName = $(this)[0].MovieNameKR;
                    var filmName = $(this)[0].FilmNameKR;
                    var viewingName = $(this)[0].ViewGradeNameKR;
                    var soundName = $(this)[0].SoundTypeNameKR;
                    var fourdName = $(this)[0].FourDTypeNameKR;
                    var divisionName = $(this)[0].TranslationDivisionNameKR;
                    var accompanyName = $(this)[0].AccompanyTypeNameKR;
                    var screenName = $(this)[0].ScreenDivisionNameKR;
                    var brandName = $(this)[0].BrandNm_KR;
                } else {
                    var arrayName = $(this)[0].ScreenNameUS;
                    var cinemaName = $(this)[0].CinemaNameUS;
                    var movieName = $(this)[0].MovieNameUS;
                    var filmName = $(this)[0].FilmNameUS;
                    var viewingName = $(this)[0].ViewGradeNameUS;
                    var soundName = $(this)[0].SoundTypeNameUS;
                    var fourdName = $(this)[0].FourDTypeNameUS;
                    var divisionName = $(this)[0].TranslationDivisionNameUS;
                    var accompanyName = $(this)[0].AccompanyTypeNameUS;
                    var screenName = $(this)[0].ScreenDivisionNameUS;
                    var brandName = $(this)[0].BrandNm_US;
                }
                var filmCode = $(this)[0].FilmCode;
                var soundCode = $(this)[0].SoundTypeCode;
                var fourdCode = $(this)[0].FourDTypeCode;
                var divisionCode = $(this)[0].TranslationDivisionCode;
                var accompanyCode = $(this)[0].AccompanyTypeCode;
                var specialCode = $(this)[0].ScreenDivisionCode;
                var translationCode = $(this)[0].TranslationDivisionCode;
                var viewingCode = $(this)[0].ViewGradeCode;
                var totalCode = $(this)[0].TotalSeatCount;


                if (viewingCode == '0') {
                    viewingCode = 'all'; // 전체관람가 변환
                    if (T.leng != 'KR') {
                        viewingCode = 'all2';
                    }
                } else if (viewingCode == '18') {
                    if (T.leng != 'KR') {
                        viewingCode = '19';
                    }
                };

                if (!T.timeList.find('div').hasClass('movie' + movieRep)) { // 1차 "영화관" 정보 드로우
                    html = '<div class="time_aType movie' + movieRep + '">';
                    if (T.step != 1) {
                        html += '<h4 class="time_tit">';
                        if (T.leng == 'KR') {
                            html += '   <span class="grade_' + viewingCode + '">' + viewingName + '</span><em>' + movieName + '</em>';
                            html += '   <a href="javascript:void(0)" class="btn_detail" title="레이어 열림"><img src="/LCHS/Image/Btn/btn_time_view.png" alt="상영관 상세보기"></a>';
                        } else {
                            html += '   <span class="grade_' + viewingCode + '">' + viewingCode + '</span><em>' + movieName + '</em>';
                        };
                        html += '</h4>';
                    };
                    html += '   <dl class="time_line cinema' + cinemaCode + '">';
                    html += '       <dt>' + cinemaName + '</dt>';
                    html += '   </dl>';
                    html += '</div>';

                    T.timeList.append(html).find('.movie' + movieRep).data({ 'cinemaName': cinemaName }).find('.btn_detail').data({ 'movieCode': movieRep });
                };

                if (!T.timeList.find('.movie' + movieRep).find('.time_line').hasClass('cinema' + cinemaCode)) { // 1차 "영화관" 정보 드로우
                    html = '   <dl class="time_line cinema' + cinemaCode + '">';
                    html += '       <dt>' + cinemaName + '</dt>';
                    html += '   </dl>';

                    T.timeList.find('.movie' + movieRep).append(html).find('dl').last().data({ 'cinemaName': cinemaName });
                };

                // 20170719 - 상영시간표 상영관 병합
                var tempByMovieSpecialCode = specialCode;
                var tempByMovieSoundCode = soundCode;

                if (specialCode == 301) {
                    tempByMovieSpecialCode = 300;
                }
                else if (specialCode == 940) {
                    // 수퍼플렉스 -> 일반관
                    tempByMovieSpecialCode = 100;
                }
                else if (specialCode == 970) { // 20171013 cok - 중국영화상영관 일반관 병합
                	// 중국영화상영관 -> 일반관
                	tempByMovieSpecialCode = 100;
                }

                // ATMOS 표기 제외, 2D에 포함
                if (soundCode == 300) {
                    tempByMovieSoundCode = 100;
                }

                // 2차 영화관에 대한 영화리스트 드로우(accompanyCode 추가 이정열)
                //if (!T.timeList.find('.movie' + movieRep).find('.cinema' + cinemaCode).find('dd').hasClass('screen' + filmCode + '' + translationCode + '' + specialCode + '' + soundCode + '' + accompanyCode + '' + brandYN)) { // 170102
                // 20170719 - 상영시간표 상영관 병합
                // specialCode -> tempSpecialCode로 변경
                if (!T.timeList.find('.movie' + movieRep).find('.cinema' + cinemaCode).find('dd').hasClass('screen' + filmCode + '' + translationCode + '' + tempByMovieSpecialCode + '' + tempByMovieSoundCode + '' + accompanyCode + '' + brandYN)) {
                    //html = '<dd class="screen' + filmCode + '' + translationCode + '' + specialCode + '' + soundCode + '' + accompanyCode + '' + brandYN + ' film' + filmCode + '">'; // 170102
                    // 20170719 - 상영시간표 상영관 병합
                    // specialCode -> tempSpecialCode로 변경
                    html = '<dd class="screen' + filmCode + '' + translationCode + '' + tempByMovieSpecialCode + '' + tempByMovieSoundCode + '' + accompanyCode + '' + brandYN + ' film' + filmCode + '">'; // 170102
                    html += '   <ul class="cineD1">';
                    html += '       <li>' + filmName + ' </li>';
                    html += '       <li>' + divisionName + '</li>';
                    // ATMOS      161209
                    // 20170717 - Atmos 제외
                    if (soundCode > 100 && soundCode != 300) {
                        html += '       <li>' + soundName + '</li>';
                    };

                	// 20170717 - 수퍼플렉스 제외
					// 20171013 cok - 중국영화상영관 표기 제외
                    if (specialCode > 100 && (specialCode != 940 && specialCode != 970)) {
                        // 20170719 - 상영시간표 상영관 병합
                        if (specialCode == 300 || specialCode == 301) {
                            // 20170725 - 샤롯데/샤롯데프라이빗 표기 수정
                            // 샤롯데, 샤롯데/샤롯데프라이빗, 샤롯데프라이빗 형태로 수정
                            tempByMovieCinemaDDArray[tempByMovieScrrenDDArrayIndex] = cinemaCode;
                            tempByMovieMovieDDArray[tempByMovieScrrenDDArrayIndex] = movieCode;
                            tempByMovieScreenDDArray[tempByMovieScrrenDDArrayIndex] = 'screen' + filmCode + '' + translationCode + '' + tempByMovieSpecialCode + '' + tempByMovieSoundCode + '' + accompanyCode + '' + brandYN;
                            tempByMovieScrrenDDArrayIndex++;

                            //html += '       <li class="pit1"><strong>샤롯데/샤롯데프라이빗</strong></li>';
                            html += '       <li class="pit1"><strong>샤롯데</strong></li>';
                        }
                        else {
                        	html += '       <li class="pit1">' + screenName + '</li>';
                        }
                    };
                    if (accompanyCode > 10) {
                        html += '       <li>' + accompanyName + '</li>';
                    };
                    // 브랜드관이 아닌 경우 0
                    if (brandYN != '0') {                                                                           // 160628
                        // 20170123 - 브랜드관 명칭 표기하지 않음
                        //try {
                        //    var tempScreenNo = screenCode.toString().substr(4, 2);
                        //    html += '       <li>' + Number(tempScreenNo) + '관</li>';
                        //} catch (e) {
                        //    html += '       <li>' + brandName + '</li>';
                        //}
                        html += '       <li>' + brandName + '</li>';
                    };
                    html += '   </ul>';
                    html += '   <ul class="theater_time list' + movieRep + '" screenDiv="' + specialCode + '">';
                    html += '   </ul>';
                    html += '</dd>';

                    T.timeList.find('.movie' + movieRep).find('.cinema' + cinemaCode).append(html);
                };
            });

            timeNode.each(function (n) { // 3차 각 영화에 대한 회차정보 드로우
                var categoryCode = $(this)[0].CategoryCode;
                var subCode = $(this)[0].SubCode;
                var cinemaCode = $(this)[0].CinemaID;
                var screenCode = $(this)[0].ScreenID;
                var movieCode = $(this)[0].MovieCode;
                var movieRep = $(this)[0].RepresentationMovieCode;
                var startTime = $(this)[0].StartTime;
                var endTime = $(this)[0].EndTime;
                var seatToal = $(this)[0].TotalSeatCount;
                var seatReserved = $(this)[0].BookingSeatCount;
                var possibilltyYN = $(this)[0].IsBookingYN;
                var filmCode = $(this)[0].FilmCode;
                var specialCode = $(this)[0].ScreenDivisionCode;
                var translationCode = $(this)[0].TranslationDivisionCode;
                //이정열 추가 accompanyCode
                var accompanyCode = $(this)[0].AccompanyTypeCode;
                var soundCode = $(this)[0].SoundTypeCode;
                var playSequence = $(this)[0].PlaySequence;
                var typeCode = $(this)[0].SequenceNoGroupCode;
                var weekCode = $(this)[0].WeekendDivisionCode;
                var messageYN = $(this)[0].MessageYN;
                var playDate = $(this)[0].PlayDt; // 1603306
                //var playDayKR = $(this)[0].PlayDayKR; // 1603306
                var AccompanyTypeCode = $(this)[0].AccompanyTypeCode; // 1603307
                var brandYN = $(this)[0].BrandYN; // 1603307
                if (T.leng == 'KR') {
                    var typeName = $(this)[0].SequenceNoGroupNameKR;
                    var screenName = $(this)[0].ScreenNameKR;
                    var soundName = $(this)[0].SoundTypeNameKR;
                    var playDay = $(this)[0].PlayDayKR;
                    var brandName = $(this)[0].BrandNm_KR;      // 170116
                    var cinemaName = $(this)[0].CinemaNameKR;   // 170116
                } else {
                    var typeName = $(this)[0].SequenceNoGroupNameUS;
                    var screenName = $(this)[0].ScreenNameUS;
                    var soundName = $(this)[0].SoundTypeNameUS;
                    var playDay = $(this)[0].PlayDayUS;
                    var brandName = $(this)[0].BrandNm_US;      // 170116
                    var cinemaName = $(this)[0].CinemaNameUS;   // 170116
                }

                if (parseInt(screenCode, 10) < 10) screenCode = "0" + screenCode;

                html = '';

                if (possibilltyYN == 'N' || possibilltyYN == 'E') {
                    html += '<li class="soldout">';
                } else {
                    html += '<li>';
                }
                html += '<a href="javascript:void(0);" class="time_active t' + n + '">';
                if (screenName.length > 4) {                                                                        // 160608
                    html += '   <span class="cineD2 brand">';
                } else {
                    html += '   <span class="cineD2">';
                }

                // 브랜드관이 아닌 경우 0
                if (brandYN != '0') {                                                                           // 160628
                    // 20170123 - 브랜드관 명칭 표기하지 않음
                    try {
                        var tempScreenNo = screenCode.toString().substr(4, 2);
                        // 20170719 - ATMOS 관옆에 표기
                        if (soundCode == 300) {
                            html += '       <em>' + Number(tempScreenNo) + '관<em> | <em>' + soundName + '</em>';
                        }
                        else {
                            html += '       <em>' + Number(tempScreenNo) + '관</em>';
                        }
                    } catch (e) {
                        // 20170719 - ATMOS 관옆에 표기
                        if (soundCode == 300) {
                            html += '       <em>' + screenName + '<em> | <em>' + soundName + '</em>';
                        }
                        else {
                            html += '       <em>' + screenName + '</em>';
                        }
                    }
                    //html += '       <li>' + brandName + '</li>';
                }
                else {
                    // 20170719 - ATMOS 관옆에 표기
                    if (soundCode == 300) {
                        html += '       <em>' + screenName + '<em> | <em>' + soundName + '</em>';
                    }
                    else {
                        html += '       <em>' + screenName + '</em>';
                    }
                }

                //html += '       <em>' + screenName + '</em>';

                //if (soundCode > 100) {                    // ATMOS      161209
                //    html += '       <em>' + soundName + '</em>';
                //};
                html += '   </span>';
                html += '   <span class="clock">';

                switch (typeName) {
                    case '조조':
                        html += '<em class="seat iri">' + typeName + '</em>';
                        break;
                    case '심야':
                        html += '<em class="seat ini">' + typeName + '</em>';
                        break;
                };

                html += startTime + ' <span> ~ ' + endTime + '</span></span>';

                if (possibilltyYN == 'N') {
                    if (T.leng == 'KR') {
                        html += '<span class="ppNum">예매마감</span>';
                    } else {
                        html += '<span class="ppNum">Finish</span>';
                    };
                } else if (possibilltyYN == 'E') {
                    if (T.leng == 'KR') {
                        html += '<span class="ppNum">매진</span>';
                    } else {
                        html += '<span class="ppNum">Finish</span>';
                    };
                } else if (possibilltyYN == 'J') {
                    if (T.leng == 'KR') {
                        html += '<span class="ppNum">상영준비중</span>';
                    } else {
                        html += '<span class="ppNum">Ready</span>';
                    };
                } else {
                    // 20170607 전체 좌석수와 예매된 좌석수가 -1보다 클 경우에만 추가
                    if (seatToal > -1 && seatReserved > -1) {
                        if (T.leng == 'KR') {
                            html += '<span class="ppNum"><em class="color_brown" title="좌석 확인">' + seatReserved + '</em>석 / ' + seatToal + '석</span>';
                        } else {
                            html += '<span class="ppNum"><em class="color_brown" title="Seats">' + seatReserved + '</em> / ' + seatToal + ' Seats</span>';
                        };
                    }
                };
                

                html += '</a>';
                html += '</li>';

                // 20170719 - 상영시간표 상영관 병합
                var tempByMovieSCDivSpecialCode = specialCode;
                var tempByMovieSCDivSoundCode = soundCode;

                if (specialCode == 301) {
                    // 샤롯데, 샤롯데프라이빗 -> 샤롯데/샤롯데프라이빗으로
                    tempByMovieSCDivSpecialCode = 300;
                }
                else if (specialCode == 940) {
                    // 수퍼플렉스 -> 일반관
                    tempByMovieSCDivSpecialCode = 100;
                }
                else if (specialCode == 970) { // 20171013 cok - 중국영화상영관 일반관 병합
                	// 중국영화상영관 -> 일반관
                	tempByMovieSCDivSpecialCode = 100;
                }

                if (soundCode == 300) {
                    tempByMovieSCDivSoundCode = 100;
                }

                //var cinemaName = T.timeList.find('.movie' + movieRep).find('h4').next().find('dt').text();  // 170116
                //var scDiv = T.timeList.find('.time' + cinemaCode).find('.movie' + movieRep).find('.screen' + filmCode + '' + translationCode + '' + specialCode + '' + soundCode + '' + accompanyCode + '' + brandYN).find('.theater_time').attr('screenDiv'); // 170102
                // 20170719 - 상영관 병합
                // specialCode -> tempByMovieSCDivSpecialCode 변경
                var scDiv = T.timeList.find('.time' + cinemaCode).find('.movie' + movieRep).find('.screen' + filmCode + '' + translationCode + '' + tempByMovieSCDivSpecialCode + '' + tempByMovieSCDivSoundCode + '' + accompanyCode + '' + brandYN).find('.theater_time').attr('screenDiv'); // 170102
                // 1603306
                // 20170725 - specialCode 추가
                T.timeList.find('.movie' + movieRep).find('.cinema' + cinemaCode).find('.screen' + filmCode + '' + translationCode + '' + tempByMovieSCDivSpecialCode + '' + tempByMovieSCDivSoundCode + '' + accompanyCode + '' + brandYN).find('.theater_time').append(html)
                .find('a').last().data({ 'screenName': screenName, 'brandName': brandName, 'playWeek': playDay, 'playDate': playDate, 'AccompanyTypeCode': AccompanyTypeCode, 'possibilltyYN': possibilltyYN, 'messageYN': messageYN, 'cinemaName': cinemaName, 'cinemaCode': cinemaCode, 'movieCode': movieCode, 'screenCode': screenCode, 'playSequence': playSequence, 'startTime': startTime, 'endTime': endTime, 'typeCode': typeCode, 'weekCode': weekCode, 'screenDiv': scDiv, 'specialCode': specialCode }); // 1603306
            });

            // 20170725 - 샤롯데/샤롯데프라이빗 표기 수정
            // 샤롯데, 샤롯데/샤롯데프라이빗, 샤롯데프라이빗 형태로 수정
            var charlotteByMovieFlag = false;
            var charlotteByMoviePrivateFlag = false;
            for (var i = 0 ; i < tempByMovieScreenDDArray.length ; i++) {

                $('.movie' + tempByMovieMovieDDArray[i]).find($('.cinema' + tempByMovieCinemaDDArray[i])).find($('.' + tempByMovieScreenDDArray[i])).find('a').each(function (n) {
                    if ($(this).data('specialCode') == 300) {
                        charlotteByMovieFlag = true;
                    }

                    if ($(this).data('specialCode') == 301) {
                        charlotteByMoviePrivateFlag = true;
                    }
                });

                if (charlotteByMovieFlag && !charlotteByMoviePrivateFlag) {
                    $('.movie' + tempByMovieMovieDDArray[i]).find($('.cinema' + tempByMovieCinemaDDArray[i])).find($('.' + tempByMovieScreenDDArray[i])).find('.pit1').find('strong').html('샤롯데')
                }
                else if (!charlotteByMovieFlag && charlotteByMoviePrivateFlag) {
                    $('.movie' + tempByMovieMovieDDArray[i]).find($('.cinema' + tempByMovieCinemaDDArray[i])).find($('.' + tempByMovieScreenDDArray[i])).find('.pit1').find('strong').html('샤롯데프라이빗')
                }
                else if (charlotteByMovieFlag && charlotteByMoviePrivateFlag) {
                    $('.movie' + tempByMovieMovieDDArray[i]).find($('.cinema' + tempByMovieCinemaDDArray[i])).find($('.' + tempByMovieScreenDDArray[i])).find('.pit1').find('strong').html('샤롯데/샤롯데프라이빗')
                }

                charlotteByMovieFlag = false;
                charlotteByMoviePrivateFlag = false;
            }

            //T.timeList.find('.time_line').find('.theater_time').each(function () {
            //    var firstVar = 0;
            //    var lastVar = 0;

            //    for (i = 0; i < Math.round($(this).find('li').length / 4) ; i++) {
            //        firstVar = lastVar + 8;
            //        lastVar = firstVar + 8;
            //        $(this).find('li').slice(firstVar, lastVar).addClass('bg_Btype');
            //    };
            //});

            //T.timeList.find('.time_line').each(function () {
            //    if ($(this).find('dd').length == 0) {
            //        $(this).append(T.noData);
            //    };
            //});

            T.filmSort(T.cookieDraw);
            T.platEvent();
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 회차 정보 드로우 - 영화관별
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        playCinemaDraw: function () {
            T = this;
            var html = '';

            // 상영관별, 영화별, 개별 회차 박스 목록 바로 위 '2D|샤롯데', '2D|샤롯데프라이빗' 등을 표현하기 위한 데이터
            var cinemaNode = $(playUtill.PlaySeqsHeader.Items); // 상영관정보 노드
            // 개별 회차 박스를 표현하기 위한 데이터
            var timeNode = $(playUtill.PlaySeqs.Items); // 회차 노드

            //cinemaNode.sort(function (a, b) { // 상영관정보 정렬
            //    return a.BookingSortSequence < b.BookingSortSequence ? -1 : a.BookingSortSequence > b.BookingSortSequence ? 1 : 0;
            //});

            // 회차는 가장 빠른 개봉시간 순으로 정렬
            timeNode.sort(function (a, b) { // 회차 정렬
                return a.StartTime < b.StartTime ? -1 : a.StartTime > b.StartTime ? 1 : 0;
            });

            // 영화관 정보가 없을 경우는 화면에 회차 정보를 노출시키지 않음
            if (cinemaNode.length < 1) {
                T.cineList.hide().find('.time_aType').remove();
                T.timeArea.find('.time_aType').remove();
                if (T.leng == 'KR') {
                    T.noMovie.show().find('span').text(T.noDataText);
                } else {
                    T.noMovie.show().find('span').text(T.noDataText2);
                };
                return false;
            } else {
                // 영화별조회 정렬에 따른 회차 정보를 출력하는 div 제거
                T.timeArea.find('.time_aType').remove();
                // 데이터 없음을 표현하는 영역 숨김처리
                T.noMovie.hide();

                // 영화관별 조회, 영화별조회 탭 중 클릭된 탭의 인덱스
                var idx = $('.time_tab .on').parent().index();
                // 영화관별 조회를 선택했을 경우 영화관별 회차 목록이 출력되도록 설정
                if (idx == 0) {
                    T.cineList.show();
                    T.timeList.hide();
                // 영화별 조회를 선택했을 경우 영화별 회차 목록이 출력되도록 설정
                } else {
                    T.cineList.hide();
                    T.timeList.show();
                };
            };

            var cinemaTotal = 0;
            var cinemaBull = '', movieBull = '', filmBull = ''; // 영화관순 정렬 변수
            var timeBull = '', cineBull = ''; // 영화순 정렬 변수

            // 20170725 - 샤롯데/샤롯데프라이빗 표기 수정
            // 샤롯데, 샤롯데/샤롯데프라이빗, 샤롯데프라이빗 형태로 수정
            var tempCinemaDDArray = new Array();
            var tempScreenDDArray = new Array();
            var tempMovieDDArray = new Array();
            var tempScrrenDDArrayIndex = 0;

            // 상영관, 영화, 개별 회차 박스 목록 바로 위 '2D|샤롯데', '2D|샤롯데프라이빗' 등을 화면에 추가
            cinemaNode.each(function (n) {
                var cinemaCode = $(this)[0].CinemaID;
                var movieCode = $(this)[0].MovieCode;
                var screenCode = $(this)[0].ScreenID;
                var movieRep = $(this)[0].RepresentationMovieCode;
                var brandYN = $(this)[0].BrandYN;                                                                   // 160628
                if (T.leng == 'KR') {
                    var arrayName = $(this)[0].ScreenNameKR;
                    var cinemaName = $(this)[0].CinemaNameKR;
                    var movieName = $(this)[0].MovieNameKR;
                    var filmName = $(this)[0].FilmNameKR;
                    var viewingName = $(this)[0].ViewGradeNameKR;
                    var soundName = $(this)[0].SoundTypeNameKR;
                    var fourdName = $(this)[0].FourDTypeNameKR;
                    var divisionName = $(this)[0].TranslationDivisionNameKR;
                    var accompanyName = $(this)[0].AccompanyTypeNameKR;
                    var screenName = $(this)[0].ScreenDivisionNameKR;
                    var brandName = $(this)[0].BrandNm_KR;
                } else {
                    var arrayName = $(this)[0].ScreenNameUS;
                    var cinemaName = $(this)[0].CinemaNameUS;
                    var movieName = $(this)[0].MovieNameUS;
                    var filmName = $(this)[0].FilmNameUS;
                    var viewingName = $(this)[0].ViewGradeNameUS;
                    var soundName = $(this)[0].SoundTypeNameUS;
                    var fourdName = $(this)[0].FourDTypeNameUS;
                    var divisionName = $(this)[0].TranslationDivisionNameUS;
                    var accompanyName = $(this)[0].AccompanyTypeNameUS;
                    var screenName = $(this)[0].ScreenDivisionNameUS;
                    var brandName = $(this)[0].BrandNm_US;
                }
                var filmCode = $(this)[0].FilmCode;
                var soundCode = $(this)[0].SoundTypeCode;
                var fourdCode = $(this)[0].FourDTypeCode;
                var divisionCode = $(this)[0].TranslationDivisionCode;
                var accompanyCode = $(this)[0].AccompanyTypeCode;
                var specialCode = $(this)[0].ScreenDivisionCode;
                var translationCode = $(this)[0].TranslationDivisionCode;
                var viewingCode = $(this)[0].ViewGradeCode;
                var totalCode = $(this)[0].TotalSeatCount;

                if (viewingCode == '0') {
                    viewingCode = 'all'; // 전체관람가 변환
                    if (T.leng != 'KR') {
                        viewingCode = 'all2';
                    }
                } else if (viewingCode == '18') {
                    if (T.leng != 'KR') {
                        viewingCode = '19';
                    }
                };

                // 영화관 영역 화면에 출력
                if (!T.cineList.find('div').hasClass('time' + cinemaCode)) { // 1차 "영화관" 정보 드로우
                    timeBull = cinemaCode;
                    movieBull = '';

                    html = '<div class="time_aType time' + cinemaCode + '">';
                    if (T.step != 1) {
                        html += '   <h4 class="time_tit">' + cinemaName + '</h4>';
                    };
                    html += '   <dl class="time_line movie' + movieRep + '">';
                    html += '       <dt>';

                    if (T.leng == 'KR') {
                        html += '           <span class="grade_' + viewingCode + '">' + viewingName + '</span>' + movieName;
                        html += '           <a href="javascript:void(0)" class="btn_detail" title="레이어 열림"><img src="/LCHS/Image/Btn/btn_time_view.png" alt="상영관 상세보기"></a>';
                    } else {
                        html += '           <span class="grade_' + viewingCode + '">' + viewingCode + '</span>' + movieName;
                    };
                    html += '       </dt>';
                    html += '   </dl>';
                    html += '</div>';

                    T.cineList.append(html).find('dl').last().data({ 'cinemaName': cinemaName }).find(".btn_detail").data({ 'movieCode': movieRep });
                };

                // 영화관에 속한 영화 제목 화면에 출력
                if (!T.cineList.find('.time' + cinemaCode).find('.time_line').hasClass('movie' + movieRep)) { // 1차 "영화관" 정보 드로우
                    html = '<dl class="time_line movie' + movieRep + '">';
                    html += '   <dt>';
                    if (T.leng == 'KR') {
                        html += '       <span class="grade_' + viewingCode + '">' + viewingName + '</span>' + movieName;
                        html += '       <a href="javascript:void(0)" class="btn_detail" title="레이어 열림"><img src="/LCHS/Image/Btn/btn_time_view.png" alt="상영관 상세보기"></a>';
                    } else {
                        html += '       <span class="grade_' + viewingCode + '">' + viewingCode + '</span>' + movieName;
                    };
                    html += '   </dt>';
                    html += '</dl>';

                    T.cineList.find('.time' + cinemaCode).append(html).find('dl').last().data({ 'cinemaName': cinemaName }).find(".btn_detail").data({ 'movieCode': movieRep });

                };

                // 20170719 - 상영시간표 상영관 병합
                var tempSepcialCode = specialCode;
                var tempSoundCode = soundCode;

                if (specialCode == 301) {
                    tempSepcialCode = 300;
                }
                else if (specialCode == 940) {
                    // 수퍼플렉스 -> 일반관
                    tempSepcialCode = 100;
                }
                else if (specialCode == 970) { // 20171013 cok - 중국영화상영관 일반관 병합
                	// 중국영화상영관 -> 일반관
                	tempSepcialCode = 100;
                }

                // ATMOS 표기 제외, 2D에 포함
                if (soundCode == 300) {
                    tempSoundCode = 100;
                }

                // '2D|샤롯데', '2D|샤롯데프라이빗'등의 개별 회차 바로 위 데이터 설정
                // 2차 영화관에 대한 영화리스트 드로우[이정열 accompanyCode  추가(1/8)
                // 20170719 - 상영시간표 상영관 병합
                // specialCode -> tempSpecialCode로 변경
                //if (!T.cineList.find('.time' + cinemaCode).find('.movie' + movieRep).find('dd').hasClass('screen' + filmCode + '' + translationCode + '' + specialCode + '' + soundCode + '' + accompanyCode + '' + brandYN)) {
                if (!T.cineList.find('.time' + cinemaCode).find('.movie' + movieRep).find('dd').hasClass('screen' + filmCode + '' + translationCode + '' + tempSepcialCode + '' + tempSoundCode + '' + accompanyCode + '' + brandYN)) { // 170102
                    //html = '<dd class="screen' + filmCode + '' + translationCode + '' + specialCode + '' + soundCode + '' + accompanyCode + '' + brandYN + ' film' + filmCode + '">'; // 170102
                    // 20170719 - 상영시간표 상영관 병합
                    // specialCode -> tempSpecialCode로 변경
                    html = '<dd class="screen' + filmCode + '' + translationCode + '' + tempSepcialCode + '' + tempSoundCode + '' + accompanyCode + '' + brandYN + ' film' + filmCode + '">'; // 170102
                    html += '   <ul class="cineD1">';
                    html += '       <li>' + filmName + ' </li>';
                    html += '       <li>' + divisionName + '</li>';
                    //ATMOS      161209
                    // 20170717 - Atmos 표기 제외
                    if (soundCode > 100 && soundCode != 300) {
                        html += '       <li>' + soundName + '</li>';
                    };
                	// 20170719 - 수퍼플렉스 표기 제외
                	// 20171013 cok - 중국영화상영관 표기 제외
                    if (specialCode > 100 && (specialCode != 940 && specialCode != 970)) {
                        // 20170719 - 상영시간표 상영관 병합
                        if (specialCode == 300 || specialCode == 301) {
                            // 20170725 - 샤롯데/샤롯데프라이빗 표기 수정
                            // 샤롯데, 샤롯데/샤롯데프라이빗, 샤롯데프라이빗 형태로 수정
                            tempCinemaDDArray[tempScrrenDDArrayIndex] = cinemaCode;
                            tempMovieDDArray[tempScrrenDDArrayIndex] = movieCode;
                            tempScreenDDArray[tempScrrenDDArrayIndex] = 'screen' + filmCode + '' + translationCode + '' + tempSepcialCode + '' + tempSoundCode + '' + accompanyCode + '' + brandYN;
                            tempScrrenDDArrayIndex++;

                            //html += '       <li class="pit1"><strong>샤롯데/샤롯데프라이빗</strong></li>';
                            html += '       <li class="pit1"><strong>샤롯데</strong></li>';
                        }
                        else {
                            html += '       <li class="pit1">' + screenName + '</li>';
                        }
                    };
                    if (accompanyCode > 10) {
                        html += '       <li>' + accompanyName + '</li>';
                    };
                    // 브랜드관 여부에 따라 브랜드관명 추가 출력
                    // 브랜드관이 아닌 경우 0
                    if (brandYN != '0') {                                                                           // 160628
                        // 20170123 - 브랜드관 명칭 표기하지 않음
                        //try {
                        //    var tempScreenNo = screenCode.toString().substr(4, 2);
                        //    html += '       <li>' + Number(tempScreenNo) + '관</li>';
                        //} catch (e) {
                        //    html += '       <li>' + brandName + '</li>';
                        //}
                        html += '       <li>' + brandName + '</li>';
                    };
                    html += '   </ul>';
                    html += '   <ul class="theater_time list' + movieCode + '" screenDiv="' + specialCode + '">';
                    html += '   </ul>';
                    html += '</dd>';

                    T.cineList.find('.time' + cinemaCode).find('.movie' + movieRep).append(html);
                };
            });

            // 개별 회차 출력
            timeNode.each(function (n) { // 3차 각 영화에 대한 회차정보 드로우
                var categoryCode = $(this)[0].CategoryCode;
                var subCode = $(this)[0].SubCode;
                var cinemaCode = $(this)[0].CinemaID;
                var screenCode = $(this)[0].ScreenID;
                var movieCode = $(this)[0].MovieCode;
                var movieRep = $(this)[0].RepresentationMovieCode;
                var startTime = $(this)[0].StartTime;
                var endTime = $(this)[0].EndTime;
                var seatToal = $(this)[0].TotalSeatCount;
                var seatReserved = $(this)[0].BookingSeatCount;
                var possibilltyYN = $(this)[0].IsBookingYN;
                var filmCode = $(this)[0].FilmCode;
                var specialCode = $(this)[0].ScreenDivisionCode;
                var translationCode = $(this)[0].TranslationDivisionCode;
                //이정열 수정 accompanyCode 추가
                var accompanyCode = $(this)[0].AccompanyTypeCode;
                var soundCode = $(this)[0].SoundTypeCode;
                var playSequence = $(this)[0].PlaySequence;
                var typeCode = $(this)[0].SequenceNoGroupCode;
                var weekCode = $(this)[0].WeekendDivisionCode;
                var messageYN = $(this)[0].MessageYN;
                var playDate = $(this)[0].PlayDt; // 1603306
                var AccompanyTypeCode = $(this)[0].AccompanyTypeCode; // 1603306
                //var playDayKR = $(this)[0].PlayDayKR; // 1603307
                var brandYN = $(this)[0].BrandYN;                                                                   // 160628
                if (T.leng == 'KR') {
                    var typeName = $(this)[0].SequenceNoGroupNameKR;
                    var screenName = $(this)[0].ScreenNameKR;
                    var soundName = $(this)[0].SoundTypeNameKR;
                    var playDay = $(this)[0].PlayDayKR;
                    var brandName = $(this)[0].BrandNm_KR;      // 170116
                    var cinemaName = $(this)[0].CinemaNameKR;   // 170116
                } else {
                    var typeName = $(this)[0].SequenceNoGroupNameUS;
                    var screenName = $(this)[0].ScreenNameUS;
                    var soundName = $(this)[0].SoundTypeNameUS;
                    var playDay = $(this)[0].PlayDayUS;
                    var brandName = $(this)[0].BrandNm_US;      // 170116
                    var cinemaName = $(this)[0].CinemaNameUS;   // 170116
                };

                if (parseInt(screenCode, 10) < 10) screenCode = "0" + screenCode;

                html = '';

                if (possibilltyYN == 'N' || possibilltyYN == 'E') {
                    html += '<li class="soldout">';
                } else {
                    html += '<li>';
                }
                html += '<a href="javascript:void(0);" class="time_active t' + n + '">';
                if (screenName.length > 4) {                                                                        // 160608
                    html += '   <span class="cineD2 brand">';
                } else {
                    html += '   <span class="cineD2">';
                }

                // 브랜드관 여부에 따라 브랜드관 명 출력
                // 브랜드관이 아닌 경우 0
                if (brandYN != '0') {                                                                           // 160628
                    // 20170123 - 브랜드관 명칭 표기하지 않음
                    try {
                        var tempScreenNo = screenCode.toString().substr(4, 2);
                        // 20170719 - 상영관 병합, ATmos 관옆에 표기
                        if (soundCode == 300) {
                            html += '       <em>' + Number(tempScreenNo) + '관<em> | <em>' + soundName + '</em>';
                        }
                        else {
                            html += '       <em>' + Number(tempScreenNo) + '관</em>';
                        }
                    } catch (e) {
                        if (soundCode == 300) {
                            html += '       <em>' + screenName + '<em> | <em>' + soundName + '</em>';
                        }
                        else {
                            html += '       <em>' + screenName + '</em>';
                        }
                    }
                    //html += '       <li>' + brandName + '</li>';
                }
                else {
                    if (soundCode == 300) {
                        html += '       <em>' + screenName + '<em> | <em>' + soundName + '</em>';
                    }
                    else {
                        html += '       <em>' + screenName + '</em>';
                    }
                }
                //html += '       <em>' + screenName + '</em>';
                //if (soundCode > 100) {                              // 161209
                //    html += '       <em>' + soundName + '</em>';
                //};
                html += '   </span>';

                html += '   <span class="clock">';

                // 조조/심야에 따른 아이콘 출력
                switch (typeName) {
                    case '조조':
                        html += '<em class="seat iri">' + typeName + '</em>';
                        break;
                    case '심야':
                        html += '<em class="seat ini">' + typeName + '</em>';
                        break;
                };

                html += startTime + ' <span> ~ ' + endTime + '</span></span>';

                if (possibilltyYN == 'N') {
                    if (T.leng == 'KR') {
                        html += '<span class="ppNum">예매마감</span>';
                    } else {
                        html += '<span class="ppNum">Finish</span>';
                    };
                } else if (possibilltyYN == 'E') {
                    if (T.leng == 'KR') {
                        html += '<span class="ppNum">매진</span>';
                    } else {
                        html += '<span class="ppNum">Finish</span>';
                    };
                } else if (possibilltyYN == 'J') {
                    if (T.leng == 'KR') {
                        html += '<span class="ppNum">상영준비중</span>';
                    } else {
                        html += '<span class="ppNum">Ready</span>';
                    };
                } else {
                    // 20170607 전체 좌석수와 예매된 좌석수가 -1보다 클 경우에만 예매좌석/총좌석 출력
                    if (seatToal > -1 && seatReserved > -1) {
                        if (T.leng == 'KR') {
                            html += '<span class="ppNum"><em class="color_brown" title="좌석 확인">' + seatReserved + '</em>석 / ' + seatToal + '석</span>';
                        } else {
                            html += '<span class="ppNum"><em class="color_brown" title="Seats">' + seatReserved + '</em> / ' + seatToal + ' Seats</span>';
                        };
                    }
                };

                html += '</a>';
                html += '</li>';
                //이정열 accompanyCode 추가(1/8)
                //var cinemaName = T.cineList.find('.time' + cinemaCode).find('h4').text();  // 170116
                // 20170719 - 상영시간표 상영관 병합
                var tempSCDivSpecialCode = specialCode;
                var tempSCDivSoundCode = soundCode;

                if (specialCode == 301) {
                    // 샤롯데, 샤롯데프라이빗 -> 샤롯데/샤롯데프라이빗으로
                    tempSCDivSpecialCode = 300;
                }
                else if (specialCode == 940) {
                    // 수퍼플렉스 -> 일반관
                    tempSCDivSpecialCode = 100;
                }
                else if (specialCode == 970) { // 20171013 cok - 중국영화상영관 일반관 병합
                	// 중국영화상영관 -> 일반관
                	tempSCDivSpecialCode = 100;
                }

                if (soundCode == 300) {
                    tempSCDivSoundCode = 100;
                }

                var scDiv = T.cineList.find('.time' + cinemaCode).find('.movie' + movieRep).find('.screen' + filmCode + '' + translationCode + '' + tempSCDivSpecialCode + '' + tempSCDivSoundCode + '' + accompanyCode + '' + brandYN).find('.theater_time').attr('screenDiv'); // 170102
                // 1603306
                // 20170725 - specialCode 추가
                T.cineList.find('.time' + cinemaCode).find('.movie' + movieRep).find('.screen' + filmCode + '' + translationCode + '' + tempSCDivSpecialCode + '' + tempSCDivSoundCode + '' + accompanyCode + '' + brandYN).find('.theater_time').append(html) // 170102
                .find('a').last().data({ 'screenName': screenName, 'brandName': brandName, 'playWeek': playDay, 'playDate': playDate, 'AccompanyTypeCode': AccompanyTypeCode, 'possibilltyYN': possibilltyYN, 'messageYN': messageYN, 'cinemaName': cinemaName, 'cinemaCode': cinemaCode, 'movieCode': movieCode, 'screenCode': screenCode, 'playSequence': playSequence, 'startTime': startTime, 'endTime': endTime, 'typeCode': typeCode, 'weekCode': weekCode, 'screenDiv': scDiv, 'cinemaType': T.cineList.find('.time' + cinemaCode).find('.movie' + movieRep).find('.screen' + filmCode + '' + translationCode + '' + specialCode + '' + accompanyCode).find('.pit1').text(), 'specialCode': specialCode });
            });

            // 20170725 - 샤롯데/샤롯데프라이빗 표기 수정
            // 샤롯데, 샤롯데/샤롯데프라이빗, 샤롯데프라이빗 형태로 수정
            var charlotteFlag = false;
            var charlottePrivateFlag = false;
            for (var i = 0 ; i < tempScreenDDArray.length ; i++) {

                $('.time' + tempCinemaDDArray[i]).find($('.movie' + tempMovieDDArray[i])).find($('.' + tempScreenDDArray[i])).find('a').each(function (n) {
                    if ($(this).data('specialCode') == 300) {
                        charlotteFlag = true;
                    }

                    if ($(this).data('specialCode') == 301) {
                        charlottePrivateFlag = true;
                    }
                });

                if (charlotteFlag && !charlottePrivateFlag) {
                    $('.time' + tempCinemaDDArray[i]).find($('.movie' + tempMovieDDArray[i])).find($('.' + tempScreenDDArray[i])).find('.pit1').find('strong').html('샤롯데')
                }
                else if (!charlotteFlag && charlottePrivateFlag) {
                    $('.time' + tempCinemaDDArray[i]).find($('.movie' + tempMovieDDArray[i])).find($('.' + tempScreenDDArray[i])).find('.pit1').find('strong').html('샤롯데프라이빗')
                }
                else if (charlotteFlag && charlottePrivateFlag) {
                    $('.time' + tempCinemaDDArray[i]).find($('.movie' + tempMovieDDArray[i])).find($('.' + tempScreenDDArray[i])).find('.pit1').find('strong').html('샤롯데/샤롯데프라이빗')
                }

                charlotteFlag = false;
                charlottePrivateFlag = false;
            }

            //T.cineList.find('.time_line').find('.theater_time').each(function () {
            //    var firstVar = 0;
            //    var lastVar = 0;

            //    for (i = 0; i < Math.round($(this).find('li').length / 4) ; i++) {
            //        firstVar = lastVar + 8;
            //        lastVar = firstVar + 8;
            //        $(this).find('li').slice(firstVar, lastVar).addClass('bg_Btype');
            //    };
            //});

            // 초기 예매화면 진입시 영화별 회차 목록 화면도 구성
            if (T.step == 0) {
                T.playMovieDraw();
            } else {
                T.filmSort(T.cookieDraw);
                T.platEvent();
            }
        },

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 회차 정보 정렬
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        filmSort: function (sort) {
            var T = this;

            T.timeArea.find('.time_box').find('.time_aType').removeClass('hidden').show().find('.time_line').removeClass('hidden').show().find('dd').removeClass('hidden').show();

            if (cookieJson.ticketingState.ticketing.sortFilmCode != 'all' && cookieJson.ticketingState.ticketing.sortFilmCode != '') {
                T.timeArea.find('.time_line').find('dd').not('.film' + cookieJson.ticketingState.ticketing.sortFilmCode).addClass('hidden').hide();
            };

            T.timeArea.find('.time_box').find('dl').each(function () {
                if ($(this).find('dd.hidden').length == $(this).find('dd').length) {
                    $(this).addClass('hidden').hide();
                } else {
                    $(this).removeClass('hidden').show();
                };
            });

            T.timeArea.find('.time_box').find('.time_aType').each(function (n) {
                if ($(this).find('.time_line.hidden').length == $(this).find('.time_line').length) {
                    $(this).addClass('hidden').hide();
                } else {
                    $(this).removeClass('hidden').show();
                };
            });

            T.timeArea.find('.time_box').each(function () {
                if (T.timeArea.find('.time_box').find('.time_aType').length == T.timeArea.find('.time_box').find('.time_aType.hidden').length) {
                    T.timeArea.find('.time_box').find('.time_noData_case1').show();
                } else {
                    T.timeArea.find('.time_box').find('.time_noData_case1').hide();
                };
            });
        },
    };
});
