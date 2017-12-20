/************************************************
* 설          명: 영화 > 영화상세 스크립트
* 작    성    자: 박규홍
* 최초 작성 일자: 15.08.26
*	15.09.10 - 스크립트 파일로 분리 및 코드 정리
*	15.10.02 - 문서 표준화
*	15.10.16 - 리뷰 저장시 오류 수정
*			 - 리뷰 저장 버튼 클릭시 처리 방법 수정
*			 - 리뷰 삭제 확인 추가, removeReview()
*			 - 리뷰 삭제 confirm modal 추가
*	15.10.26 - WAS 연결, getMovieInfo, makeMovieInfo, appendMoviePreferScore, appendSpecial
*	15.10.29 - WAS 연결, 리뷰 CUD
*			 - 리뷰 오류 수정
*	15.10.30 - 시놉시스 없어도 제목 표시 하도록 변경
*			 - 감독 및 출연진 UI 수정
*			 - 리뷰 클릭 로그인 방식 수정
*			 - 썸네일 좌/우 버튼 기능 수정
*			 - 리뷰 수정상태일 때 별점 변경 없이 저장 가능하도록 수정
*	15.11.02 - 리뷰 CUD 요청 후 로직 변경 -> 요청 > 목록 reroad > 완료 메시지 표시
*			 - 리뷰 점수 0점 입력 가능하도록 수정, 점수 미입력시 0점으로 설정
*	15.11.03 - 리뷰 입력란 오류 수정, 연속입력 후 blur시 멘트 초기화 현상 수정
*			 - 리뷰 수정시 리뷰 표시 오류 수정
*			 - 리뷰 수정시 blur시 기본 메시지 미 표시 오류 수정
*			 - 리뷰 CUD 처리시 등록 버튼 중복 처리 오류 수정
*			 - 리뷰 comment 유효성 검사 수정, 첫 글자 공백 체크 및 메시지 표시 추가
*			 - 리뷰 추천 WAS 처리
*	15.11.04 - 본인 리뷰 추천 오류 수정
*	15.12.29 - 영화 트레일러 바인딩 변수 수정
************************************************/
/****************************************
* 상수 선언
****************************************/
URL = $(location).attr("href");						//현재URL
// 리뷰
REVIEW_PAGE_SIZE = 4;								//리뷰 목록 초기값
QUERY = RequestParams(document.location.search);	//페이지 파마메터
//QUERY.movie = 10325;
// 이벤트
EVENT_BASE_PAGE_SIZE = 4;	// 이벤트 처음 표시수
EVENT_MAX_DISPLAY_SIZE = 16;	// 이벤트 최대 표시수

/****************************************
* 전역 변수 선언
****************************************/
// 영화정보
var TITLE;							// 영화제목
var IMAGE_URL;						// 포스터 Url
var DESCRIPTION;					// 시놉
var IS_RELEASE_STATUS = false;		// 개봉 상태, false:미개봉 - 선호도, 평점, 리뷰 표시에 사용
// 리뷰
var TYPE, ORDER, PAGE;				// 리뷰 타입, 정렬기준, 현재페이지, 페이지크기
var CURRENT_REVIE_ID;				// 리뷰 수정용, 현재선택 리뷰 ID
var OLD_COMMENT;					// 리뷰 수정용, 기존 comment
var OLD_SCORE = 0;					// 리뷰 수정용, 기존 평점
var NEW_SCORE = -1;					// 현재 선택한 평점 -> 기본 0점 적용 가능
var MY_REVIEWS;						// 마이리뷰 기존 DATA 저장용
var IS_PROCESS;						// 처리중 여부, 리뷰 등록 요청 상태 체크용
var COMMENT_BASE_TEXT_LOGOFF = "영화 리뷰는 로그인 후에 작성하실수 있습니다.";
var COMMENT_BASE_TEXT = "영화 리뷰를 작성해 주세요.";
var REVIEW_TAB_TEXT_ALL = "전체";
var REVIEW_AREA_TITLE = "평점 및 영화 리뷰";
var REVIEW_POINT_TITLE = "평점";
// 이벤트
var EVENT_INFORS = new Array();	// 이벤트 정보 배열
/****************************************
* 초기화
****************************************/
$(location).ready(function () {
    // Hint -----------------------> 디버깅 용 변수는 실서버 작용시 주석 처리
    //디버깅용 변수
    //_debug = true;			//true: 디버깅
    _notRedirection = true;	//true: 화면이동 정지

    MY_REVIEWS = new Array();

    //영화정보 표시
    getMovieInfo();

    //컨트롤 초기화
    initControls();
    //플레이어 초기화
    initPlayer();

    // 20170424 - Facebook 연동 로그 설정
    setFacebookLog();
});

// 리뷰 영역으로 스크롤 한다.
setPositionToReview = function () {
    if (URL.indexOf("#Reviews") > -1) {
        event.preventDefault();
        $('body').animate({ scrollTop: $("#divReview").offset().top }, 1000);
    }
}

//링크 및 버튼 클릭 이벤트 초기화
//params>
//return>
initControls = function () {
    //SNS 클릭 이벤트 설정
    $("#aFacebook").click(function () { ToShare("f", URL); });			//Facebook
    $("#aTwitter").click(function () { ToShare("t", URL, TITLE); });	//Twitter
    $("#aKakaoStory").click(function () { ToShare("k", URL, TITLE); });		//Kakao Story
    $("#aUrl").click(copyThis);		// URL 복사

    //더보기 버튼 이벤트 설정
    $("#aMore").click(function () {
        appenEvents(2);													//관련 이벤트 추가 목록 표시
        //$("#aClose").show();											//닫기 버튼 표시
        $("#aMore").hide();												//더 보기 버튼 숨김
    });

    //리뷰 저장 버튼 클릭 이벤트
    $("#btnSave").click(function () {
        //로그인 유저 정보가 없으면 로그인 팝업 표시
        if (memberInfo.UserID == "" || memberInfo.UserID == undefined) {
            showLoginForReview();
        } else {
            // 상영 예정작인경우 Alert
            // 20161128 - 상영예정작 Alert 주석처리
            //if (IS_RELEASE_STATUS == false) {
            //    showMessage("COM1206", this);
            //    return;
            //}

            // 비회원 여부 확인
            if (memberInfo.LotteCinemaMemberGubun == "3") {
                showMessage("COM1201", this);
            } else {
                saveReview();
            }
        }
    });
    //별점 컨트롤 초기화
    $.fn.starRating(setStarScore);										//별점 클릭시 setStarScore 함수 호출
}
// 로그인 팝업 표시 및 리턴 Url 설정, 리뷰 작성용
showLoginForReview = function () {
    var url = location.href;
    if (url.indexOf("#Reviews") < 1) {
        url += "#Reviews";
    }
    openLoginPopupWithParam(this, url, "");
}
// SNS 공유를 위한 정보 설정
setSnsShareInfo = function () {
    //메타테그 설정, SNS 공유용
    //$("#mTitle").attr("content", TITLE);
    //$("#mImage").attr("content", IMAGE_URL);
    //$("#mDescription").attr("content", DESCRIPTION);
    //$("head").append('<meta property="og:title" content="' + TITLE + '"/>');
    //$("head").append('<meta property="og:image" content="' + IMAGE_URL + '"/>');
    //$("head").append('<meta name="description" content="' + DESCRIPTION + '"/>');
    //<meta id="mTitle" property="og:title"/>
    //<meta id="mImage" property="og:image"/>
    //<meta id="mDescription" name="description"/>
    //$("head").append('<meta property="og:title" content="' + TITLE + '"/>');
    //$("head").append('<meta property="og:image" content="' + IMAGE_URL + '"/>');
    //$("head").append('<meta name="description" content="' + RemoveHTMLTags(DESCRIPTION) + '"/>');
    //$("head").append('<meta property="og:description" content="' + RemoveHTMLTags(DESCRIPTION) + '"/>');
    //$("head").append('<meta property="fb:app_id" content="116894335360703" />'); // 1604021
    //$("head").append('<meta property="og:url" content="' + URL + '"/>');
}
// URL 복사 기능 = 클립보드 복사
function copyThis() {
    var url = $(location).attr("href");						//현재URL
    var IE = (document.all) ? true : false;
    if (IE) {
        window.clipboardData.setData("Text", url);
        //alert('클립보드에 URL이 복사되었습니다.\n\nCtrl+V (붙여넣기) 단축키를 이용하시면,\nURL을 붙여 넣으실 수 있습니다.');
        showMessage("COM0005", this);
    } else {
        temp = prompt("Ctrl+C를 눌러 클립보드로 복사하세요", url);
    }
}
/****************************************
* KeyVisual 관련 함수
****************************************/
//플레이어 초기화
initPlayer = function () {
    //플레이어 초기화
    //var moviePlayer = new $.fn.setMoviePlayer({
    //	target: '.movie_trailer'										//플레에어 표시 영역
    //	, url: '/'														//기본 Url
    //	, width: '100%'													//가로
    //	, height: '537px'												//높이
    //});
    //var moviePlayer = new $.fn.setMoviePlayer({
    //	target: '#wrap',
    //	url: '/'
    //});
}
//플레이어 무비 플레이
PlayMovie = function (url) {
    ////롤링 정지
    //$(".rolling_stop").trigger("click");
    ////플레이어 표시 및 플레이
    //$.fn.moviePlayerControll('.movie_player', url);

    try {
        //롤링 정지
        $(".rolling_stop").trigger("click");
        //플레이어 표시 및 플레이
        var moviePlayer = new $.fn.setMoviePlayer({ arget: '#wrap', url: url });
    } catch (e) {
        CheckException(e, "playMovie", NOW_MENU_TYPE);
    }
};




