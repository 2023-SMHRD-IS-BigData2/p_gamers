<%@page import="com.project.model.CalendarDAO"%>
<%@page import="com.project.model.CalendarDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src='./calendar_js/index.global.js'></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script>
//풀캘린더 부분
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      <% LocalDate date = LocalDate.now(); 
      	String g_name = (String)session.getAttribute("g_name");
      	List<CalendarDTO> list = new CalendarDAO().calendarList(g_name); 
      %>
      initialDate: '<%=date%>',
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      locale: 'ko', // 한국어 설정
      events: [
        //이 밑에서 일정 반복할 생각
       /*  {
          title: 'Conference',
          start: '2023-01-18',
          end: '2023-01-20'
        }, */
    	
  		<% for(CalendarDTO tmp : list){ %>
  			{
            title: '<%=tmp.getC_content() %>',
            start: '<%=tmp.getC_start() %>',
            end: '<%=tmp.getC_end() %>'
            },
  		
  		<% }%>
        
      ]
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 800px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>