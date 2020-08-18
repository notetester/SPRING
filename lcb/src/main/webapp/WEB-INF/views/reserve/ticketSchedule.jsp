<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/megabox.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

        
    
    <script src="${pageContext.request.contextPath}/resources/js/megabox-simpleBokd.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript">

        var arrList = new Array();
        var tmpData = { tabIndx: 0 };
        var tabChangeAt = 'N';	//상영일 초기화 여부

        $(function () {

            

            // 항목 클릭
            $('#contents').on('click', '.tab-left-area li', function () {
                tmpData.tabIndx = $('#contents .tab-left-area li').index(this);
                tabChangeAt = "Y";	//상영일 초기화 여부

                if ($('#contents .tab-area').eq(tmpData.tabIndx).find('button.on').length == 0) {
                    $('#contents .tab-area').eq(tmpData.tabIndx).find('button:first').click();
                } else {
                    $('#contents .tab-area').eq(tmpData.tabIndx).find('.tab-list-choice a.on').click();
                }                
            });

            // 항목별 분류 클릭
            $('#contents').on('click', '.tab-list-choice li', function () {
                var idx = $('#contents .tab-list-choice li').index(this);

                if ($('.tab-layer-cont').eq(idx).find('button.on').length != 0) {
                    $('.tab-layer-cont').eq(idx).find('button.on').click();
                }

                if (idx == 0 && $('.tab-layer-cont').eq(idx).find('button.on').length == 0) {
                    $('.tab-layer-cont').eq(idx).find('button:first').click();
                }
            });

            // 영화명, 극장명 클릭
            $('#contents').on('click', '.list-section button', function () {
                var leftIdx = $('#contents .tab-left-area li.on').index();
                if (leftIdx > 0 && leftIdx < 3) tabChangeAt = "Y";	//상영일 초기화 여부

                var $this = $(this);
                var paramData = {};
                var option = { movieObj: $('#contents h3:last'), list: arrList, movieData: paramData, tabChangeAt: tabChangeAt };
                // 			var option    = {movieObj  : $('#contents h3:last'), list : arrList, movieData : paramData};
                var imgAttr = { 'src': $this.data('imgPath'), 'alt': $this.data('movieNm') };


                // 상영 시간표명 변경
                $('#contents .font-green').html($this.text());

                // 영화별 - 영화 포스터 설정
                if (tmpData.tabIndx == 0) {
                    $('div.poster-section div.td').html($('<img class="poster" onerror="noImg(this, \'del\')"/>').attr(imgAttr));
                }

                // 값 설정
                switch (tmpData.tabIndx) {
                    case 0: //영화별
                        paramData.masterType = 'movie';
                        paramData.movieNo = $this.data('movieNo');
                        break;

                    case 1: //극장별
                        paramData.masterType = 'brch';
                        paramData.detailType = 'area';
                        paramData.brchNo = $this.data('brchNo');
                        break;

                    case 2: //특별관
                        paramData.masterType = 'brch';
                        paramData.detailType = 'spcl';
                        paramData.theabKindCd = $this.data('areaCd');
                        paramData.brchNo = $this.data('brchNo');
                        break;
                }             
                tabChangeAt = "N";
            });
        });

        
        // 영화목록 갱신
        function fn_movieListUpt(list, type) {

            var arr = [];
            var $button, $li;

            $.each(list, function (i, param) {

                // 클릭변경
                param.disabled = (param.formAt != 'Y') ? 'disabled' : '';

                // 객체
                $button = $('<button type="button" class="btn ' + param.disabled + '">');
                arr.push($('<li>').html($button));

                // 영화이미지
                param.movieImgPath = 'https://img.megabox.co.kr' + nvl(param.movieImgPath).posterFormat('_316');

                // 버튼정보
                $button.attr({
                    'data-movie-nm': param.movieNm
                    , 'data-movie-no': param.movieNo
                    , 'data-img-path': param.movieImgPath
                }).html(param.movieNm);
            });

            switch (type) {
                case 'all': $('#masterMovie_AllMovie  .list').html(arr); break;
                default: $('#masterMovie_CrtnMovie .list').html(arr);
            }
        }

        // 극장정보 갱신
        function fn_brchListUpt(list, type) {

            var $div, $li, areaCd;

            var areaList = [];
            var brchList = [];

            var html = '<div class="theater-section">';
            html += '	<div class="table">';
            html += '		<div class="td">';
            html += '			<a href="#1" title="#2 특별관 페이지로 이동">';
            html += '				<p><strong>#2</strong>#3</p>';
            html += '				<i class="iconset ico-arrow-half"></i>';
            html += '				<img src="#4" alt="#2 특별관 페이지로 이동" class="poster">';
            html += '			</a>';
            html += '		</div>';
            html += '	</div>';
            html += '</div>';

            $.each(list, function (i, param) {

                if (areaCd != param.areaCd) {

                    areaCd = param.areaCd;

                    var titleTxt = "";
                    if (type == 'spcl') {
                        titleTxt = "특별관 선택";
                    }
                    else {
                        titleTxt = "지점 선택";
                    }

                    // 객채 설정
                    $li = $('<li><a href="#tab' + areaCd + '" title="' + param.areaCdNm + titleTxt + '" data-area-cd="' + areaCd + '">' + param.areaCdNm + '</a></li>');
                    $div = $('<div id="tab' + areaCd + '" class="tab-layer-cont"><div class="scroll m-scroll"><ul class="list"></ul><div></div>');

                    // 첫번째 객체
                    if (i == 0) {
                        $div.addClass('on');
                        $li.find('a').addClass('on');
                    }

                    // 특별관여부
                    if (type == 'spcl') {

                        switch (areaCd) {

                            case 'MX':
                                param.curAreaCdNm = "MX";
                                param.welComeHtml = "진정한 영화 사운드를 통한<br />최고의 영화! <br />메가박스의 차세대 <br />표준 상영관";
                                param.splcBrchLink = "/specialtheater/mx";
                                param.imgUrl = 'https://img.megabox.co.kr/static/pc/images/reserve/img-theater-mx.png';
                                break;
                            case 'CFT':
                                param.curAreaCdNm = "COMFORT";
                                param.welComeHtml = "더욱 편안한 영화 관람을<br />위한 다양한 여유공간";
                                param.splcBrchLink = "/specialtheater/comfort";
                                param.imgUrl = 'https://img.megabox.co.kr/static/pc/images/reserve/img-theater-comfort.png';
                                break;
                            case 'TBQ':
                                param.curAreaCdNm = "THE BOUTIQUE";
                                param.welComeHtml = "영화를 본다는 것,<br />그 놀라운 경험을 위하여";
                                param.splcBrchLink = "/specialtheater/boutique";
                                param.imgUrl = 'https://img.megabox.co.kr/static/pc/images/reserve/img-theater-boutique.png';
                                break;
                            case 'MKB':
                                param.curAreaCdNm = "MEGA KIDS";
                                param.welComeHtml = "아이와 가족이 함께 머물며<br />삶의 소중한 가치를 배우는<br />더 행복한 놀이공간";
                                param.splcBrchLink = "/specialtheater/megakids";
                                param.imgUrl = 'https://img.megabox.co.kr/static/pc/images/reserve/img-theater-kids.png';
                                break;
                            case 'BCY':
                                param.curAreaCdNm = "BALCONY";
                                param.welComeHtml = "CINEMA IN CINEMA,<br />영화관 속<br />나만의 개인 영화관";
                                param.imgFileNm = "balcony";
                                param.splcBrchLink = "/specialtheater/balcony";
                                param.imgUrl = 'https://img.megabox.co.kr/static/pc/images/reserve/img-theater-balcony.png';
                                break;
                            case 'TFC':
                                param.curAreaCdNm = "THE FIRST CLUB";
                                param.welComeHtml = "특별한 날,<br />특별한 당신을 위한<br />단 하나의<br />THE FIRST CLUB";
                                param.splcBrchLink = "/specialtheater/firstclub";
                                param.imgUrl = 'https://img.megabox.co.kr/static/pc/images/reserve/img-theater-firstclub.png';
                                break;
                            case 'DBC':
                                param.curAreaCdNm = "DOLBY";
                                param.welComeHtml = "국내 최초로 메가박스가 <br />선보이는 세계 최고 <br />기술력의 몰입 시네마";
                                param.splcBrchLink = "/specialtheater/dolby";
                                param.imgUrl = 'https://img.megabox.co.kr/static/pc/images/reserve/img-theater-dolby.png';
                                break;
                        }

                        // 특별관 이미지등록
                        $div.append(html.replace('#1', param.splcBrchLink).replaceAll('#2', param.curAreaCdNm).replace('#3', param.welComeHtml).replace('#4', param.imgUrl));

                    } else {
                        arrList.push({ areaCd: areaCd, areaNm: param.areaCdNm });
                    }

                    areaList.push($li);
                    brchList.push($div);
                }

                // 극장추가
                $div.find('ul').append('<li><button type="button" class="btn" data-area-cd="' + areaCd + '" data-brch-no="' + param.brchNo + '">' + param.brchNm + '</button></li>');

                // 극장상태 추가
                if (param.brchOnlineExpoAt == 'Y') {
                    switch (param.brchOnlineExpoStatCd) {
                        case 'OES01': $div.find('button:last').append('&nbsp;<i class="iconset ico-theater-new"></i>'); break;
                        case 'OES02': $div.find('button:last').append('&nbsp;<i class="iconset ico-theater-renewal"></i>'); break;
                        case 'OES03': $div.find('button:last').append('&nbsp;<i class="iconset ico-theater-open"></i>'); break;
                        case 'OES04': $div.find('button:last').append('&nbsp;<i class="iconset ico-theater-open"></i>'); break;
                    }
                }
            });

            // 극장 갯수 설정
            $.each(areaList, function (i, data) {
                data.find('a').append('(' + brchList[i].find('li').length + ')');
            });

            switch (type) {
                case 'area':
                    $('#masterBrch .list-section').html(brchList);
                    $('#masterBrch .tab-list-choice ul').html(areaList);
                    break;
                default:
                    $('#masterSpclBrch .list-section').html(brchList);
                    $('#masterSpclBrch .tab-list-choice ul').html(areaList);
                    $('div.m-scroll').mCustomScrollbar();	//스크롤 기능 추가
            }
        }

    </script>   
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<style>
* {
	box-sizing: border-box;
}