/****************************************
* 영화 정보 표시 기능 정의
****************************************/
/****************************************
* 영화 정보
****************************************/
//영화 정보를 요청하고 makeMovieInfo 함수에서 받아 처리한다.
//params>
//return>
getMovieInfo = function () {
    try {
        var params = {
            MethodName: "GetMovieDetail", channelType: "HO",
            osType: BrowserAgent(), osVersion: navigator.userAgent,
            multiLanguageID: Language,
            representationMovieCode: QUERY.movie
            //representationMovieCode: 10325
        };
        GetData(NOW_MENU_TYPE, params, makeMovieInfo);

    } catch (e) {
        CheckException(e, "getMovieInfo", NOW_MENU_TYPE);					//오류 발생 처리
    }
}

//영화 정보 만들기
//params>
//		obj: 영화 정보 Data 개체 
//return>
makeMovieInfo = function (obj) {
    try {
        var diff;														//현재일자 - 개봉일 차이 저장용
        var diffDDay;
        var htmlString;
        var movieDataSet = obj.responseJSON;							//영화 정보 Data Set	
        var movieInfo;													//영화정보
        var castingInfos;
        var posterURL;
        var releasDate;
        var releasDateDisplay;
        if (movieDataSet.IsOK != "true") {									//Data에 오류가 있으면
            throw new Error(movieDataSet.ResultMessage);					//Error를 발생하고, Data 요청 결과 massage 를 전달한다.
        }
        movieInfo = movieDataSet.Movie;
        castingInfos = movieDataSet.Casting.Items;

        if (movieInfo.ReleaseDate == null || movieInfo.ReleaseDate == undefined) {
            releasDateDisplay = "";
        } else {
            releasDate = new Date(movieInfo.ReleaseDate.substr(0, 10).replace(/-/g, '/'));
            releasDateDisplay = movieInfo.ReleaseDate.substr(0, 10).replace(/-/g, ".");
        }

        posterURL = movieInfo.PosterURL;

        //SNS 공유용 값 설정
        TITLE = movieInfo.MovieNameKR;											//영화 제목
        //if (posterURL != "" && posterURL != undefined) {						//포스터 이미지 Url
        //    if (posterURL.substr(0, 4) == "http") {	//Full path의 경우 
        //        IMAGE_URL = posterURL;
        //    } else {								//root path의 경우
        //        IMAGE_URL = URL.substr(0, URL.indexOf("/", 7)) + posterURL;
        //    }
        //}
        if (Language == "KR") {
            DESCRIPTION = movieInfo.SynopsisKR;									//설명 - 시놉시스
        } else {
            DESCRIPTION = movieInfo.SynopsisUS;
        }
        //setSnsShareInfo(); // SNS 공유 정보 설정

        //개봉일 비교
        try {
            diff = releasDate - NOW_DATE;
            //IS_RELEASE_STATUS = diff > -1;									//true: 개봉, false: 미개봉(기본값)
        } catch (e) {
            diff = -1;
        }

        IS_RELEASE_STATUS = movieInfo.MoviePlayYN == 'Y'; //true: 개봉, false: 미개봉(기본값)

        setReviewList(false);	// 리뷰 목록 표시

        //정보 표시 처리 시작---------------------
        var sb = new StringBuilder();
        //포스터 html 작성
        sb.AppendFormat('<img src="{0}" alt="{1}" />'
			//, CinemaServerDomain										//루트경로
			, posterURL										//포스터 Url
			, movieInfo.MovieNameKR);									//한글 제목
        //확대보기 html 작성
        //sb.Append('<a href="#" class="img_view" target="_blank" title="새창 열림"><img src="/LCHS/Image/Btn/btn_big_view.png" alt="이미지 크게보기" /></a>');
        htmlString = sb.ToString();										//StringBuilder 내용 문자열로 전환
        sb.RemoveAll();													//StringBuilder 초기화
        $(".img").html(htmlString);										//html 적용

        //예매 버튼 설정
        $(".btn_reserve").hide();										//버튼 숨김(기본)
        if (movieInfo.BookingYN == "Y") {								//예매가능시
            $(".btn_reserve").click(function () {						//	클릭이벤트 설정
                // 20170425 - 페이스북에서 유입되었을 경우는 페이스북 유입된 정보를 저장할 수 있도록 호출
                if (QUERY.fbid != undefined && QUERY.fbid != 'undefined' && QUERY.fbid != null && QUERY.fbid != "") {
                    goToTiketingFromFacebook(QUERY.movie, facebookActLogConnectionID, location.href, QUERY.fbid);								//	예매로 페이지 이동
                }
                else {
                    goToTiketing(QUERY.movie);								//	예매로 페이지 이동
                }
            });
            $(".btn_reserve").show();									//	버튼 표시

            // 주우락: 예매가능은 삭제하기로 결정되어 삭제
            //sb.Append('<em class="m_possible">예매가능</em>');
        }
        else {
            diffDDay = diff / 1000 / 60 / 60 / 24;
            sb.AppendFormat('<span class="m_data">D-{0}	</span>', diffDDay);
        }

        //제목 html 작성

        sb.AppendFormat('<h2 class="info_tit">{0}</h2>', movieInfo.MovieNameKR);		//한글 제목
        //if (movieInfo.MovieNameUS != "" && movieInfo.MovieNameUS != undefined) {   // 1603236
        //    sb.AppendFormat(' <span class="info_tits">({0})</span>', movieInfo.MovieNameUS);			//영문 제목
        //}

        htmlString = sb.ToString();
        sb.RemoveAll();
        $("div.info_data").html(htmlString);

        //예매율 html 작성
        sb.AppendFormat('<em class="num">{0}</em>위, {1}%'
			, movieInfo.BookingRank			//예매 순위
			, movieInfo.BookingRate.toFixed(1));		//예매율
        htmlString = sb.ToString();
        sb.RemoveAll();
        $(".rate_txt").html(htmlString);

        //평점
        appendMovieScore(movieInfo.ViewEvaluation, movieInfo.ExpectEvaluation);		//평점 작성 및 표시

        sb.RemoveAll();
        sb.AppendFormat('<span class="rate_txt">(누적관객 수 {0}명)</span>', ToMoney(movieInfo.KOFCustCnt));
        $("#score span.num").after(sb.ToString());
        sb.RemoveAll();

        //등급 html 작성
        sb.Append('<dt>등급</dt>');
        sb.AppendFormat('<dd id="dVClass">[국내] {0}</dd>', movieInfo.ViewGradeNameKR);
        //개봉일 html 작성
        sb.Append('<dt>개봉일</dt>');
        if (movieInfo.ReleaseDate != undefined) {
            sb.AppendFormat('<dd id="dReleaseDate">{0}</dd>', releasDateDisplay);
        }

        //기본정보 html 작성
        sb.Append('<dt>기본정보</dt>');
        sb.AppendFormat('<dd id="dBaseInfo">{0}   {1} ({2}분)  </dd>'
			, movieInfo.MovieGenreNameKR
			, movieInfo.MakingNationNameKR
			, movieInfo.PlayTime);
        htmlString = sb.ToString();
        sb.RemoveAll();
        $("#dSpec0").html(htmlString);		//등급, 개봉일, 기본정보 표시

        //타입 html 작성
        sb.Append('<dt>타입</dt>');
        sb.AppendFormat('<dd>{0} | {1} {2} {3}</dd>'
			, movieInfo.FilmName														//Film Type
			, movieInfo.FourDTypeNameKR != "" ? movieInfo.FourDTypeNameKR + " | " : ""	//4D Type
			, movieInfo.SoundTypeNameKR != "" ? movieInfo.SoundTypeNameKR + " | " : ""	//Sound Type
			, movieInfo.TranslationDivisionNameKR);										//Caption Type

        //공식홈페이지 link html 작성
        if (movieInfo.HomepageURL != "") {			//url 정보가 있으면 html 작성
            sb.Append('<dt>공식홈페이지</dt>');
            sb.AppendFormat('<dd><a href="javascript:void(0);" onclick="openLink(\'{0}\')">{0}</a></dd>'
				, movieInfo.HomepageURL);			//공식 홈페이지 Url
        }
        htmlString = sb.ToString();
        sb.RemoveAll();
        $("#dSpec1").html(htmlString);				//타입, 공식홈페이지 Link 표시

        //시놉시스
        $("#pSynopsis").html(DESCRIPTION);

        //선호도

        if (IS_RELEASE_STATUS) {//개봉 후
            appendMoviePreferScore(movieInfo.TotalViewCount, movieInfo.AgePrefer10, movieInfo.AgePrefer20, movieInfo.AgePrefer30, movieInfo.AgePrefer40, movieInfo.WomanPrefer, movieInfo.ManPrefer);
            //$("#divScoreBoard").show();			//스코어 영역 표시
        }
        else {
            $("#divScoreBoard").hide();				//스코어 영역 숨김(기본)

        }

        //스페셜관 상영정보
        appendSpecial(movieInfo.SpecialScreenDivisionCode);

        //동영상/스틸컷
        appendVisualList(movieDataSet.Trailer.Items);

        //감독 및 출연진
        appendCasting(castingInfos,movieInfo.ProductionCompanyName);
    } catch (e) {
        CheckException(e, "makeMovieInfo: ", NOW_MENU_TYPE);
    }
}

