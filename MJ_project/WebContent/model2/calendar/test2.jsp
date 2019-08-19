<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>WITH GOODEE</title>
<link rel="stylesheet" type="text/css" href="/MJ_project/fullcalendar/core/main.css" />
<link rel="stylesheet" type="text/css" href="/MJ_project/fullcalendar/daygrid/main.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://fullcalendar.io/releases/core/4.1.0/main.min.js"></script>
<script src="https://fullcalendar.io/releases/daygrid/4.1.0/main.min.js"></script>
<script src="https://fullcalendar.io/releases/timegrid/4.1.0/main.js"></script>
<script src="https://fullcalendar.io/releases/interaction/4.1.0/main.js"></script>
<script src="https://fullcalendar.io/releases/google-calendar/4.1.0/main.min.js"></script>
<script src="https://fullcalendar.io/releases/google-calendar/4.1.0/main.min.js"></script>

<!-- 탭 -->
<script type="text/javascript">
	$(document).ready(function(){	
		$(".big1").show(); // 내용 숨김
		$(".network").hide();
		$(".smart").hide();
		$(".big2").hide();
		$(".c").hide();
		$(".gd").show();
		$(".all").hide();
		$("a").hover(function() {
			$(this).addClass("rightselect");
			$(this).parent().addClass("leftselect");
		},function() {
			$(this).removeClass("rightselect");
			$(this).parent().removeClass("leftselect");
		})
		
		$("#big1button").click(function() {
			$('#calendar').fullCalendar('addEventSource', {title:'일정추가ㅜ',start : '2019-05-11',end : '2019-05-15'});
			$(".big1").toggle(); 
			$(this).parent().addClass("leftselect");
			$("#big1button").parent().removeClass("leftselect");
		})
		$("#networkbutton").click(function() {
			$(".network").toggle();
			$(this).parent().addClass("leftselect");
			$("#networkbutton").parent().removeClass("leftselect");
		})
		$("#smartbutton").click(function() {
			$(".smart").toggle();
			$(this).parent().addClass("leftselect");
			$("#smartbutton").parent().removeClass("leftselect");
		})
		$("#big2button").click(function() {
			$(".big2").toggle();
			$(this).parent().addClass("leftselect");
			$("#big2button").parent().removeClass("leftselect");
		})
		$("#cbutton").click(function() {
			$(".c").toggle();
			$(this).parent().addClass("leftselect");
			$("#cbutton").parent().removeClass("leftselect");
		})
		$("#gdbutton").click(function() {
			$(".gd").toggle();
			$(this).parent().addClass("leftselect");
			$("#gdbutton").parent().removeClass("leftselect");
		})
		$("#allbutton").click(function() {
			$(".big1").toggle(); // 화면에 출력
			$(".network").toggle();  // 화면에 숨김
			$(".smart").toggle();
			$(".big2").toggle();
			$(".c").toggle();
			$(".gd").show();
			$(this).parent().addClass("leftselect");
			$("#allbutton").parent().removeClass("leftselect");
		})
	})
</script>
<style type="text/css">
	.buttons {
		width : 120px;
		float : left;
		text-align: center;
		background-color: #ffffff;
	}
	a {
		display : block;
		padding : 3px;
		text-decoration: none;
		font-weight: bold;
		color : #ffffff;
	}

	.leftselect{
		text-align: center;
		background-color: #F6F6F6;
	}
</style>

<!-- 캘린더 -->
 <script>
 
 document.addEventListener('DOMContentLoaded', function() {
	 var initialLocaleCode = 'ko'; 
	 var localeSelectorEl = document.getElementById('locale-selector');
	 var calendarEl = document.getElementById('calendar');
	 var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list', 'googleCalendar' ],
	    
	    // 일정 클릭시 이벤트 설정
	    eventClick: function(info) {
	        var eventObj = info.event;

	        if (eventObj.url) { //url이 설정된 이벤트인 경우
	          alert(
	            'Clicked ' + eventObj.title + '.\n' +
	            'Will open ' + eventObj.url + ' in a new tab'
	          );

	          window.open(eventObj.url);

	          info.jsEvent.preventDefault(); // prevents browser from following link in current tab.
	        } else { // 일정만 등록된 이벤트인 경우
	          alert('Clicked ' + eventObj.title);
	        }
	      },
	      
		    timeZone: 'UTC', // 겹치는 일정을 보기좋게 정리하기 위해 설정.
		    eventLimit: true, // 더 많은 일정을 보기 위해 설정.
		    
	    selectable: true, //셀랙트 가능.
	    header: {
	        left: 'title',
			center: '',
			right: 'today prev,next'
	    },
	    
	    locale: initialLocaleCode,
	    googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE', //구글 공휴일 사용을 위한 key값

	    // 우리나라 공휴일 설정
	    eventSources: [
            {
                googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                color: '#8C8C8C',
            },
         ],
       //일정추가
         events:[ 
             {
                 title: '새로운일정',
                 start: '2019-05-01',
                 end: '2019-05-04',
                 color : '#86E57F'
               }
         ],
         
		//셀랙트 기능
	    select: function(info) {
	      	var op = "width=550, height=680, left=750, top=150";
		    open("addCalForm.do?s_date="+info.startStr+"&e_date="+info.endStr,"",op)
	    },
	  });

	  calendar.render();
	});

    </script>
  </head>
<body>
<span class="buttons">
	<a href="#" id="big1button" style="color: #86E57F">빅데이터개발</a>
</span>
<span class="buttons">
	<a href="#" id="networkbutton" style="color: #B2EBF4">네트워크</a>
</span>
<span class="buttons">
	<a href="#" id="smartbutton" style="color: #B5B2FF">스마트웹</a>
</span>
<span class="buttons">
	<a href="#" id="big2button" style="color: #FFCC33">빅데이터</a>
</span>
<span class="buttons">
	<a href="#" id="cbutton" style="color: #FFA7A7">c샵</a>
</span>
<span class="buttons">
	<a href="#" id="gdbutton" style="color: #4641D9">GOODEE</a>
</span>
<span class="buttons">
	<a href="#" id="allbutton" style="color: #8C8C8C">전체</a>
</span><br><br>
		

	<p class="big1" onChange="addEventSource">빅데이터개발반 일정
	</p>
	<p class="network">네트워크반 일정</p>
	<p class="smart">스마트웹반 일정</p>
	<p class="big2">빅데이터 일정</p>
	<p class="c">c샵 반 일정</p>
	<p class="gd">구디 전체 일정</p>
	<p class="all">모든 일정</p>

 <div id='calendar'></div>

  </body>
</html>