body {
	overflow: auto;
	overflow-y: scroll;
	letter-spacing: 0;
	line-height: 1.5;
	font-size: 15px;
	color: #444;
}

.time-schedule .date-area button.on {
	background-color: #f7f8f9;
	border-bottom: 3px solid #503396;
}

.time-schedule .date-area button {
	width: 70px;
	height: 72px;
	border: 0;
	background-color: transparent;
	float: left;
	border-bottom: 3px solid transparent;
	font-weight: 400;
}

[type=button], [type=reset], [type=submit], button {
	-webkit-appearance: button;
}

button {
	cursor: pointer;
	letter-spacing: -.5px;
	font-weight: 400;	
}

button, select {
	text-transform: none;
}

button, input {
	overflow: visible;
}

button, input, optgroup, select, textarea {
	margin: 0;
	font-family: inherit;
	font-size: 1em;
	line-height: 1.15;
}

.time-schedule .btn-next, .time-schedule .btn-pre {
	width: 30px;
	height: 73px;
	border: 0 !important;
	background-color: transparent !important;
	float: left;
}

[type=button], [type=reset], [type=submit], button {
	-webkit-appearance: button;
}

button {
	cursor: pointer;
	letter-spacing: -.5px;
	font-weight: 400;
	font-family: NanumBarunGothic, Dotum, '돋움', sans-serif;
}

button, select {
	text-transform: none;
}

button, input {
	overflow: visible;
}

button, input, optgroup, select, textarea {
	margin: 0;
	font-family: inherit;
	font-size: 1em;
	line-height: 1.15;
}

.time-schedule .year {
	position: absolute;
	top: 0;
	font-size: .8667em;
	width: 70px;
	height: 28px;
	line-height: 28px;
	margin-top: -14px;
	border: 1px solid #d8d9db;
	border-radius: 15px;
	text-align: center;
	background-color: #fff;
	font-weight: 400;
}

.time-schedule {
	width: 100%;
	margin: 0 auto;
}

.time-schedule .date-area {
	height: 73px;
	float: left;
}

.time-schedule .date-area button.sat {
	color: #3b5fcb;
}

.time-schedule .date-area button.holi {
	color: #e81002;
}

.time-schedule .date-area button.disabled {
	font-weight: 400;
	opacity: .5;
	cursor: default;
}

.time-schedule .ico-cld-pre {
	margin-right: 1px;
}

.ico-cld-pre {
	width: 7px;
	height: 12px;
	background-image:
		url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-cld-pre.png);
}

.ico-cld-next {
	width: 7px;
	height: 12px;
	background-image:
		url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-cld-next.png);
}

.iconset {
	overflow: hidden;
	display: inline-block;
	margin: -1px 0 0 0;
	padding: 0;
	font-size: 0;
	line-height: 0;
	vertical-align: middle;
	background-position: 0 0;
	background-repeat: no-repeat;
}

.time-schedule:after, .time-schedule:before {
	content: '';
	display: table;
}

.time-schedule:after {
	clear: both;
}

.time-schedule:after, .time-schedule:before {
	content: '';
	display: table;
}

.tab-block:before {
    content: '';
    position: absolute;
    left: 0;
    top: 35px;
    width: 100%;    
    background-color: #fff;
}
.time-table-page .movie-choice-area .wrap .tab-list-choice {
    width: 100%;
    height: 54px;
    border-bottom: 0px;
}
button {
	display: inline-block;
}

.ir {
	text-indent: -9999px;
	position: fixed;
	top: -9999px;
	font-size: 1px;
	width: 1px;
	height: 1px;
	opacity: 0;
}

em {
	font-style: normal;
	display: block;
}

.time-schedule .date-area button span {
	vertical-align: bottom;
	line-height: 1.1;
}

.inner-wrap {
	width: 1100px;
	margin: 0 auto;
}

.time-schedule .date-list {
	width: 980px;
	overflow: hidden;
	float: left;
	height: 50px;
}

.year-area {
	position: relative;
}

.year {
	position: absolute;
}

.time-schedule .btn-calendar-large {
	width: 50px;
	height: 72px;
	border: 0;
	font-size: 0;
	line-height: 0;
	text-indent: -999px;
	border-bottom: 0 !important;
	background-color: transparent !important;
}

.btn-calendar-large {
	background:
		url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-calendar-w20.png)
		no-repeat center;
}

.tab-block:before {
	content: '';
	position: absolute;
	left: 0;
	top: 35px;
	width: 100%;
	height: 1px;
	background-color: #d8d9db;
}

a:-webkit-any-link {
	color: -webkit-link;
	cursor: pointer;
	text-decoration: underline;
}

li {
	text-align: -webkit-match-parent;
}

ol, ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.tab-block ul li .btn {
	display: block;
	width: 100%;
	height: 34px;
	margin: 0;
	padding: 0;
	border: 0;
	line-height: 34px;
	text-align: center;
	background-color: transparent;
	text-decoration: none;
	color: #555;
}

.tab-block ul li.hover:first-child, .reserve.theater-list-box .tab-block ul li.on:first-child
	{
	border-color: #555;
}

.tab-block ul li.hover, .reserve.theater-list-box .tab-block ul li.on {
	border-color: #555;
}

.tab-block ul li:nth-child(1) {
	border-left: 1px solid #d8d9db;
}