//스페셜관=======================================================================
//스페셜관 버튼 표시
//params>
//		specialInfos: 스페셜관 버튼 정보 목록 Data
//return>
appendSpecial = function (specialInfos) {
    try {
        var specialImages;
        var htmlString;
        var specialLength = 0;
        var special = new Special()						//스페셜관 이미지 관리 클레스 생성


        //관련 스페셜관 활성화
        for (var key in specialInfos) {
            special.activeButton(specialInfos[key]);	//스페셜관 버튼 활성화 
            //special.activeButton(specialInfos[key].SpecialCode);							//스페셜관 버튼 활성화 
            //special.setBanner(specialInfos[key].SpecialCode, specialInfos[key].LinkUrl);	//관련 스페셜관 베너 이미지 경로 저장
            specialLength++;
        }

        specialImages = special.ImageInfors;					//스페셜관 이미지 정보 배열

        for (var key in specialImages) {
            if (specialImages[key].ButtonOff == "") continue;	//비활성 이미지가 없으면 다음 버튼 처리

            //스페셜관 버튼 html 작성
            htmlString = makeSpecialButton(
				specialImages[key].Active,					//활성여부
				specialImages[key].Active ? specialImages[key].ButtonOn : specialImages[key].ButtonOff,				//활성 버튼 이미지 Url
				specialImages[key].Alert,					//이미지 alert용 문자열
				specialImages[key].Code);					//스페셜관 코드
            $("#ulSpecial").append(htmlString);				//스페셜관 버튼 item(li) 추가

            //if (specialImages[key].Active) {	//활성일 때
            //	//스페셜관 배너 html 작성
            //	htmlString = makeSpecialBanner(
            //		specialImages[key].Code,					//스페셜관 코드
            //		specialImages[key].Banner == "" || specialImages[key].Banner == undefined ? "/LCHS/Image/Thum/img_b_01.jpg" : specialImages[key].Banner,		//스페셜관 배너 Url 임시
            //		//specialImages[key].Banner,		//스페셜관 배너 Url
            //		specialImages[key].Alert);					//배너 이미지 alert용 문자열
            //	$("#ulSpecialBanner").append(htmlString);		//스페셜관 배너 item 추가
            //}
        }

        ////스페셜관 배너 슬라이드 초기화, 
        //if (specialLength > 0) {	//관련 스페셜관이 있을 경우
        //	var bannerSlide = new $.fn.slideGeneration(
        //		{
        //			target: '.banner_wrap',
        //			box: '.banner_inner',
        //			item: 'li',
        //			animation: 'fade',
        //			btn: false,
        //			timer: true,
        //			delay: 5000,
        //			page: true,
        //			speed: 300
        //		});
        //}
    } catch (e) {
        CheckException(e, "appendSpecial: ", NOW_MENU_TYPE);
    }
}

//스페셜관 버튼 item html을 생성하고 결과를 반환한다.
//params>
//		active: 활성 여부
//		buttonUrl: 버튼 이미지 Url
//		alert: 버튼 이미지 alert 속성 문자열
//		code: 스페셜관 코드
//return> 스페셜관 버튼 Html
makeSpecialButton = function (active, buttonUrl, alert, code) {
    var result;
    try {
        var sbButton = new StringBuilder();

        if (active) {											//활성 상태 이면
            //클릭 이벤트 html 작성
            sbButton.AppendFormat('<li><a href="#" onclick="goToSpecial(\'{0}\')">'
				, code);
            //버튼 이미지 html 작성
            sbButton.AppendFormat('<img src="{0}" alt="{1}" /></a></li>'
				, buttonUrl
				, alert);
        } else {												//비활성 상태 이면
            //미관련 스페셜관은 비활성화 버튼 itme 생성
            sbButton.Append('<li>');
            sbButton.AppendFormat('<img src="{0}" alt="{1}" /></li>', buttonUrl, alert);
        }

        result = sbButton.ToString();
    } catch (e) {
        result = "";
        CheckException(e, "makeSpecialButton: ", NOW_MENU_TYPE);
    } finally {
        return result;
    }
}
//관련 스페셜관의 배너 item html을 생성하고 결과를 반환한다.
//params>
//		code: 스페셜관 코드
//		url: 배너 이미지 Url
//		alert: 이미지 alert 속성 문자열
//return> 스페셜관 배너 Item html
makeSpecialBanner = function (code, url, alert) {
    var result;
    try {
        var sb = new StringBuilder();

        sb.AppendFormat('<li><a href="javascript:void(0)" onclick="goToSpecial(\'{0}\')">'
			, code);
        sb.AppendFormat('<img src="{0}" alt="{1}" /></a></li>'
			, url
			, alert);

        result = sb.ToString();
    } catch (e) {
        result = "";
        CheckException(e, "makeSpecialBanner", NOW_MENU_TYPE);
    } finally {
        return result;
    }
}

//동영상/스틸컷==================================================================
//KeyVisual 및 썸네일 아이템을 추가한다.
//params>
//	visuals: 비주얼 목록 Data
appendVisualList = function (visuals) {
    try {
        var htmlString;
        var traySize = 6;

        var count = 0;  // 주우락 수정
        for (var key in visuals) {
            //if (count > 5) {
            //	//break;
            //}
            htmlString = makeVisualItem(visuals[key]);		//KeyVisual Item html 생성
            $("#ulMovieKeyValue").append(htmlString);		//KeyVisual Itme 추가

            htmlString = makeThumnailItem(visuals[key]);	//썸네일 item html 생성
            $("#ulThumnails").append(htmlString);			//썸네일 item 추가

            count++;										//현재 추가 Item 카운트
        }
        if (count > 0) {
            //이미지 뷰어 활성화
            $("#content .movie_trailer").show();
            $("#content .main_info_slide").show();
            // 주우락: 필요없는 코드. 주석처리
            //if (count < traySize) {
            //	for (var i = count; i <= traySize; i++) {
            //		$("#ulThumnails").append('<li><a href="javascript:void(0)"><img src="/LCHS/Image/Thum/movie_no_image05.gif" alt="no-image" /></a></li>');
            //	}
            //}

            //첫 번째 아이템 활성화
            if ($("#ulMovieKeyValue").find("li").length > 0) {
                $("#ulMovieKeyValue").find("li:first").attr("class", "active");
                $("#ulThumnails").find("li:first a").attr("class", "on");
            }

            //이미지 뷰어 설정
            var imageViewer = new $.fn.ImageViewer({
                target: '.movile_box',				//뷰어 대상
                viewerPrev: '.btnc_prev',			//이전 버튼
                viewerNext: '.btnc_next',			//다음 버튼
                imageThumnail: '.main_info_slide',	//썸네일 대상
                trayPrev: '.btn_prev',				//썸네일 이전 버튼
                trayNext: '.btn_next',				//썸네일 다음 버튼
                traySize: traySize					//썸네일이미지 표시수
            });
        }
    } catch (e) {
        CheckException(e, "appendVisualList", NOW_MENU_TYPE);
    }
}
//비주얼 아이템 생성
//params>
//		visual: 개별 비주얼 정보 개체
//return> 영화 KeyVisual Item HTML
makeVisualItem = function (visual) {
    var result;
    try {
        var sb = new StringBuilder();
        sb.Append("<li>");

        //KeyVisual item html 작성
        if (visual.ImageDivisionCode != "1") {								//동영상일 때, 플레이 버튼 추가
            sb.AppendFormat("<a href='javascript:void(0);' onclick='PlayMovie(\"{0}\");' class='btnc_play'><img src='/LCHS/Image/Btn/btnc_play.png' alt='재생' /></a>"
				, visual.MediaURL);
        }

        // 2016.05.09 웹접근
        sb.AppendFormat('<img src="{0}" alt="{1} 스틸컷{2}" /></a></li>'
			, visual.ImageURL
            , visual.ImageAlter
            , $("#ulMovieKeyValue li").length + 1);

        sb.Append("</li>");

        result = sb.ToString();
    } catch (e) {
        result = "";
        CheckException(e, "makeVisualItem: ", NOW_MENU_TYPE);
    } finally {
        return result;
    }
}
//썸네일 아이템 생성
//params>
//		visual: 개별 비주얼 정보 개체
//return> 동영상/스틸컷 썸네일 Item html
makeThumnailItem = function (visual) {
    var result;
    try {
        var sb = new StringBuilder();

        //Thumnail item html 작성
        sb.Append('<li><a href="javascript:void(0);">');
        if (visual.ImageDivisionCode != "1") {
            sb.Append('<span class="btn_play"><img src="/LCHS/Image/Btn/btn_m_splay.png" alt="재생" /></span>');
        }

        // 2016.05.03 장착법
        sb.AppendFormat('<img src="{0}" alt="{1} 스틸컷{2}" /></a></li>'
			, visual.ImageURL
            , visual.ImageAlter
            , $("#ulThumnails li").length + 1);

        result = sb.ToString();
    } catch (e) {
        result = "";
        CheckException(e, "makeThumnailItem: ", NOW_MENU_TYPE);
    } finally {
        return result;
    }

}


