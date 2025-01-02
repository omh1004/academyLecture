<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule Calendar</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .calendar {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px;
        }
        .calendar-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 800px;
            margin-bottom: 20px;
        }
        .calendar-header button {
            padding: 10px 15px;
        }
        .calendar-days {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            width: 800px;
            text-align: center;
            gap: 10px;
        }
        .day {
            border: 1px solid #ccc;
            padding: 15px;
            cursor: pointer;
        }
        .day:hover {
            background-color: #f0f0f0;
        }
        .day.selected {
            background-color: #add8e6;
        }
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            width: 400px;
        }
        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        .popup label {
            display: block;
            margin-top: 10px;
        }
        .popup input, .popup textarea {
            width: 100%;
            margin-top: 5px;
            padding: 5px;
        }
        .popup button {
            margin-top: 10px;
            padding: 10px 20px;
        }
    </style>
</head>
<body>
<div class="calendar">
    <div class="calendar-header">
        <button id="prevMonth">&#9664;</button>
        <div id="currentMonth">January 2025</div>
        <button id="nextMonth">&#9654;</button>
    </div>
    <div class="calendar-days">
        <div>Sun</div>
        <div>Mon</div>
        <div>Tue</div>
        <div>Wed</div>
        <div>Thu</div>
        <div>Fri</div>
        <div>Sat</div>
    </div>
    <div id="calendarDates" class="calendar-days"></div>
</div>

<div class="popup-overlay" id="popupOverlay"></div>
<div class="popup" id="popup">
    <h2>강의 추가</h2>
    <label for="lectureName">강의명:</label>
    <input type="text" id="lectureName" placeholder="강의명을 입력하세요">

    <label for="lectureContent">강의내용:</label>
    <textarea id="lectureContent" rows="4" placeholder="강의내용을 입력하세요"></textarea>

    <label for="lectureVideo">동영상 업로드:</label>
    <input type="file" id="lectureVideo">

    <button id="saveLecture">저장</button>
    <button id="closePopup">닫기</button>
</div>

<script>
    const calendarDates = document.getElementById('calendarDates');
    const currentMonth = document.getElementById('currentMonth');
    const prevMonth = document.getElementById('prevMonth');
    const nextMonth = document.getElementById('nextMonth');
    const popup = document.getElementById('popup');
    const popupOverlay = document.getElementById('popupOverlay');
    const closePopup = document.getElementById('closePopup');
    const saveLecture = document.getElementById('saveLecture');

    let date = new Date();

    function renderCalendar() {
        const year = date.getFullYear();
        const month = date.getMonth();

        currentMonth.textContent = date.toLocaleDateString('ko-KR', {
            month: 'long',
            year: 'numeric'
        });

        calendarDates.innerHTML = '';

        const firstDayOfMonth = new Date(year, month, 1).getDay();
        const daysInMonth = new Date(year, month + 1, 0).getDate();

        for (let i = 0; i < firstDayOfMonth; i++) {
            const emptyCell = document.createElement('div');
            calendarDates.appendChild(emptyCell);
        }

        for (let i = 1; i <= daysInMonth; i++) {
            const dayCell = document.createElement('div');
            dayCell.textContent = i;
            dayCell.classList.add('day');

            dayCell.addEventListener('click', () => {
                document.querySelectorAll('.day').forEach(day => day.classList.remove('selected'));
                dayCell.classList.add('selected');

                popup.style.display = 'block';
                popupOverlay.style.display = 'block';
            });

            calendarDates.appendChild(dayCell);
        }
    }

    prevMonth.addEventListener('click', () => {
        date.setMonth(date.getMonth() - 1);
        renderCalendar();
    });

    nextMonth.addEventListener('click', () => {
        date.setMonth(date.getMonth() + 1);
        renderCalendar();
    });

    closePopup.addEventListener('click', () => {
        popup.style.display = 'none';
        popupOverlay.style.display = 'none';
    });

    saveLecture.addEventListener('click', () => {
        const lectureName = document.getElementById('lectureName').value;
        const lectureContent = document.getElementById('lectureContent').value;
        const lectureVideo = document.getElementById('lectureVideo').files[0];

        console.log('Lecture Saved:', { lectureName, lectureContent, lectureVideo });
        alert('강의가 저장되었습니다!');
        popup.style.display = 'none';
        popupOverlay.style.display = 'none';
    });

    renderCalendar();
</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