.tab-block ul li {
	position: relative;
	float: left;
	width: 137px;
	border: 1px solid #d8d9db;
	border-left: 0;
	color: #555;
}

.tab-block ul li.on .btn {
	color: #fff;
	background-color: #555;
}

.theater-list .theater-type-box {
	overflow: hidden;
	width: 100%;
	border-bottom: 1px solid #eaeaea;
}

.theater-list-box .theater-list .theater-type-box {
	overflow: hidden;
	width: 100%;
	position: relative;
}

.theater-area-click {
	padding: 0 0 15px 0;
	border-bottom: 1px solid #eaeaea;
	font-weight: 700;
	font-size: 1.2em;
}

.theater-list-box .theater-list .theater-type-box .theater-type {
	text-align: left;
	width: 170px;
	display: table-cell;
	vertical-align: middle;
	position: absolute;
	top: 20px;
	left: 0;
	padding: 0 !important;
}

.theater-list-box .theater-list .theater-type-box .theater-type p.theater-name
	{
	font-size: 1.2em;
	color: #444;
	font-weight: 400;
	margin-bottom: 10px;
	line-height: 1em;
}

.theater-area-click a {
	text-decoration: none;
	color: #555;
}

.reserve.theater-list-box .theater-list .theater-type-box .theater-type-area
	{
	display: table-cell;
	vertical-align: middle;
	width: 100px;
	background-color: #f2f4f5;
	text-align: center;
	color: #444;
	font-weight: 700;
	border-bottom: 0;
}

.theater-list {
	position: relative;
}

.theater-list .theater-type-box .theater-time .time-list-table {
	border-top: 1px solid #ebebeb;
	border-left: 1px solid #ebebeb;
	width: 800px;
	margin-left: 9px;
	width: auto;
	table-layout: auto;
}

table caption {
	overflow: hidden;
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	opacity: 0;
}

.time-list-table colgroup {
	display: none;
}