//평점===================================================================================
//개봉일 전/후를 기준으로 기대평점/평점을 표시한다.
//params>
//		rank: 평점
//		ratedExpection: 기대평점
//return>
appendMovieScore = function (rank, ratedExpection) {
    try {
        var htmlString;
        var sb = new StringBuilder();
        sb.Append('<strong class="score_member">관람평점</strong>');
        sb.Append('<span class="starscore">');
        sb.AppendFormat('<span class="starinner" style="width: {0}%;">평점</span></span>', rank * 10);	//별점 html 작성
        sb.AppendFormat('<span class="num">{0}</span>', rank.toFixed(1));											//평점 html 작성
        htmlString = sb.ToString();
        $("#score").html(htmlString);
    } catch (e) {
        CheckException(e, "appendMovieScore: ", NOW_MENU_TYPE);
    }
}


//선호도=================================================================================
//관람객수 및 선호도 Html 작성후 적용한다.
//params>
//		count: 실관람객 수
//		teen: 10대 선호도
//		twentie: 20대 선호도
//		thirtie: 30대 선호도
//		fortie: 40대 선호도
//return>
appendMoviePreferScore = function (count, teen, twentie, thirtie, fortie, woman, man) {
    try {
        var htmlString;
        var sb = new StringBuilder();

        ////실관람객 html 작성
        //sb.Append('<dt>실관람객</dt>');
        //sb.AppendFormat('<dd><span>{0}</span>명</dd>', ToMoney(count.toString()));
        //htmlString = sb.ToString();
        //$(".netizen_score").html(htmlString);
        $("#ulPreferScore").html("");
        //연령별 선호도 html 작성
        htmlString = makeAgePreferScoreItem("10", teen);
        $("#ulPreferScore").append(htmlString);

        htmlString = makeAgePreferScoreItem("20", twentie);
        $("#ulPreferScore").append(htmlString);

        htmlString = makeAgePreferScoreItem("30", thirtie);
        $("#ulPreferScore").append(htmlString);

        htmlString = makeAgePreferScoreItem("40", fortie);
        $("#ulPreferScore").append(htmlString);
        //성별 선호도
        $("#spnWoman span.g_bar").css("width", woman + "%");
        $("#spnWoman span.g_bar span.g_score").text(woman + "%");
        $("#spnMan span.g_bar").css("width", man + "%");
        $("#spnMan span.g_bar span.g_score").text(man + "%");
        //UI 작성 후 개발 진행 필요***************************************************

    } catch (e) {
        CheckException(e, "appendMoviePreferScore: ", NOW_MENU_TYPE);
    }
}
//연령대별 선호도 아이템 html을 작성하고 결과를 반환한다.
//params>
//		age: 연령대 Text
//		score: 선호도 값
//return> 아이템 Html
makeAgePreferScoreItem = function (age, score) {
    var result;
    try {
        var sb = new StringBuilder();
        sb.AppendFormat('<li><em class="prefer_tit">{0}대</em><span class="g_area age{0}">', age);
        sb.AppendFormat('<span class="g_bar" style="height: {0}%">', score);
        sb.AppendFormat('<span class="g_score">{0}%</span>', score);
        sb.Append('</span></span></li>');
        result = sb.ToString();
    } catch (e) {
        result = "";
        CheckException(e, "makeAgePreferScoreItem: ", NOW_MENU_TYPE);
    } finally {
        return result;
    }
}


//감독 및 출연진 =========================================================================
//감독 및 출연진 추가
//params>
//		castingInfos: 감독 및 출연자 정보 개체
//return>
appendCasting = function (castingInfos,companyName) {
    try {
        var htmlString;
        var htmlStringProduce = "";
        var companyNameCompare = "";
        var companyNameSub = "";
        if (castingInfos.length == 0) {
            $('.mpeople_wrap').hide();
        }
        else {
            $('.mpeople_wrap').show();

            for (var key in castingInfos) {
                //출연신 Item html 작성
                htmlString = makeCasting(
                    castingInfos[key].StaffImage,
                    castingInfos[key].StaffName,
                    castingInfos[key].Role);
                $("#ulCasting").append(htmlString);
            }

            //20170323 sunho 제작사 추가 

            if (companyNameCompare != companyName) {
            
                if (companyName.length > 22) {
                    companyNameSub = companyName.substring(0, 22) + "...";
                    htmlStringProduce = makeCasting(
                                        "/lchs/image/thum/img_non_actor.jpg",
                                        companyNameSub,
                                        "제작사");
                } else {
                    htmlStringProduce = makeCasting(
                        "/lchs/image/thum/img_non_actor.jpg",
                        companyName,
                        "제작사");
                }
            }
            
            $("#ulCasting").append(htmlStringProduce);


            //출연진 슬라이드 설정 20170323 sunho bundle값 6에서 5로 수정 
            var slideGeneration2 = new $.fn.slideGeneration({
                target: '.slide_mbox',
                box: '.slide_spot',
                bundle: 5,
                item: 'li', space: 39, animation: 'slide',
                btn: true, prev: '.btn_prev', next: '.btn_next',
                timer: false,
                page: false
                //prevButtonAlwaysVisible: true, 20170324 sunho 로직 삭제 
                //nextButtonAlwaysVisible: true
            }); // 함수 호출 방식
        }
    } catch (e) {
        CheckException(e, "appendCasting: ", NOW_MENU_TYPE);
    }
}
//감독 및 출연진 아이템 html을 작성하고, 그 결과를 반환한다.
//params>
//		imgUrl: 썸네일 이미지 url
//		name:	감독 또는 출연진 성명
//		role:	역할
//return> 감독 및 출연 item html
makeCasting = function (imgUrl, name, role) {
    var result;
    try {
        var sb = new StringBuilder();

   
        if (role == "프로듀서") {
            sb.Append('<li>');
            sb.Append('<div class="pic">');
            sb.Append('<span class="mask"></span>');
            sb.AppendFormat('<img src="{0}" alt="{1}{2}" />', "/LCHS/Image/Thum/img_non_actor.jpg", name, role);
            sb.Append('</div>');
            sb.AppendFormat('<p class="name">{0}</p>', name);
            sb.AppendFormat('<p class="role">{0}</p>', role);
            sb.Append('</li>');
        } else {
            sb.Append('<li>');
            sb.Append('<div class="pic">');
            sb.Append('<span class="mask"></span>');
            sb.AppendFormat('<img src="{0}" alt="{1}{2}" />', imgUrl, name, role);
            sb.Append('</div>');
            sb.AppendFormat('<p class="name">{0}</p>', name);
            sb.AppendFormat('<p class="role">{0}</p>', role);
            sb.Append('</li>');
        }

        result = sb.ToString();
    } catch (e) {
        result = "";
        CheckException(e, "makeCasting: ", NOW_MENU_TYPE);
    } finally {
        return result;
    }
}



/****************************************
* 리뷰 관련 기능 정의
****************************************/
//리뷰 목록 상태를 설정한다.
//params>
//		goPage: 페이지 이동 여부, true - 페이지 이동
//		type: 탭 구분, V - 실관람객 리뷰, A - 전체
//		order: 정렬기준, N - 최신순, P - 평점순, R - 추천순
//return>
setReviewList = function (goPage) {
    try {
        //리뷰 표시 설정
        $(".review_top .review_tit").text(REVIEW_AREA_TITLE);
        $(".score_area legend").text(REVIEW_AREA_TITLE);
        $(".score_area .score_star .star_tit").text(REVIEW_POINT_TITLE);

        if (!goPage) {	
            //탭 또는 정렬기준 변경이면, 페이지 초기화
            PAGE = 1;
            setPositionToReview();	// 리뷰 영역으로 스크롤 한다.
        }

        //리뷰 영역 재구성
        $("#ulReviews").html("");											//리뷰 항목 초기화
        getReviewInfo();													//리뷰 Data 요청
    } catch (e) {
        CheckException(e, "setReviewList:", NOW_MENU_TYPE);
    }
}

