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

<!-- �� -->
<script type="text/javascript">
	$(document).ready(function(){	
		$(".big1").show(); // ���� ����
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
			$('#calendar').fullCalendar('addEventSource', {title:'�����߰���',start : '2019-05-11',end : '2019-05-15'});
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
			$(".big1").toggle(); // ȭ�鿡 ���
			$(".network").toggle();  // ȭ�鿡 ����
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

<!-- Ķ���� -->
 <script>
 
 document.addEventListener('DOMContentLoaded', function() {
	 var initialLocaleCode = 'ko'; 
	 var localeSelectorEl = document.getElementById('locale-selector');
	 var calendarEl = document.getElementById('calendar');
	 var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list', 'googleCalendar' ],
	    
	    // ���� Ŭ���� �̺�Ʈ ����
	    eventClick: function(info) {
	        var eventObj = info.event;

	        if (eventObj.url) { //url�� ������ �̺�Ʈ�� ���
	          alert(
	            'Clicked ' + eventObj.title + '.\n' +
	            'Will open ' + eventObj.url + ' in a new tab'
	          );

	          window.open(eventObj.url);

	          info.jsEvent.preventDefault(); // prevents browser from following link in current tab.
	        } else { // ������ ��ϵ� �̺�Ʈ�� ���
	          alert('Clicked ' + eventObj.title);
	        }
	      },
	      
		    timeZone: 'UTC', // ��ġ�� ������ �������� �����ϱ� ���� ����.
		    eventLimit: true, // �� ���� ������ ���� ���� ����.
		    
	    selectable: true, //����Ʈ ����.
	    header: {
	        left: 'title',
			center: '',
			right: 'today prev,next'
	    },
	    
	    locale: initialLocaleCode,
	    googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE', //���� ������ ����� ���� key��

	    // �츮���� ������ ����
	    eventSources: [
            {
                googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                color: '#8C8C8C',
            },
         ],
       //�����߰�
         events:[ 
             {
                 title: '���ο�����',
                 start: '2019-05-01',
                 end: '2019-05-04',
                 color : '#86E57F'
               }
         ],
         
		//����Ʈ ���
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
	<a href="#" id="big1button" style="color: #86E57F">�����Ͱ���</a>
</span>
<span class="buttons">
	<a href="#" id="networkbutton" style="color: #B2EBF4">��Ʈ��ũ</a>
</span>
<span class="buttons">
	<a href="#" id="smartbutton" style="color: #B5B2FF">����Ʈ��</a>
</span>
<span class="buttons">
	<a href="#" id="big2button" style="color: #FFCC33">������</a>
</span>
<span class="buttons">
	<a href="#" id="cbutton" style="color: #FFA7A7">c��</a>
</span>
<span class="buttons">
	<a href="#" id="gdbutton" style="color: #4641D9">GOODEE</a>
</span>
<span class="buttons">
	<a href="#" id="allbutton" style="color: #8C8C8C">��ü</a>
</span><br><br>
		

	<p class="big1" onChange="addEventSource">�����Ͱ��߹� ����
	</p>
	<p class="network">��Ʈ��ũ�� ����</p>
	<p class="smart">����Ʈ���� ����</p>
	<p class="big2">�����͹� ����</p>
	<p class="c">c�� �� ����</p>
	<p class="gd">���� ��ü ����</p>
	<p class="all">��� ����</p>

 <div id='calendar'></div>

  </body>
</html>