table {
	width: 100%;
	margin: 0;
	border: 0;
	table-layout: fixed;
	border-collapse: collapse;
	empty-cells: show;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

.time-list-table tbody tr td {
	width: 99px;
	border-right: 1px solid #ebebeb;
	border-bottom: 1px solid #ebebeb;
	text-align: center;
}

.time-list-table tbody tr td .td-ab {
	width: 100%;
	height: 93px;
	display: table;
}

.time-list-table tbody tr td .td-ab .txt-center {
	display: table-cell;
	vertical-align: middle;
	position: relative;
}

.time-list-table tbody tr td .td-ab .txt-center a {
	display: inline-block;
	width: 100%;
}

.time-list-table tbody tr td .td-ab .ico-box {
	position: absolute;
	top: 5px;
	left: 5px;
	z-index: 1;
}

.time-list-table tbody tr td .td-ab p.time {
	font-size: 1.2em;
	color: #444;
	font-weight: 400;
	line-height: 1em;
	font-family: Roboto;
}

.time-list-table tbody tr td .td-ab p.chair {
	color: #01738b;
}

.time-list-table tbody tr td .td-ab:hover .play-time p:nth-child(1) {
	margin-top: 12px;
}

.time-list-table tbody tr td .td-ab .play-time {
	display: none;
}

.theater-list .theater-type-box .theater-time {
	width: 100%;
	margin-left: 190px;
}

.theater-type-area {
	display: table-cell;
	vertical-align: middle;
	width: 100px;
	background-color: #f2f4f5;
	text-align: center;
	color: #444;
	font-weight: 700;
	border-bottom: 0;
	padding-top: 20px;
	padding-bottom: 20px;
}

.theater-time {
	position: relative;
	float: left;
	width: 81%;
	margin: 20px 0;
}

.reserve.theater-list-box {
	width: 100%;
	display: table;
	border-top: 0;
}

.theater-time-box {
	position: absolute;
	top: -16px;
	z-index: auto;
	margin-left: 100px;
}
.txt-center a{ text-decoration: none;}
.time-list-table tbody tr td .td-ab {
    width: 100%;
    height: 98px;
    display: table;
}
.body-wrap{ 
	width: 68%;
    height: 70%;
    margin: 0 auto;
}
</style>
</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<Br>
	<Br>
	<Br>	
	
	<div class="body-wrap">
        <div id="schdlContainer" class="container">
            <div id="contents">
                <div class="inner-wrap">
                    <div class="time-table-page">
                        <div class="movie-choice-area">
                            <div class="tab-left-area">
                                <ul>
                                    <li class="on"><a href="#masterMovie" title="영화별 선택" class="btn"><i
                                                class="iconset ico-tab-movie"></i> 영화별</a></li>                                   
                                </ul>
                            </div>

                            <div class="ltab-layer-wrap">
                                <div id="masterMovie" class="ltab-layer-cont has-img on"><a href="" class="ir"></a>
                                    <div class="wrap tab-area">
                                        <div class="tab-list-choice">
                                            <ul>
                                                <li><a href="#masterMovie_AllMovie" title="전체영화 선택"
                                                        class="btn on">전체영화</a></li>                                                
                                            </ul>
                                        </div>
                                        <div class="list-section">
                                            <div id="masterMovie_AllMovie" class="tab-layer-cont on"><a href=""
                                                    class="ir"></a>
                                                <div class="scroll m-scroll mCustomScrollbar _mCS_2">
                                                    <div id="mCSB_2"
                                                        class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
                                                        style="max-height: none;" tabindex="0">
                                                        <div id="mCSB_2_container" class="mCSB_container"
                                                            style="position:relative; top:0; left:0;" dir="ltr">
                                                            <ul class="list">
                                                                <li><button type="button" id="v1" class="btn" data-movie-nm="반도"
                                                                        data-movie-no="20021300"
                                                                        data-img-path="https://img.megabox.co.kr/SharedImg/2020/07/14/O8cCC0j4fb8DD7SfbQgwNW7rBSJ6JuYQ_316.gif">반도</button>
                                                                </li>
                                                                
                                                                <li><button type="button" id="v3" class="btn"
                                                                        data-movie-nm="알라딘" data-movie-no="01542500"
                                                                        data-img-path="https://img.megabox.co.kr/SharedImg/2020/07/17/AXJfBFiHZMVR1o9Qjezt2L33RQHL8vUP_316.gif">알라딘</button>
                                                                </li>
                                                                <li><button type="button" id="v2" class="btn"
                                                                        data-movie-nm="온워드: 단 하루의 기적"
                                                                        data-movie-no="01693600"
                                                                        data-img-path="https://img.megabox.co.kr/SharedImg/2020/07/08/mdUVsCdumzsBGdlL3ntTG4cWZjSchkrC_316.jpg">온워드:
                                                                        단 하루의 기적</button></li>                                                               
                                                                <li><button type="button" id="v5" class="btn"
                                                                        data-movie-nm="밤쉘: 세상을 바꾼 폭탄선언"
                                                                        data-movie-no="20007000"
                                                                        data-img-path="https://img.megabox.co.kr/SharedImg/2020/07/17/x9iw1Z0lm1WXWs3O3nLGDZquZML2GoFU_316.jpg">밤쉘:
                                                                        세상을 바꾼 폭탄선언</button></li>
                                                                
                                                                <li><button type="button" id="v4" class="btn"
                                                                        data-movie-nm="&amp;#35;살아있다"
                                                                        data-movie-no="20019200"
                                                                        data-img-path="https://img.megabox.co.kr/SharedImg/2020/06/02/xIBdAOS5lJNBe1CBXovcV1WYE9Q6DWPV_316.jpg">#살아있다</button>
                                                                </li>
                                                                <li><button type="button" id="v7" class="btn"
                                                                        data-movie-nm="소년시절의 너" data-movie-no="20027300"
                                                                        data-img-path="https://img.megabox.co.kr/SharedImg/2020/06/19/4N4IdgIE4bXyn0O0mWDHT5eOFFzgMutA_316.jpg">소년시절의
                                                                        너</button></li>
                                                                <li><button type="button" id="v6" class="btn"
                                                                        data-movie-nm="블루 아워" data-movie-no="20026300"
                                                                        data-img-path="https://img.megabox.co.kr/SharedImg/2020/07/07/MKIdmHUeWpkyskUWsgpGcGvibjhJ153g_316.jpg">블루
                                                                        아워</button></li>         
                                                               
                                                                <li><button type="button" id="v8" class="btn"
                                                                        data-movie-nm="팬데믹" data-movie-no="20029700"
                                                                        data-img-path="https://img.megabox.co.kr/SharedImg/2020/07/10/0IA73cnVznnOD7Ye8RTJ5wBg1UG5R7t4_316.jpg">팬데믹</button>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div id="mCSB_2_scrollbar_vertical"
                                                            class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical"
                                                            style="display: block;">
                                                            <div class="mCSB_draggerContainer">
                                                                <div id="mCSB_2_dragger_vertical" class="mCSB_dragger"
                                                                    style="position: absolute; min-height: 30px; display: block; height: 46px; max-height: 190px; top: 0px;">
                                                                    <div class="mCSB_dragger_bar"
                                                                        style="line-height: 30px;"></div>
                                                                </div>
                                                                <div class="mCSB_draggerRail"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                    <div class="poster-section">
                                        <div class="table">
                                            <div class="td"><img class="poster" onerror="noImg(this, 'del')"
                                                    src="https://img.megabox.co.kr/SharedImg/2020/07/14/O8cCC0j4fb8DD7SfbQgwNW7rBSJ6JuYQ_316.gif"
                                                    alt="반도">
                                            </div>
                                        </div>
                                    </div>
                                        </div>
                                                           
                                			                                            
                                        </div>
                                    </div>
                                </div>
                    </div>
                </div>
            </div>
       
	
	
	
	<div class="inner-wrap">
		<div class="time-schedule mb30">
			<div class="wrap">
				<button type="button" title="이전 날짜 보기" class="btn-pre"
					disabled="true">
					<i class="iconset ico-cld-pre"></i> <em>이전</em>
				</button>
				<div class="date-list">
					<div class="year-area">
						<div class="year"
							style="left: 30px; z-index: 1; opacity: 1; top: 17px;">2020.08</div>
						<div class="year"
							style="left: 900px; z-index: 1; opacity: 1; top: 17px;">2020.09</div>
					</div>
					<div class="date-area">
						<div class="wrap"
							style="position: relative; width: 2100px; border: none; left: -70px; top: 17px;">
							<button class="disabled" type="button" date-data="2020.08.18"
								month="6" tabindex="-1">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">18<span
									style="pointer-events: none;" class="ir">일</span></em><span
									class="day-kr"
									style="pointer-events: none; display: inline-block">화</span><span
									class="day-en" style="pointer-events: none; display: none">Tue</span>
							</button>
							<button class="on" id="d1" type="button" date-data="2020.08.19" month="6">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">19<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">오늘</span> <span
									class="day-en" style="pointer-events: none; display: none">Wed</span>
							</button>
							<button class=""  id="d2"type="button" date-data="2020.08.20" month="6">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">20<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">내일</span> <span
									class="day-en" style="pointer-events: none; display: none">Thu</span>
							</button>
							<button class="" id="d3" type="button" date-data="2020.08.21" month="6">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">21<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">금</span> <span
									class="day-en" style="pointer-events: none; display: none">Fri</span>
							</button>
							<button class="sat" id="d4" type="button" date-data="2020.08.22" month="6">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">22<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">토</span> <span
									class="day-en" style="pointer-events: none; display: none">Sat</span>
							</button>
							<button class="holi" id="d5" type="button" date-data="2020.08.23"
								month="6">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">23<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">일</span> <span
									class="day-en" style="pointer-events: none; display: none">Sun</span>
							</button>
							<button class="" id="d6" type="button" date-data="2020.08.24"
								month="6">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">24<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">월</span> <span
									class="day-en" style="pointer-events: none; display: none">Mon</span>
							</button>
							<button class="" id="d7" type="button" date-data="2020.08.25" month="6">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">25<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">화</span> <span
									class="day-en" style="pointer-events: none; display: none">Tue</span>
							</button>
							<button class="" id="d8" type="button" date-data="2020.08.26" month="6">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">26<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">수</span> <span
									class="day-en" style="pointer-events: none; display: none">Wed</span>
							</button>
							<button class="" id="d9" type="button" date-data="2020.08.27" month="6">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">27<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">목</span> <span
									class="day-en" style="pointer-events: none; display: none">Thu</span>
							</button>
							<button class="disabled" type="button" date-data="2020.08.28"
								month="6">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">28<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">금</span> <span
									class="day-en" style="pointer-events: none; display: none">Fri</span>
							</button>
							<button class="disabled sat" type="button" date-data="2020.08.29"
								month="6">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">29<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">토</span> <span
									class="day-en" style="pointer-events: none; display: none">Sat</span>
							</button>
							<button class="disabled holi" type="button" date-data="2020.08.30"
								month="7">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">30<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">일</span> <span
									class="day-en" style="pointer-events: none; display: none">Sun</span>
							</button>
							<button class="disabled" type="button"
								date-data="2020.08.31" month="7">
								<span class="ir">2020년 8월</span> <em
									style="pointer-events: none;">31<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">월</span> <span
									class="day-en" style="pointer-events: none; display: none">Mon</span>
							</button>
							<button class="disabled" type="button" date-data="2020.09.01"
								month="7">
								<span class="ir">2020년 9월</span> <em
									style="pointer-events: none;">1<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">화</span> <span
									class="day-en" style="pointer-events: none; display: none">Tue</span>
							</button>
							<button class="disabled" type="button" date-data="2020.09.02"
								month="7" tabindex="-1">
								<span class="ir">2020년 9월</span> <em
									style="pointer-events: none;">2<span
									style="pointer-events: none;" class="ir">일</span></em> <span
									class="day-kr"
									style="pointer-events: none; display: inline-block">수</span> <span
									class="day-en" style="pointer-events: none; display: none">Wed</span>
							</button>
						</div>
					</div>
				</div>
				<button type="button" title="다음 날짜 보기" class="btn-next"
					disabled="true">
					<i class="iconset ico-cld-next"></i> <em>다음</em>
				</button>
				<div class="bg-line">
					<input type="hidden" name="datePicker" id="dp1595324605158"
						class="hasDatepicker" value="2020.07.21">
					<button type="button" class="btn-calendar-large" title="달력보기">
						달력보기</button>
				</div>
				<br><br><br>
				<br><br><br>
				<div class="tab-block tab-layer mb30">
					<ul>
						<li class=""><button class="btn" id="btn1" data-area-cd="10"
							title="서울 선택">서울</button></li>
						<li class=""><button href="" class="btn" id="btn2" data-area-cd="30" title="경기 선택">경기</button></li>						
					</ul>
				</div>
				<br> <br>
				<div class="reserve theater-list-box">
					<div class="theater-list">
						<div class="theater-area-click s">
							<a href="/theater?brchNo=1372" title="강남 상세보기">강남</a>
						</div>
						<div class="theater-type-box s">
							<div class="theater-type">
								<p class="theater-name">1관</p>
								<p class="chair">총 232석</p>
							</div>
							<div class="theater-time">
								<div class="theater-type-area">2D</div>
								<div class="theater-time-box">
									<table class="time-list-table">
										<caption>상영시간을 보여주는 표 입니다.</caption>
										<colgroup>
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
										</colgroup>
										<tbody>
											<tr id="k-1">
												<%-- <td class="" brch-no="1372" play-schdl-no="2007291372001"
													rpst-movie-no="20034200" theab-no="01" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve?timetable_number=0" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">10:00</p>
																<p class="chair">177석</p>
																<div class="play-time">
																	<p>10:00~12:22</p>
																	<p>1회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372002"
													rpst-movie-no="20034200" theab-no="01" play-de="20200729"
													play-seq="2">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">12:40</p>
																<p class="chair">176석</p>
																<div class="play-time">
																	<p>12:40~15:02</p>
																	<p>2회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372003"
													rpst-movie-no="20034200" theab-no="01" play-de="20200729"
													play-seq="3">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">15:20</p>
																<p class="chair">171석</p>
																<div class="play-time">
																	<p>15:20~17:42</p>
																	<p>3회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372004"
													rpst-movie-no="20034200" theab-no="01" play-de="20200729"
													play-seq="4">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">18:00</p>
																<p class="chair">166석</p>
																<div class="play-time">
																	<p>18:00~20:22</p>
																	<p>4회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372005"
													rpst-movie-no="20034200" theab-no="01" play-de="20200729"
													play-seq="5">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">20:40</p>
																<p class="chair">177석</p>
																<div class="play-time">
																	<p>20:40~23:02</p>
																	<p>5회차</p>
																</div>
															</a>
														</div>
													</div>
												</td> --%>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="theater-type-box s">
							<div class="theater-type">
								<p class="theater-name">2관</p>
								<p class="chair">총 103석</p>
							</div>
							<div class="theater-time">
								<div class="theater-type-area">2D</div>
								<div class="theater-time-box">
									<table class="time-list-table">
										<caption>상영시간을 보여주는 표 입니다.</caption>
										<colgroup>
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
										</colgroup>
										<tbody>
											<tr id="k-2">
												<%-- <td class="" brch-no="1372" play-schdl-no="2007291372069"
													rpst-movie-no="20034200" theab-no="02" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">10:35</p>
																<p class="chair">83석</p>
																<div class="play-time">
																	<p>10:35~12:57</p>
																	<p>1회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372069"
													rpst-movie-no="20034200" theab-no="02" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">14:35</p>
																<p class="chair">83석</p>
																<div class="play-time">
																	<p>14:35~16:57</p>
																	<p>2회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372069"
													rpst-movie-no="20034200" theab-no="02" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">18:50</p>
																<p class="chair">83석</p>
																<div class="play-time">
																	<p>18:50~20:23</p>
																	<p>3회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372069"
													rpst-movie-no="20034200" theab-no="02" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">21:30</p>
																<p class="chair">83석</p>
																<div class="play-time">
																	<p>21:30~23:47</p>
																	<p>4회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>  --%>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="theater-type-box s">
							<div class="theater-type">
								<p class="theater-name" id="f1">3관</p>
								<p class="chair">총 232석</p>
							</div>
							<div class="theater-time">
								<div class="theater-type-area">2D</div>
								<div class="theater-time-box">
									<table class="time-list-table">
										<caption>상영시간을 보여주는 표 입니다.</caption>
										<colgroup>
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
										</colgroup>
										<tbody>
											<tr id="k-3">
												<%-- <td class="" brch-no="1372" play-schdl-no="2007291372052"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-sun"></i>
																</div>
																<p class="time">09:00</p>
																<p class="chair">183석</p>
																<div class="play-time">
																	<p>09:00~11:22</p>
																	<p>1회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372051"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="2">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">11:40</p>
																<p class="chair">184석</p>
																<div class="play-time">
																	<p>11:40~14:02</p>
																	<p>2회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372050"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="3">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">14:20</p>
																<p class="chair">165석</p>
																<div class="play-time">
																	<p>14:20~16:42</p>
																	<p>3회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372055"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="4">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">17:00</p>
																<p class="chair">176석</p>
																<div class="play-time">
																	<p>17:00~19:22</p>
																	<p>4회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372048"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="5">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">19:40</p>
																<p class="chair">153석</p>
																<div class="play-time">
																	<p>19:40~22:02</p>
																	<p>5회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372047"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="6">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">22:25</p>
																<p class="chair">184석</p>
																<div class="play-time">
																	<p>22:25~24:47</p>
																	<p>6회차</p>
																</div>
															</a>
														</div>
													</div>
												</td> --%>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="theater-area-click s">
							<a href="/theater?brchNo=1372" title="홍대 상세보기">홍대</a>
						</div>
						<div class="theater-type-box s">
							<div class="theater-type">
								<p class="theater-name">1관</p>
								<p class="chair">총 232석</p>
							</div>
							<div class="theater-time">
								<div class="theater-type-area">2D</div>
								<div class="theater-time-box">
									<table class="time-list-table">
										<caption>상영시간을 보여주는 표 입니다.</caption>
										<colgroup>
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
										</colgroup>
										<tbody>
											 <tr id="h-1">
												<%--<td class="" brch-no="1372" play-schdl-no="2007291372001"
													rpst-movie-no="20034200" theab-no="01" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">10:00</p>
																<p class="chair">177석</p>
																<div class="play-time">
																	<p>10:00~12:22</p>
																	<p>1회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372002"
													rpst-movie-no="20034200" theab-no="01" play-de="20200729"
													play-seq="2">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">12:40</p>
																<p class="chair">176석</p>
																<div class="play-time">
																	<p>12:40~15:02</p>
																	<p>2회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372003"
													rpst-movie-no="20034200" theab-no="01" play-de="20200729"
													play-seq="3">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">15:20</p>
																<p class="chair">171석</p>
																<div class="play-time">
																	<p>15:20~17:42</p>
																	<p>3회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372004"
													rpst-movie-no="20034200" theab-no="01" play-de="20200729"
													play-seq="4">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">18:00</p>
																<p class="chair">166석</p>
																<div class="play-time">
																	<p>18:00~20:22</p>
																	<p>4회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372005"
													rpst-movie-no="20034200" theab-no="01" play-de="20200729"
													play-seq="5">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">20:40</p>
																<p class="chair">177석</p>
																<div class="play-time">
																	<p>20:40~23:02</p>
																	<p>5회차</p>
																</div>
															</a>
														</div>
													</div>
												</td> --%>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="theater-type-box s">
							<div class="theater-type">
								<p class="theater-name">2관</p>
								<p class="chair">총 103석</p>
							</div>
							<div class="theater-time">
								<div class="theater-type-area">2D</div>
								<div class="theater-time-box">
									<table class="time-list-table">
										<caption>상영시간을 보여주는 표 입니다.</caption>
										<colgroup>
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
										</colgroup>
										<tbody>
											<tr id="h-2">
												<%-- <td class="" brch-no="1372" play-schdl-no="2007291372069"
													rpst-movie-no="20034200" theab-no="02" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">10:35</p>
																<p class="chair">83석</p>
																<div class="play-time">
																	<p>10:35~12:57</p>
																	<p>1회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												
												<td class="" brch-no="1372" play-schdl-no="2007291372069"
													rpst-movie-no="20034200" theab-no="02" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">14:20</p>
																<p class="chair">83석</p>
																<div class="play-time">
																	<p>14:20~17:37</p>
																	<p>2회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												
												<td class="" brch-no="1372" play-schdl-no="2007291372069"
													rpst-movie-no="20034200" theab-no="02" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">19:30</p>
																<p class="chair">83석</p>
																<div class="play-time">
																	<p>19:30~21:57</p>
																	<p>3회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372069"
													rpst-movie-no="20034200" theab-no="02" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">22:20</p>
																<p class="chair">83석</p>
																<div class="play-time">
																	<p>22:20~00:37</p>
																	<p>4회차</p>
																</div>
															</a>
														</div>
													</div>
												</td> --%>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="theater-type-box s">
							<div class="theater-type" id="f2">
								<p class="theater-name">3관</p>
								<p class="chair">총 232석</p>
							</div>
							<div class="theater-time">
								<div class="theater-type-area">2D</div>
								<div class="theater-time-box">
									<table class="time-list-table">
										<caption>상영시간을 보여주는 표 입니다.</caption>
										<colgroup>
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
											<col style="width: 99px;">
										</colgroup>
										<tbody>
											<tr id="h-3">
												<%-- <td class="" brch-no="1372" play-schdl-no="2007291372052"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="1">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-sun"></i>
																</div>
																<p class="time">09:00</p>
																<p class="chair">183석</p>
																<div class="play-time">
																	<p>09:00~11:22</p>
																	<p>1회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372051"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="2">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">11:40</p>
																<p class="chair">184석</p>
																<div class="play-time">
																	<p>11:40~14:02</p>
																	<p>2회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372050"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="3">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">14:20</p>
																<p class="chair">165석</p>
																<div class="play-time">
																	<p>14:20~16:42</p>
																	<p>3회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372055"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="4">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">17:00</p>
																<p class="chair">176석</p>
																<div class="play-time">
																	<p>17:00~19:22</p>
																	<p>4회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372048"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="5">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">19:40</p>
																<p class="chair">153석</p>
																<div class="play-time">
																	<p>19:40~22:02</p>
																	<p>5회차</p>
																</div>
															</a>
														</div>
													</div>
												</td>
												<td class="" brch-no="1372" play-schdl-no="2007291372047"
													rpst-movie-no="20034200" theab-no="03" play-de="20200729"
													play-seq="6">
													<div class="td-ab">
														<div class="txt-center">
															<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																<div class="ico-box">
																	<i class="iconset ico-off"></i>
																</div>
																<p class="time">22:25</p>
																<p class="chair">184석</p>
																<div class="play-time">
																	<p>22:25~24:47</p>
																	<p>6회차</p>
																</div>
															</a>
														</div>
													</div>
												</td> --%>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="theater-list k">
							<div class="theater-area-click">
								<a href="/theater?brchNo=4121" title="일산벨라시티 상세보기">일산벨라시티</a>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">1관</p>
									<p class="chair">총 118석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>
											<colgroup>
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
											</colgroup>
											<tbody>
												<tr id="i-1">
													<%-- <td class="" brch-no="4121" play-schdl-no="2007294121082"
														rpst-movie-no="20034200" theab-no="02" play-de="20200729"
														play-seq="2">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">09:30</p>
																	<p class="chair">91석</p>
																	<div class="play-time">
																		<p>09:30~11:57</p>
																		<p>1회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121083"
														rpst-movie-no="20034200" theab-no="02" play-de="20200729"
														play-seq="3">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">12:30</p>
																	<p class="chair">93석</p>
																	<div class="play-time">
																		<p>12:30~15:12</p>
																		<p>2회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121084"
														rpst-movie-no="20034200" theab-no="02" play-de="20200729"
														play-seq="4">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">15:40</p>
																	<p class="chair">93석</p>
																	<div class="play-time">
																		<p>15:40~17:57</p>
																		<p>3회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121085"
														rpst-movie-no="20034200" theab-no="02" play-de="20200729"
														play-seq="5">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">18:10</p>
																	<p class="chair">87석</p>
																	<div class="play-time">
																		<p>18:10~20:32</p>
																		<p>4회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121086"
														rpst-movie-no="20034200" theab-no="02" play-de="20200729"
														play-seq="6">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">20:50</p>
																	<p class="chair">93석</p>
																	<div class="play-time">
																		<p>20:50~23:12</p>
																		<p>5회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													
													<td class="" brch-no="4121" play-schdl-no="2007294121086"
														rpst-movie-no="20034200" theab-no="02" play-de="20200729"
														play-seq="6">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">23:20</p>
																	<p class="chair">93석</p>
																	<div class="play-time">
																		<p>23:20~25:42</p>
																		<p>6회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td> --%>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">2관</p>
									<p class="chair">총 190석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>
											<colgroup>
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
											</colgroup>
											<tbody>
												<tr id="i-2">
													<%-- <td class="" brch-no="4121" play-schdl-no="2007294121013"
														rpst-movie-no="20034200" theab-no="04" play-de="20200729"
														play-seq="1">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-sun"></i>
																	</div>
																	<p class="time">09:30</p>
																	<p class="chair">146석</p>
																	<div class="play-time">
																		<p>09:30~11:52</p>
																		<p>1회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121014"
														rpst-movie-no="20034200" theab-no="04" play-de="20200729"
														play-seq="2">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">12:10</p>
																	<p class="chair">146석</p>
																	<div class="play-time">
																		<p>12:10~14:32</p>
																		<p>2회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121015"
														rpst-movie-no="20034200" theab-no="04" play-de="20200729"
														play-seq="3">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">14:50</p>
																	<p class="chair">145석</p>
																	<div class="play-time">
																		<p>14:50~17:12</p>
																		<p>3회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121016"
														rpst-movie-no="20034200" theab-no="04" play-de="20200729"
														play-seq="4">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">17:30</p>
																	<p class="chair">135석</p>
																	<div class="play-time">
																		<p>17:30~19:52</p>
																		<p>4회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121017"
														rpst-movie-no="20034200" theab-no="04" play-de="20200729"
														play-seq="5">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">20:10</p>
																	<p class="chair">122석</p>
																	<div class="play-time">
																		<p>20:10~22:32</p>
																		<p>5회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121018"
														rpst-movie-no="20034200" theab-no="04" play-de="20200729"
														play-seq="6">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">22:50</p>
																	<p class="chair">148석</p>
																	<div class="play-time">
																		<p>22:50~25:12</p>
																		<p>6회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td> --%>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>							
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">MX관</p>
									<p class="chair">총 218석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D ATMOS</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>
											<colgroup>
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
											</colgroup>
											<tbody>
												<tr id="i-3">
													<%-- <td class="" brch-no="4121" play-schdl-no="2007294121007"
														rpst-movie-no="20034200" theab-no="06" play-de="20200729"
														play-seq="1">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-sun"></i>
																	</div>
																	<p class="time">09:00</p>
																	<p class="chair">158석</p>
																	<div class="play-time">
																		<p>09:00~11:22</p>
																		<p>1회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121008"
														rpst-movie-no="20034200" theab-no="06" play-de="20200729"
														play-seq="2">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">11:40</p>
																	<p class="chair">155석</p>
																	<div class="play-time">
																		<p>11:40~14:02</p>
																		<p>2회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121009"
														rpst-movie-no="20034200" theab-no="06" play-de="20200729"
														play-seq="3">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">14:20</p>
																	<p class="chair">158석</p>
																	<div class="play-time">
																		<p>14:20~16:42</p>
																		<p>3회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121010"
														rpst-movie-no="20034200" theab-no="06" play-de="20200729"
														play-seq="4">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">17:00</p>
																	<p class="chair">159석</p>
																	<div class="play-time">
																		<p>17:00~19:22</p>
																		<p>4회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121011"
														rpst-movie-no="20034200" theab-no="06" play-de="20200729"
														play-seq="5">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">19:40</p>
																	<p class="chair">150석</p>
																	<div class="play-time">
																		<p>19:40~22:02</p>
																		<p>5회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="4121" play-schdl-no="2007294121012"
														rpst-movie-no="20034200" theab-no="06" play-de="20200729"
														play-seq="6">
														<div class="td-ab">
															<div class="txt-center">
																<a href="${pageContext.request.contextPath}/reserve/seatReserve" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">22:20</p>
																	<p class="chair">157석</p>
																	<div class="play-time">
																		<p>22:20~24:42</p>
																		<p>6회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td> --%>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>				
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../include/footer.jsp"%>
	
	<script>
	
	$(document).ready(function(){
		
		
		var str1=""; var str2=""; var str3="";
		var str4=""; var str5=""; var str6="";
		var str7=""; var str8=""; var str9="";
		
		$.getJSON("${pageContext.request.contextPath}/reserve/getTime/"+19,
				function(data){        				
				console.log(data);
			
			
				for(var i=0; i<5; i++){
    				str1+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
    					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
						"play-seq='1'>"+
						"<div class='td-ab'>"+
							"<div class='txt-center'>"+
								"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
									"<div class='ico-box'>"+
										"<i class='iconset ico-off'></i>"+
									"</div>"+
									"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
									"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
									"<div class='play-time'>"+
										"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
										"<p>"+(i+1)+"회차</p>"+
									"</div>"+
								"</a>"+
							"</div>"+
						"</div>"+
					"</td>"
				}
				
				
				
				for(var i=5; i<9; i++){
    				str2+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
    					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
						"play-seq='1'>"+
						"<div class='td-ab'>"+
							"<div class='txt-center'>"+
								"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
									"<div class='ico-box'>"+
										"<i class='iconset ico-off'></i>"+
									"</div>"+
									"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
									"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
									"<div class='play-time'>"+
										"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
										"<p>"+(i+1-5)+"회차</p>"+
									"</div>"+
								"</a>"+
							"</div>"+
						"</div>"+
					"</td>"
				}
			
				
				for(var i=9; i<15; i++){
    				str3+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
    					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
						"play-seq='1'>"+
						"<div class='td-ab'>"+
							"<div class='txt-center'>"+
								"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
									"<div class='ico-box'>"+
										"<i class='iconset ico-off'></i>"+
									"</div>"+
									"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
									"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
									"<div class='play-time'>"+
										"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
										"<p>"+(i+1-9)+"회차</p>"+
									"</div>"+
								"</a>"+
							"</div>"+
						"</div>"+
					"</td>"
				}
				
				
				
				for(var i=15; i<20; i++){
    				str4+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
    					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
						"play-seq='1'>"+
						"<div class='td-ab'>"+
							"<div class='txt-center'>"+
								"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
									"<div class='ico-box'>"+
										"<i class='iconset ico-off'></i>"+
									"</div>"+
									"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
									"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
									"<div class='play-time'>"+
										"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
										"<p>"+(i+1-15)+"회차</p>"+
									"</div>"+
								"</a>"+
							"</div>"+
						"</div>"+
					"</td>"
				}
				
				
				for(var i=20; i<24; i++){
    				str5+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
    					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
						"play-seq='1'>"+
						"<div class='td-ab'>"+
							"<div class='txt-center'>"+
								"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
									"<div class='ico-box'>"+
										"<i class='iconset ico-off'></i>"+
									"</div>"+
									"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
									"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
									"<div class='play-time'>"+
										"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
										"<p>"+(i+1-20)+"회차</p>"+
									"</div>"+
								"</a>"+
							"</div>"+
						"</div>"+
					"</td>"
				}
				
				
				

				 for(var i=24; i<30; i++){
    				str6+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
    					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
						"play-seq='1'>"+
						"<div class='td-ab'>"+
							"<div class='txt-center'>"+
								"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
									"<div class='ico-box'>"+
										"<i class='iconset ico-off'></i>"+
									"</div>"+
									"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
									"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
									"<div class='play-time'>"+
										"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
										"<p>"+(i+1-24)+"회차</p>"+
									"</div>"+
								"</a>"+
							"</div>"+
						"</div>"+
					"</td>"
				}
				
				
				
				
				
				 for(var i=30; i<36; i++){
     				str7+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
     					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
							"play-seq='1'>"+
							"<div class='td-ab'>"+
								"<div class='txt-center'>"+
									"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
										"<div class='ico-box'>"+
											"<i class='iconset ico-off'></i>"+
										"</div>"+
										"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
										"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
										"<div class='play-time'>"+
											"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
											"<p>"+(i+1-30)+"회차</p>"+
										"</div>"+
									"</a>"+
								"</div>"+
							"</div>"+
						"</td>"
 				}
 				
				
 				
 				 for(var i=36; i<42; i++){
     				str8+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
     					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
							"play-seq='1'>"+
							"<div class='td-ab'>"+
								"<div class='txt-center'>"+
									"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
										"<div class='ico-box'>"+
											"<i class='iconset ico-off'></i>"+
										"</div>"+
										"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
										"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
										"<div class='play-time'>"+
											"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
											"<p>"+(i+1-36)+"회차</p>"+
										"</div>"+
									"</a>"+
								"</div>"+
							"</div>"+
						"</td>"
 				}
 				
 			
 				
 				
 				for(var i=42; i<48; i++){
     				str9+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
     					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
							"play-seq='1'>"+
							"<div class='td-ab'>"+
								"<div class='txt-center'>"+
									"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
										"<div class='ico-box'>"+
											"<i class='iconset ico-off'></i>"+
										"</div>"+
										"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
										"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
										"<div class='play-time'>"+
											"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
											"<p>"+(i+1-42)+"회차</p>"+
										"</div>"+
									"</a>"+
								"</div>"+
							"</div>"+
						"</td>"
 				}         				
	
 				$("#k-1").html(str1);
  				$("#k-2").html(str2);
  				$("#k-3").html(str3);
  				$("#h-1").html(str4);
  				$("#h-2").html(str5);
 				$("#h-3").html(str6); 
 				$("#i-1").html(str7);          				
 				$("#i-2").html(str8); 
 				$("#i-3").html(str9); 
		})		
		console.log("안녕");
	})
	
	
	function timestamp(millis){
		
		var time;
		
		var today = new Date(millis);
			
	/* 	var year = today.getFullYear();//년
		var month = today.getMonth()+1;//월
		var day = today.getDate();//일
			 */
		var hour = today.getHours();//시
		var minute = today.getMinutes();//분
		var second = today.getSeconds();//초
		
		time = (hour<10?"0"+hour:hour)+":"+(minute<10?"0"+minute:minute);
		
		return time;
	}
	
	
	$("#v1").click(function(){
		$(".m1").css("display","block");
		$(".m2").css("display","none");
		$(".m3").css("display","none");
		$(".m4").css("display","none");
		$(".m5").css("display","none");
		$(".m6").css("display","none");
		$(".m7").css("display","none");
		$(".m8").css("display","none");
		
	});
	
	$("#v2").click(function(){
		$(".m1").css("display","none");
		$(".m2").css("display","block");
		$(".m3").css("display","none");
		$(".m4").css("display","none");
		$(".m5").css("display","none");
		$(".m6").css("display","none");
		$(".m7").css("display","none");
		$(".m8").css("display","none");
		
	})
	
	$("#v3").click(function(){
		$(".m1").css("display","none");
		$(".m2").css("display","none");
		$(".m3").css("display","block");
		$(".m4").css("display","none");
		$(".m5").css("display","none");
		$(".m6").css("display","none");
		$(".m7").css("display","none");
		$(".m8").css("display","none");
		
	})
	
	$("#v4").click(function(){
		$(".m1").css("display","none");
		$(".m2").css("display","none");
		$(".m3").css("display","none");
		$(".m4").css("display","block");
		$(".m5").css("display","none");
		$(".m6").css("display","none");
		$(".m7").css("display","none");
		$(".m8").css("display","none");
		
	})
	
	$("#v5").click(function(){
		$(".m1").css("display","none");
		$(".m2").css("display","none");
		$(".m3").css("display","none");
		$(".m4").css("display","none");
		$(".m5").css("display","block");
		$(".m6").css("display","none");
		$(".m7").css("display","none");
		$(".m8").css("display","none");
		
	})
	
	$("#v6").click(function(){
		$(".m1").css("display","none");
		$(".m2").css("display","none");
		$(".m3").css("display","none");
		$(".m4").css("display","none");
		$(".m5").css("display","none");
		$(".m6").css("display","block");
		$(".m7").css("display","none");
		$(".m8").css("display","none");
		
	})
	
	$("#v7").click(function(){
		$(".m1").css("display","none");
		$(".m2").css("display","none");
		$(".m3").css("display","none");
		$(".m4").css("display","none");
		$(".m5").css("display","none");
		$(".m6").css("display","none");
		$(".m7").css("display","block");
		$(".m8").css("display","none");
		
	})
	
	$("#v8").click(function(){
		$(".m1").css("display","none");
		$(".m2").css("display","none");
		$(".m3").css("display","none");
		$(".m4").css("display","none");
		$(".m5").css("display","none");
		$(".m6").css("display","none");
		$(".m7").css("display","none");
		$(".m8").css("display","block");
		
	})
	
	$("#btn1").click(function(){
		event.preventDefault;
		$(".s").css("display","block");
		$(".k").css("display","none");
	})
	
	$("#btn2").click(function(){
		event.preventDefault;
		$(".s").css("display","none");
		$(".k").css("display","block");
	})
	
	
	
		$(".date-area").on("click","button",function(){
			
			var date = $(this).attr("date-data");
			
			var str1=""; var str2=""; var str3="";
			var str4=""; var str5=""; var str6="";
			var str7=""; var str8=""; var str9="";
			
				$("#k-1").html(str1);
				$("#k-2").html(str2);
				$("#k-3").html(str3);
				$("#h-1").html(str4);
				$("#h-2").html(str5);
				$("#h-3").html(str6); 
				$("#i-1").html(str7);          				
				$("#i-2").html(str8); 
				$("#i-3").html(str9); 
				
			$.getJSON("${pageContext.request.contextPath}/reserve/getTime/"+date.substring(8,date.length),
        				function(data){        				
        				console.log(data);
        			
        			
        				for(var i=0; i<5; i++){
	        				str1+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
	        					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
								"play-seq='1'>"+
								"<div class='td-ab'>"+
									"<div class='txt-center'>"+
										"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
											"<div class='ico-box'>"+
												"<i class='iconset ico-off'></i>"+
											"</div>"+
											"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
											"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
											"<div class='play-time'>"+
												"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
												"<p>"+(i+1)+"회차</p>"+
											"</div>"+
										"</a>"+
									"</div>"+
								"</div>"+
							"</td>"
        				}
        				
        				
        				
        				for(var i=5; i<9; i++){
	        				str2+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
	        					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
								"play-seq='1'>"+
								"<div class='td-ab'>"+
									"<div class='txt-center'>"+
										"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
											"<div class='ico-box'>"+
												"<i class='iconset ico-off'></i>"+
											"</div>"+
											"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
											"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
											"<div class='play-time'>"+
												"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
												"<p>"+(i+1-5)+"회차</p>"+
											"</div>"+
										"</a>"+
									"</div>"+
								"</div>"+
							"</td>"
        				}
        			
        				
        				for(var i=9; i<15; i++){
	        				str3+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
	        					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
								"play-seq='1'>"+
								"<div class='td-ab'>"+
									"<div class='txt-center'>"+
										"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
											"<div class='ico-box'>"+
												"<i class='iconset ico-off'></i>"+
											"</div>"+
											"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
											"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
											"<div class='play-time'>"+
												"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
												"<p>"+(i+1-9)+"회차</p>"+
											"</div>"+
										"</a>"+
									"</div>"+
								"</div>"+
							"</td>"
        				}
        				
        				
        				
        				for(var i=15; i<20; i++){
	        				str4+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
	        					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
								"play-seq='1'>"+
								"<div class='td-ab'>"+
									"<div class='txt-center'>"+
										"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
											"<div class='ico-box'>"+
												"<i class='iconset ico-off'></i>"+
											"</div>"+
											"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
											"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
											"<div class='play-time'>"+
												"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
												"<p>"+(i+1-15)+"회차</p>"+
											"</div>"+
										"</a>"+
									"</div>"+
								"</div>"+
							"</td>"
        				}
        				
        				
        				for(var i=20; i<24; i++){
	        				str5+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
	        					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
								"play-seq='1'>"+
								"<div class='td-ab'>"+
									"<div class='txt-center'>"+
										"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
											"<div class='ico-box'>"+
												"<i class='iconset ico-off'></i>"+
											"</div>"+
											"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
											"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
											"<div class='play-time'>"+
												"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
												"<p>"+(i+1-20)+"회차</p>"+
											"</div>"+
										"</a>"+
									"</div>"+
								"</div>"+
							"</td>"
        				}
        				
        				
        				

        				 for(var i=24; i<30; i++){
	        				str6+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
	        					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
								"play-seq='1'>"+
								"<div class='td-ab'>"+
									"<div class='txt-center'>"+
										"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
											"<div class='ico-box'>"+
												"<i class='iconset ico-off'></i>"+
											"</div>"+
											"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
											"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
											"<div class='play-time'>"+
												"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
												"<p>"+(i+1-24)+"회차</p>"+
											"</div>"+
										"</a>"+
									"</div>"+
								"</div>"+
							"</td>"
        				}
        				
        				
        				
        				
        				
        				 for(var i=30; i<36; i++){
 	        				str7+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
 	        					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
 								"play-seq='1'>"+
 								"<div class='td-ab'>"+
 									"<div class='txt-center'>"+
 										"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
 											"<div class='ico-box'>"+
 												"<i class='iconset ico-off'></i>"+
 											"</div>"+
 											"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
 											"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
 											"<div class='play-time'>"+
 												"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
 												"<p>"+(i+1-30)+"회차</p>"+
 											"</div>"+
 										"</a>"+
 									"</div>"+
 								"</div>"+
 							"</td>"
         				}
         				
        				
         				
         				 for(var i=36; i<42; i++){
 	        				str8+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
 	        					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
 								"play-seq='1'>"+
 								"<div class='td-ab'>"+
 									"<div class='txt-center'>"+
 										"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
 											"<div class='ico-box'>"+
 												"<i class='iconset ico-off'></i>"+
 											"</div>"+
 											"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
 											"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
 											"<div class='play-time'>"+
 												"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
 												"<p>"+(i+1-36)+"회차</p>"+
 											"</div>"+
 										"</a>"+
 									"</div>"+
 								"</div>"+
 							"</td>"
         				}
         				
         			
         				
         				
         				for(var i=42; i<48; i++){
 	        				str9+="<td class='m"+data[i].movie_code+"' brch-no='1372' play-schdl-no='2007291372069'"+
 	        					"rpst-movie-no='20034200' theab-no='02' play-de='20200729'"+        					
 								"play-seq='1'>"+
 								"<div class='td-ab'>"+
 									"<div class='txt-center'>"+
 										"<a href='${pageContext.request.contextPath}/reserve/seatReserve?timetable_number="+data[i].timetable_number+"&movie_code="+data[i].movie_code+"' title='영화예매하기'>"+
 											"<div class='ico-box'>"+
 												"<i class='iconset ico-off'></i>"+
 											"</div>"+
 											"<p class='time'>"+timestamp(data[i].timetable_start)+"</p>"+
 											"<p class='chair'>"+data[i].timetable_totalseat+"석</p>"+
 											"<div class='play-time'>"+
 												"<p>"+timestamp(data[i].timetable_start)+"~"+timestamp(data[i].timetable_end)+"</p>"+
 												"<p>"+(i+1-42)+"회차</p>"+
 											"</div>"+
 										"</a>"+
 									"</div>"+
 								"</div>"+
 							"</td>"
         				}         				
			
         				$("#k-1").html(str1);
          				$("#k-2").html(str2);
          				$("#k-3").html(str3);
          				$("#h-1").html(str4);
          				$("#h-2").html(str5);
         				$("#h-3").html(str6); 
         				$("#i-1").html(str7);          				
         				$("#i-2").html(str8); 
         				$("#i-3").html(str9); 
        				
			})
			
			
		})
	
	</script>
</body>

</html>