//리뷰 텝 스타일을 설정 및 페이징을 설정 한다.
//params>
//		obj: 리뷰 카운드 Data 객체
//return>
setReviewTab = function (counts) {
    try {
        var nowTotalCount;	//현재 리뷰 Totla count

        //$("#ulTabReview").html('<li><a href="javascript:void(0)" id="aTabView" onclick="setReviewList(false)">관람객 리뷰 (' + counts.RealReviewCount + ')</a></li>');

        //현재 탭 선택 표시 및 현재 탭의 전체 리뷰수 적용
        nowTotalCount = counts.RealReviewCount;

        if (nowTotalCount == 0) {
            $(".paging").hide();
        } else {
            $(".paging").show();
        }

        //페이징 초기화
        var paging = new $.fn.pagingGeneration({
            target: '.paging',
            type: 'Y',
            total: nowTotalCount,
            view: REVIEW_PAGE_SIZE,
            page: PAGE
        });
    } catch (e) {
        CheckException(e, "setReviewTab:", NOW_MENU_TYPE);
    }
}

//리뷰가 없을 때 표시할 내용(html) 표시
//params>
//return>
appendNoReview = function () {
    $("#ulReviews").append("<li>검색된 데이타가 없습니다.</li>");
}

$(function () {
    //리뷰 페이지 이동시 처리
    //params>
    //		type: 이벤트 타임(리뷰 탭 구분용)
    //		searchtext: 검색어(공통)
    //		pageno: 현재 페이지
    //		pagesize: 페이지별 리스트 수
    //return>
    $.fn.gotoPage = function (type, searchtext, pageno, pagesize) {
        PAGE = pageno;													//현재 페이지 설정
        setReviewList(true);											//리뷰 목록 구성, true: 페이지 이동
    };
})

// 리뷰 목록 표시 =========================================================================
//일반 리뷰 Data를 appendReviews 함수가 받아도록 요청한다.
//params>
//return>
getReviewInfo = function () {
    try {
        var memberid;
        if (checkLogin()) {
            memberid = memberInfo.MemberNoOn;
        } else {
            memberid = "";
        }

        var params = {
            MethodName: "GetReviews", channelType: "HO", osType: BrowserAgent(), osVersion: navigator.userAgent,
            representationMovieCode: QUERY.movie,
            memberID: memberid,
            realReviewYN: "Y",
            sortSeq: 1,
            pageNo: PAGE,
            pageSize: REVIEW_PAGE_SIZE
        };

        GetData(NOW_MENU_TYPE, params, responseReviews);
    } catch (e) {
        CheckException(e, "getReviewInfo:", NOW_MENU_TYPE);
    }
}

// 리뷰 목록 요청 결과를 받아 처리한다.
// params>
//		obj: 리뷰 목록 Json data
// return>
responseReviews = function (obj) {
    try {
        var reviewsInfo = obj.responseJSON;

        if (reviewsInfo.IsOK != "true") {
            throw new Error(reviewsInfo.ResultMessage);
        }
        // 리뷰 탭 설정
        setReviewTab(reviewsInfo.ReviewCounts);

        // 마이리뷰 추가 15.10.28 추가
        if (checkLogin()) {
            var myReviews = reviewsInfo.MyReviewItems.Items;
            appendMyReviews(myReviews);
        }

        //일반 리뷰 추가
        var allReviews = reviewsInfo.TotalReviewItems.Items;
        appendReviews(allReviews);

        //리뷰 입력란 설정
        setComment();

    } catch (e) { CheckException(e, "responseReviews: ", NOW_MENU_TYPE); }
}
// 마이 리뷰=============================================================================
//마이 리뷰 정보를 받아서 추가 한다.
//params>
//		obj: 마이리뷰 Json data
//return>
appendMyReviews = function (reviews) {
    try {
        var htmlString;
        MY_REVIEWS = new Array();

        for (var key in reviews) {
            htmlString = makeReview(reviews[key], true);	//리뷰 html 생성, true: 마이리뷰

            $("#ulReviews").append(htmlString);
            MY_REVIEWS[MY_REVIEWS.length] = { "ReviewID": reviews[key].ReviewID, "ReviewText": reviews[key].ReviewText.replace(/jQuery[0-9]{3,30}_[0-9]{3,30}/g, ''), "Evaluation": reviews[key].Evaluation, "MovieViewYN": reviews[key].MovieViewYN };
        }
    } catch (e) {
        CheckException(e, "appendMyReviews: ", NOW_MENU_TYPE);
    }
}

//마이 리뷰 수정 버튼 클릭시 리뷰 작성 설정 
//params>
//return>
modifedReview = function (reviewID) {
    try {
        //선택 ID 설정
        CURRENT_REVIE_ID = reviewID;

        // 선택 리뷰 정보 적용
        for (var key in MY_REVIEWS) {
            if (MY_REVIEWS[key].ReviewID == CURRENT_REVIE_ID) {
                OLD_COMMENT = MY_REVIEWS[key].ReviewText.replace(/jQuery[0-9]{3,30}_[0-9]{3,30}/g, '');
                OLD_SCORE = MY_REVIEWS[key].Evaluation;
                break;
            }
        }

        //리뷰 입력란 설정
        $('#txtComment')
			.unbind()														//이벤트 초기화
			.val(OLD_COMMENT)												//기존 내용 표시
			.each(function () {
			    $.data(this, 'default', COMMENT_BASE_TEXT);
			    $.data(this, 'edited', true);
			})
			.focus(function () {		// on-focus 이벤트 정의
			    if (!$.data(this, 'edited')) { this.value = ""; }	// 작성중인 글이 없으면, 입력란 clear
			})
			.blur(function () {			// on-blur 이벤트 정의
			    $.data(this, 'edited', this.value != "");
			    if (this.value == "") {
			        this.value = $.data(this, 'default');			// 최초 메시지 표시
			    }
			})
			.keyup(function () {											//입력 글자 수 표시 및 제한
			    if (ByteLength(this.value) > 220) {
			        var txt;
			        while (ByteLength(this.value) > 220) {
			            txt = this.value;
			            this.value = txt.substr(0, txt.length - 1);
			        }
			    }
			    $('.score_etc').text(ByteLength(this.value) + "/220 (한글 110자/영문220자)");
			});
        $('#txtComment').focus();

        // 텍스트 카운트 설정
        $('.score_etc').text(ByteLength(OLD_COMMENT) + "/220 (한글 110자/영문220자)");

        //별점 설정
        $('.score_star .starscore').find('.starinner').css('width', OLD_SCORE * 10 + '%');	//기존 평점 별 이미지 표시
        $('.score_star .star_sum span').text(OLD_SCORE);									//기존 평점 수 표시
    } catch (e) {
        CheckException(e, "modifedReview: ", NOW_MENU_TYPE);
    }
}

//마이 리뷰 삭제 버튼 클릭시 confirm modal 표시
//params>
//return>
removeReview = function (reviewID) {
    CURRENT_REVIE_ID = reviewID;
    //삭제 확인
    var IsConfirm = confirm("삭제하신 리뷰는 복구할 수 없습니다.\n리뷰를 재등록해도 포인트는 다시 지급되지 않습니다.\n정말 리뷰를 삭제하시겠습니까?");
    if (IsConfirm) requestDeleteReview();
}

// 현재 선택된 리뷰의 삭제를 요청한다.
//param>
//return>
requestDeleteReview = function () {
    var memberCode

    //유효성 검사
    if (memberInfo.MemberNoOn == undefined) {
        return false;
    } else {
        memberCode = memberInfo.MemberNoOn;
    }

    var params = {
        MethodName: "SetReview", channelType: "HO",
        osType: BrowserAgent(), osVersion: navigator.userAgent,
        multiLanguageID: Language,	//언어설정 전역변수
        actionDiv: 3, //1: 입력, 2: 수정, 3: 삭제
        representationMovieCode: QUERY.movie,
        memberNoON: memberCode,
        customerNo: memberInfo.CustomerNo == '' ? '0' : memberInfo.CustomerNo,
        mark: 0, comment: "",
        reviewID: CURRENT_REVIE_ID
    };
    GetData(NOW_MENU_TYPE, params, responseReviewDelete);
}


// 일반 리뷰 ===========================================================================

//일반 리뷰추가
//params>
//return>
//obj: 리뷰 Json data
appendReviews = function (allReviews) {
    try {
        var htmlString;

        for (var key in allReviews) {	// 타 회원 리뷰 목록
            htmlString = makeReview(allReviews[key]);

            $("#ulReviews").append(htmlString);
        }
    } catch (e) { CheckException(e, "appendReviews: ", NOW_MENU_TYPE); }
}

//리뷰 item html을 작성후 결과를 반환한다.
//params>
//		reviewInfo: 리뷰 정보
//		myReview: 마이리뷰 여부, true - 마이리뷰, false - 마이리뷰 아님
//return> 리뷰 item HTML
makeReview = function (reviewInfo, myReview) {
    var result;
    try {
        var sb = new StringBuilder();
        sb.Append('<li>');
        sb.Append('<div class="score_box">');
        sb.Append('<div class="score_sum">');
        if (reviewInfo.MovieViewYN == "Y")		//실관람객: Y, 미관람객: N
        {
            sb.Append('<strong class="score_listener">실관람객</strong>');
        }
        sb.AppendFormat('<span class="starscore"><span class="starinner" style="width: {0}%;">평점</span></span>', reviewInfo.Evaluation * 10);
        sb.AppendFormat('<span class="score_txt">{0}</span>', reviewInfo.Evaluation);
        sb.Append('</div>');

        sb.AppendFormat('<p class="result_txt">{0}</p>', reviewInfo.ReviewText.replace(/jQuery[0-9]{3,30}_[0-9]{3,30}/g, ''));

        sb.Append('<div class="score_clicks">');
        sb.AppendFormat('<span class="score_date">{0}</span>', reviewInfo.RegistDate);

        if (reviewInfo.MemberRecommandYN == "Y") {	//추천한 리뷰 이면
            sb.AppendFormat('<a href="javascript:void(0)" class="btn_area on" onclick="setRecommendation(\'{0}\', this)">', reviewInfo.ReviewID);	//추천 버튼 비활성
        } else {	// 추천하지 않은 리뷰이면
            if (myReview) {// 마이리뷰 이면
                sb.Append('<a href="javascript:void(0)" class="btn_area">');	//추천 버튼 활성
            } else {	// 마이리뷰가 아니면
                sb.AppendFormat('<a href="javascript:void(0)" class="btn_area" onclick="setRecommendation(\'{0}\', this)">', reviewInfo.ReviewID);	//추천 버튼 활성
            }
        }
        sb.AppendFormat('<span class="blind">추천 조회수</span>{0}</a>', reviewInfo.RecommandCount);
        sb.Append('</div>');
        //마이리뷰 일 때 변경 및 추가 항목 처리
        if (myReview) {
            sb.Change(0, '<li class="curr">');							//스타일 변경
            sb.Insert(2, '<h4 class="curr_tit">내가 쓴 리뷰</h4>');		//타이틀 추가
            //수정, 삭제 버튼 추가
            sb.Append('<div class="btnr_box">');
            sb.AppendFormat('<a href="javascript:void(0);" class="btnr_modify" onclick="modifedReview(\'{0}\')">수정</a>', reviewInfo.ReviewID);
            sb.AppendFormat('<a href="javascript:void(0);" class="btnr_del" onclick="removeReview(\'{0}\')">삭제</a>', reviewInfo.ReviewID);
            sb.Append('</div>');
        }
        sb.Append('</div>');
        if (!myReview) {
            sb.Append('<div class="score_id">');
            var name = reviewInfo.MemberName;		// 이름
            var tail = "*";		// 이름 사이 표시 문자
            for (i = 0; i < name.length - 3; i++) {
                tail += "*";
            }
            var diaplayName = CutString(reviewInfo.MemberName, 2, tail); // 표시 이름
            var lastWordCount = (name.charCodeAt(name.length - 1) > 128) ? 1 : 2;	// 마지막 글자 길이

            sb.AppendFormat('<em class="id_name">{0}{1}</em>', diaplayName, name.slice(name.length - lastWordCount, name.length));
            //sb.AppendFormat('<em class="id_name">{0}</em>', CutString(reviewInfo.MemberID, 4, "*"));
            sb.Append('</div>');
        }
        sb.Append('</li>');

        result = sb.ToString();
    } catch (e) {
        result = "";
        CheckException(e, "makeReview: ", NOW_MENU_TYPE);
    } finally {
        return result;
    }
}

//로그인 상태에 따라 리뷰 입력란 이벤트를 설정한다.
//params>
//		active: 리뷰입력란 활성여부, true - 활성, false - 비활성
//return>
setComment = function (active) {
    try {
        disabledComment(false);

        var target = $('#txtComment');
        target.blur();
        target.removeAttr("readOnly");

        if (active) {											//활성상태이면 
            target.focus();										//리뷰 입력란으로 포커스 이동
        }

        target.unbind();											//리뷰 입력란의 이벤트 초기화

        $('.score_etc').text("0/220 (한글 110자/영문220자)");

        if (memberInfo.UserID == "" || memberInfo.UserID == undefined) {	//로그인 유저 정보가 없으면
            target.val(COMMENT_BASE_TEXT_LOGOFF)						//입력란에 메시지 표시
				.click(function () {	// 클릭시 로그인 팝업 표시
				    showLoginForReview();
				    this.blur();
				});
        } else {
            // 비회원 로그인 이면, 작성 금지 알림
            if (memberInfo.LotteCinemaMemberGubun == "3") {
                target.val(COMMENT_BASE_TEXT)
					.click(function () {
					    showMessage("COM1201", this);
					    this.blur();
					});
            } else {
                if (MY_REVIEWS.length < 2 && OLD_COMMENT == undefined) {	// 기존에 작성한 리뷰가 없을 때.

                    target.val(COMMENT_BASE_TEXT)
						.each(function () {
						    $.data(this, 'default', this.value);
						    $.data(this, 'edited', false);
						})
						.focus(function () {		// on-focus 이벤트 정의
						    if (!$.data(this, 'edited')) { this.value = ""; }	// 작성중인 글이 없으면, 입력란 clear
						})
						.blur(function () {			// on-blur 이벤트 정의
						    $.data(this, 'edited', this.value != "");
						    if (this.value == "") {
						        this.value = $.data(this, 'default');			// 최초 메시지 표시
						    }
						})
						.keyup(function () {		// on-keyup 이벤트 정의
						    var countText;
						    if (ByteLength(this.value) > 220) {			// 입력 값이 220byte를 넘으면,
						        var txt;								// 입력값 임시저장
						        //입력값이 220byte 보다 크면, 220byte 이하가 되도록 자른다.
						        while (ByteLength(this.value) > 220) {
						            txt = this.value;
						            this.value = txt.substr(0, txt.length - 1);
						        }
						    }
						    // 입력글자 수 count 표시
						    countText = ByteLength(this.value) + "/220 (한글 110자/영문220자)";
						    $('.score_etc').text(countText);
						});

                } else {	// 기존에 작성한 리뷰가 있을 때
                    target.val(COMMENT_BASE_TEXT)
						.focus(function () {
						    //alert("이미 작성된 글이 있습니다.");
						    showMessage("COM1029", "#divReview");
						    this.blur();
						});
                }
            }
        }
    } catch (e) {
        CheckException(e, "setComment: ", NOW_MENU_TYPE);
    }
}

// 리뷰 유효성 검사
//params>
//return>
checkValidationReview = function () {
    var result;
    try {
        var comment;
        comment = $('#txtComment').val();
        //리뷰 입력값 확인
        if (comment.length < 1 || comment == COMMENT_BASE_TEXT) {
            throw new Error("COM1025");	// 리뷰를 작성해 주세요.
        } else if (comment.substr(0, 1) == " ") {
            throw new Error("COM1093");	// 시작문자를 공백으로 시작 하실 수 없습니다.
        }

        //평점(별점) 입력여부 확인
        if (NEW_SCORE == -1) {
            if (CURRENT_REVIE_ID == undefined) {
                NEW_SCORE = 0;
            } else {
                NEW_SCORE = OLD_SCORE;
            }
        }
        //20160328 평점 0 일 경우 안내 메세지 평점을 등록해 주세요. 추가 - 박훈철
        if (NEW_SCORE == 0) {
            throw new Error("COM1026");
        }
        result = true;
    } catch (e) {
        result = false;

        switch (e.message) {
            case "COM1025":
            case "COM1093":
                showMessage(e.message, "#txtComment");
                break;
            case "COM1026":
                showMessage(e.message, ".starscore");
                break;
            default:
                CheckException(e, "checkValidationReview", NOW_MENU_TYPE);
        }
    } finally {
        return result;
    }
}
//리뷰 저장 버튼 클릭시, validation 메시지 처리 및 Created & Update 요청.
//params>
//return> true - 처리 완료, false - 처리 중단
saveReview = function () {
    var result;
    try {
        if (IS_PROCESS == true) { return false; }	// 중복 처리 방지

        var memberCode;	// 회원 코드
        var comment = $("#txtComment").val();
        var isValidationOK;

        //유효성 검사
        if (memberInfo.MemberNoOn == undefined) {
            return false;
        } else {
            memberCode = memberInfo.MemberNoOn;
        }
        isValidationOK = checkValidationReview();
        if (!isValidationOK) {
            return false;
        }

        disabledComment(true);

        //선택된 리뷰 유무 확인
        if (CURRENT_REVIE_ID == "" || CURRENT_REVIE_ID == undefined) {
            // Create 요청
            var params = {
                MethodName: "SetReview", channelType: "HO",
                osType: BrowserAgent(), osVersion: navigator.userAgent,
                multiLanguageID: Language,	//언어설정 전역변수
                actionDiv: 1, //1: 입력, 2: 수정, 3: 삭제
                representationMovieCode: QUERY.movie,
                memberNoON: memberCode,
                customerNo: memberInfo.CustomerNo == '' ? '0' : memberInfo.CustomerNo,
                mark: NEW_SCORE, comment: comment
            };
            GetData(NOW_MENU_TYPE, params, responseReviewInsert);
        } else {
            // Update 요청
            var params = {
                MethodName: "SetReview", channelType: "HO",
                osType: BrowserAgent(), osVersion: navigator.userAgent,
                multiLanguageID: Language,	//언어설정 전역변수
                actionDiv: 2, //1: 입력, 2: 수정, 3: 삭제
                representationMovieCode: QUERY.movie,
                memberNoON: memberCode,
                customerNo: memberInfo.CustomerNo == '' ? '0' : memberInfo.CustomerNo,
                mark: NEW_SCORE, comment: comment,
                reviewID: CURRENT_REVIE_ID
            };

            GetData(NOW_MENU_TYPE, params, responseReviewUpdate);
        }
        result = true;
    } catch (e) {
        result = false;
        disabledComment(false);
        CheckException(e, "saveReview", NOW_MENU_TYPE);
    } finally {
        return result;
    }
}
// 리뷰 입력란 및 버튼 비활성화
// params>
//		isFlag: true- 비활성, false- 활성
// return>
disabledComment = function (isFlag) {
    if (isFlag) {
        IS_PROCESS = true;
        $("#txtComment").attr("readOnly", true);
        $("#btnSave").attr("disabled", true);
    } else {
        IS_PROCESS = false;
        $("#txtComment").removeAttr("readOnly");
        $("#btnSave").removeAttr("disabled");
    }
}

// 등록/수정/삭제 완료 처리
// praams>
//		division: 구분
//		messageCode: 표시 메시지 코드
// return>
completCUD = function (division, messageCode, message) {

    clearCurrentReview();		//선택 리뷰 정보Clear

    ORDER = "N";														//정렬, 최신순 으로 초기화
    PAGE = 1;
    //리뷰 영역 재구성
    $("#ulReviews").html("");											//리뷰 항목 초기화
    getReviewInfo();

    if (message == undefined || message == '')
        showMessage(messageCode, "#divReview");
    else {
        alert(message);
    }
}

// 리뷰 작성 요청 결과 처리
// params>
// return>
responseReviewInsert = function (obj) {
    try {
        var responseInfo = obj.responseJSON;
        if (responseInfo.IsOK != "true") {
            throw new Error(responseInfo.ResultMessage);
        }

        var result = responseInfo.Results.Items[0];
        if (result.ReturnResult == "Y") {
            // 완료처리
            completCUD(result.ReviewDivision, "COM1027");	// 고객님의 평점 및 영화 리뷰 작성이 완료되었습니다.
        } else {
            // 이미 작성된 글이 있습니다.
            completCUD(result.ReviewDivision, "COM1090", result.ReturnMessage);
        }
    } catch (e) {
        // 오류가 발생했습니다. 관리자에게 문의해 주세요.
        showMessage("COM0505", "#divReview");

        CheckException(e, "responseReviewInsert", NOW_MENU_TYPE);
    }
}

// 리뷰 수정 요청 결과 처리
// params>
// return>
responseReviewUpdate = function (obj) {
    try {

        var responseInfo = obj.responseJSON;

        if (responseInfo.IsOK != "true") {
            throw new Error(responseInfo.ResultMessage);
        }

        var result = responseInfo.Results.Items[0];
        if (result.ReturnResult == "Y") {
            // 완료 처리
            completCUD(result.ReviewDivision, "COM1028");	//고객님의 평점 및 영화 리뷰 수정이 완료되었습니다.
        } else {// 오류 표시
            throw new Error(result.ReturnMessage);
        }
    } catch (e) {
        // 오류가 발생했습니다. 관리자에게 문의해 주세요.
        showMessage("COM0505", "#divReview");
        CheckException(e, "responseReviewUpdate", NOW_MENU_TYPE);
    }
}

// 리뷰 삭제 요청 결과 처리
// params>
// return>
responseReviewDelete = function (obj) {
    try {
        var responseInfo = obj.responseJSON;

        if (responseInfo.IsOK != "true") {
            throw new Error(responseInfo.ResultMessage);
        }

        var result = responseInfo.Results.Items[0];
        if (result.ReturnResult == "Y") {
            // 완료처리
            completCUD(result.ReviewDivision, "COM1030");	//리뷰 삭제가 완료되었습니다.
        } else {// 오류 표시
            throw new Error(result.ReturnMessage);
        }
    } catch (e) {
        // 오류가 발생했습니다. 관리자에게 문의해 주세요.
        showMessage("COM0505", "#divReview");
        CheckException(e, "responseReviewDelete", NOW_MENU_TYPE);
    }
}

//선택 리뷰 정보Clear
//params>
//return>
clearCurrentReview = function () {
    //$("#txtComment").val(COMMENT_BASE_TEXT);
    // 선택 정보 초기화
    CURRENT_REVIE_ID = undefined;
    OLD_COMMENT = undefined;
    OLD_SCORE = 0;
    NEW_SCORE = -1;
    $('.score_star .starscore .starinner').css('width', '0%');
    $('.score_star .star_sum span').text('0');
}

// 리뷰 추천 --------------------------------------------------------------------
var CURRENT_RECOMMEND_REVIEW;

//해당 리뷰 추천 처리 요청
//params>
//		reviewID: 추천한 리뷰 ID
//return>
setRecommendation = function (reviewID, e) {
    try {
        if (memberInfo.UserID == "" || memberInfo.UserID == undefined) {
            //로그인 유저 정보가 없으면 로그인 팝업 표시
            if (location.href.indexOf("#Reviews") < 1) { location.href = location.href + "#Reviews"; }
            openLoginPopup(this);
        } else {
            if (IS_PROCESS) return;
            for (var key in MY_REVIEWS) {
                if (MY_REVIEWS[key].ReviewID == reviewID) {
                    return false;
                }
            }
            var isRecommend = $(e).hasClass("on");
            var actionDiv;
            CURRENT_RECOMMEND_REVIEW = e;

            if (isRecommend) {	// 추천한 리뷰이면
                actionDiv = 2;	// 추천 취소
            } else {	//추천하지 않은 리뷰이면
                actionDiv = 1;	// 추천
            }

            requestReviewRecommendation(reviewID, actionDiv);
        }
    } catch (e) {
        CheckException(e, "setRecommendation", NOW_MENU_TYPE);
    }
}
// 리뷰 추천 요청 한다.
requestReviewRecommendation = function (reviewID, actionDiv) {
    try {
        var memberCode

        //유효성 검사
        if (memberInfo.MemberNoOn == undefined) {
            return false;
        } else {
            memberCode = memberInfo.MemberNoOn;
        }

        // channelType, osType, osVersion => 상위 공통 파라미터 참조
        // multiLanguageID": 다국어(ko-kr, en-us)
        // reviewID: 리뷰 ID
        // representationMovieCode: 대표영화 코드
        // memberNoON: 온라인 회원번호 
        // actionDiv: 동작 구분 1:추천, 2:추천삭제
        var params = {
            MethodName: "SetReviewRecommand", channelType: "HO",
            osType: BrowserAgent(), osVersion: navigator.userAgent, multiLanguageID: Language,
            reviewID: reviewID,
            representationMovieCode: QUERY.movie,
            memberNoON: memberCode,
            actionDiv: actionDiv
        };    // 영화 메인 Key Visual

        IS_PROCESS = true;
        GetData(NOW_MENU_TYPE, params, responseReviewRecommendation);
    } catch (e) {
        CheckException(e, "requestReviewRecommendation", NOW_MENU_TYPE);
    }
}
// 리뷰 추천 결과를 표시한다.
responseReviewRecommendation = function (obj) {
    try {
        var responseInfo = obj.responseJSON;

        if (responseInfo.IsOK != "true") {
            throw new Error(responseInfo.ResultMessage);
        }

        var result = responseInfo.Results.Items[0];
        if (result.ReturnResult == "Y") {
            // 완료처리
            setDiaplayReviewRecommendation();
        } else {// 오류 표시
            throw new Error(result.ReturnMessage);
        }
    } catch (e) {
        IS_PROCESS = false;
        // 오류가 발생했습니다. 관리자에게 문의해 주세요.
        showMessage("COM0505", "#divReview");
        CheckException(e, "responseReviewDelete", NOW_MENU_TYPE);
    }
}
// 리뷰 추천 정보 표시를 설정한다.
setDiaplayReviewRecommendation = function () {
    try {
        var target = $(CURRENT_RECOMMEND_REVIEW);
        var isRecommend = target.hasClass("on");
        var innerHtml = target.html();
        var sIndex = innerHtml.lastIndexOf(">") + 1;
        var count = innerHtml.substr(sIndex);
        var frontHtml = innerHtml.substr(0, sIndex);
        var messageCode;

        if (Number(count) == NaN) {
            count = 0;
        }

        if (isRecommend) {	// 추천한 리뷰이면
            if (count > 0) { --count; }
            target.removeClass("on");
        } else {	//추천하지 않은 리뷰이면
            ++count;
            target.addClass("on");
        }
        target.html(frontHtml + count);
        IS_PROCESS = false;
    } catch (e) {
        IS_PROCESS = false;
        CheckException(e, "setDiaplayReviewRecommendation", NOW_MENU_TYPE);
    }
}
//선택한 별점을 신규 별점으로 저장한다.
//params>
//		score: 평점
//return>
setStarScore = function (score) {
    NEW_SCORE = score;
}

/****************************************
* 이벤트 목록 관련 기능 정의
****************************************/
//이벤트 Data를 responseEvents 함수가 받아도록 요청한다.
//params>
//return>
getEventsInfo = function () {
    try {
        //var params = { MethodName: "EventByMovie", RepresentationMovieCode: QUERY.movie };
        var params = {
            MethodName: "GetEventListByMovieDetail", channelType: "HO",
            osType: BrowserAgent(), osVersion: navigator.userAgent, multiLanguageID: Language,
            representationMovieCode: QUERY.movie,
            pageSize: EVENT_MAX_DISPLAY_SIZE,
            pageNo: 1
        };
        GetData("event", params, responseEvents);
    } catch (e) {
        CheckException(e, "getEventsInfo:", NOW_MENU_TYPE);
    }
}
//이벤트 정보를 받아서 validation 검사 수행 후 이벤트 목록 추가 한다.
//params>
//		obj: 관련 이벤트 정보 Json Data
//return>
responseEvents = function (obj) {
    try {
        var events = obj.responseJSON;
        if (events.IsOK != "true") {
            throw new Error(events.ResultMessage);
        }

        EVENT_INFORS = events.Events.Items;
        //관련 이벤트 표시 초기화
        if (EVENT_INFORS.length == 0) {
            $(".event_fwrap .event_cont .srchResult_none").show();
        } else {
            if (EVENT_INFORS.length > EVENT_BASE_PAGE_SIZE) {
                $("#aMore").show();									//더보기 버튼 숨김
            }
            appenEvents(1);												//이벤트 처음 목록 표시
        }
    } catch (e) {
        CheckException(e, "responseEvents: ", NOW_MENU_TYPE);
    }
}

//이벤트 목록 추가
//params>
//		type: 1- 처음 목록 표시, 2- 추가 목록 표시
//return>	
appenEvents = function (type) {
    try {
        var betweenIndex;													//시작 항목 index
        var endIndex;														//마지막 항목 index
        var htmlString;

        //표시 구분별 시작/종료 Index 값 설정
        switch (type) {
            case 1:	//처음 목록 표시
                betweenIndex = 0;
                if (EVENT_INFORS.length > EVENT_BASE_PAGE_SIZE) {
                    endIndex = EVENT_BASE_PAGE_SIZE - 1;
                }
                else {
                    endIndex = EVENT_INFORS.length - 1;
                }
                break;
            case 2: //추가 목록 표시
                betweenIndex = 4;
                endIndex = EVENT_INFORS.length - 1;
                break;
            default: break;
        }
        //이벤트 목록 추가
        for (var i = betweenIndex; i <= endIndex; i++) {
            htmlString = makeEventitem(EVENT_INFORS[i]);
            $("#ulEvents").append(htmlString);
        }
    } catch (e) {
        CheckException(e, "appenEvents: ", NOW_MENU_TYPE);
    }
}
//관련 이벤트 닫기 클릭시 항목 삭제 처리
//params>
//return>
removeEvent = function () {
    removeListItem("#ulEvents", EVENT_BASE_PAGE_SIZE);
}
//추천 이벤트 Item html을 작성후 결과를 반환한다.
//params>
//		eventInfo: 이벤트 정보 개체
//return> 추천 이벤트 Item html
makeEventitem = function (eventInfo) {
    var result;
    try {
        var eventHaed;
        switch (eventInfo.EventTypeCode) {
            case "107":
            case "108":
                eventHaed = eventInfo.EventTypeName;
                break;
            case "112":
                eventHaed = eventInfo.CinemaName;
                break;
                //case "108":
                //sb.Append('<em class="labelCinema_3">+APP</em>');
                //sb.Append('<em class="labelCity06">경남/부산/울산</em>', eventInfo.CinemaAreaName);
                //eventHaed = eventInfo.CinemaAreaName;
                //	break;
            default:
                eventHaed = eventInfo.EventTypeName;
                break;
        }
        var sb = new StringBuilder();
        sb.Append('<li>');
        //마감 입박일 경우 표시
        if (eventInfo.CloseNearYN == 1) {
            sb.Append('<span class="deadline">마감<br />임박</span>');
        }
        sb.AppendFormat('<a href="javascript:void(0)" title="{1}" onclick="goEventDetail(\'{0}\',\'{2}\')">', eventInfo.EventID, eventInfo.EventName, eventInfo.EventTypeCode);
        //sb.AppendFormat('<a href="javascript:void(0)" title="{1}" onclick="goToEvent(\'{0}\')">', eventInfo.EventID, eventInfo.EventName);
        sb.AppendFormat('<img src="{0}" alt="{1}" /></a>', eventInfo.ImageUrl, eventInfo.EventName);
        sb.Append('<dl class="imgsub">');
        sb.AppendFormat('<dt class="event"><a href="javascript:void(0)" title="{0}" onclick="goEventDetail(\'{1}\',\'{3}\')">[{2}]{0}</a></dt>', eventInfo.EventName, eventInfo.EventID, eventHaed, eventInfo.EventTypeCode);
        //sb.AppendFormat('<dt class="event"><a href="javascript:void(0)" title="{0}" onclick="goToEvent(\'{1}\')">[{2}]{0}</a></dt>', eventInfo.EventName, eventInfo.EventID, eventHaed);
        sb.AppendFormat('<dd class="eventdate">기간 | {0}~{1}</dd>', eventInfo.ProgressStartDate, eventInfo.ProgressEndDate);
        sb.Append('</dl>');

        if (eventInfo.CinemaAreaName != "" && eventInfo.CinemaAreaName != undefined && eventInfo.CinemaAreaName != null) // 영화관코드가 있는 것만 표출
            sb.AppendFormat('<p class="layer_hover"><a href="#">{0}</a></p>', eventInfo.CinemaAreaName);
        sb.Append('</li>');
        result = sb.ToString();
    } catch (e) {
        result = "";
        CheckException(e, "makeEventitem: ", NOW_MENU_TYPE);
    } finally {
        return result;
    }
};

// 20170424 - Facebook 연동 로그 설정
setFacebookLog = function (eventInfo) {
    try {
        // 20170424 - Url 중 fbid 이름의 Query String 변수가 있으면, 
        // 로그 저장을 위한 ID를 먼저 생성
        if (QUERY.fbid != undefined && QUERY.fbid != 'undefined' && QUERY.fbid != null && QUERY.fbid != "") {
            var params = {
                MethodName: "GetFacebookActLogConnectionID",
                channelType: "HO",
                osType: BrowserAgent(),
                osVersion: navigator.userAgent,
                multiLanguageID: Language,
            };

            try {
                GetData("movie", params, getFacebookActLogConnectionID, "sync");
            } catch (e) {
            }
        }
    } catch (e) { }
};

// 20170424 - Facebook 연동 로그 설정
var facebookActLogConnectionID = "";

getFacebookActLogConnectionID = function (obj) {
    try {
        var result = obj.responseJSON;
        if (result == undefined) return;
        if (result.IsOK == undefined) return;

        if (result.IsOK == "true") {
            // 20170424 - Url 중 fbid 이름의 Query String 변수가 있으면, 
            // 로그 저장을 위한 ID를 먼저 생성 후 실제 로그 정보 저장
            if (result.ResultCode != undefined && result.ResultCode != 'undefined' && result.ResultCode != null && result.ResultCode != "") {
                facebookActLogConnectionID = result.ResultCode;
                var tempFacebookMovieCode = QUERY.movie;
                //var tempFormatStr = "";
                //for (var i = 0 ; i < 8 - tempFacebookMovieCode.length ; i++) {
                //    tempFormatStr += "0";
                //}

                //tempFacebookMovieCode = tempFormatStr + tempFacebookMovieCode;

                var params = {
                    MethodName: "SetFacebookActLog",
                    channelType: "HO",
                    osType: BrowserAgent(), 
                    osVersion: navigator.userAgent,
                    multiLanguageID: Language,
                    connectionID: result.ResultCode,
                    actNo: "2010",
                    linkID: QUERY.fbid,
                    itemCode: tempFacebookMovieCode,
                    pageUrl: location.href.replace(/&/gi, '{U0026}'),
                    memberNoOn: memberInfo.MemberNoOn,
                    transNo : ""
                };

                try {
                    GetData("movie", params, setFacebookActLog, "sync");
                } catch (e) {
                }
            }
        }
    } catch (e) {
    }
};

// 20170424 - Facebook 연동 로그 설정 
setFacebookActLog = function (e) {
    try {
        // 로그 저장을 위한 Key와 페이지 URL을 쿠키에 저장
        //cookieJson.ticketingState.facebookActLogConnectionID = facebookActLogConnectionID;
        //cookieJson.ticketingState.facebookActLogPageUrl = location.href;
        $.fn.cookieChanges('add', 'ticketingState.facebookActLogConnectionID', facebookActLogConnectionID);
        $.fn.cookieChanges('add', 'ticketingState.facebookActLogMovieCode', QUERY.movie);
        $.fn.cookieChanges('add', 'ticketingState.facebookActLogPageUrl', location.href);
        $.fn.cookieChanges('add', 'ticketingState.facebookActLogFacebookID', QUERY.fbid);
    } catch (e) { }
};