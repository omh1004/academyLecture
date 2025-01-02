<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule Calendar</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #2c2c2e;
            color: #ffffff;
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
            background-color: #444;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .calendar-header button:hover {
            background-color: #555;
        }
        .calendar-days {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            width: 800px;
            text-align: center;
            gap: 10px;
        }
        .calendar-days div {
            color: #888;
        }
        .day {
            border: 1px solid #444;
            padding: 10px;
            cursor: pointer;
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            background-color: #3a3a3c;
            border-radius: 8px;
            overflow: hidden;
        }
        .day:hover {
            background-color: #4a4a4c;
        }
        .day.selected {
            background-color: #636366;
        }
        .schedule-item {
            font-size: 12px;
            color: #fff;
            margin-top: 5px;
            background-color: #007aff;
            padding: 5px;
            border-radius: 3px;
            width: 100%;
            text-align: center;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #1c1c1e;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.7);
            z-index: 1000;
            width: 400px;
            border-radius: 8px;
        }
        .popup-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 999;
        }
        .popup label {
            display: block;
            margin-top: 10px;
            color: #fff;
        }
        .popup input, .popup textarea {
            width: 100%;
            margin-top: 5px;
            padding: 5px;
            background-color: #2c2c2e;
            color: #fff;
            border: 1px solid #444;
            border-radius: 4px;
        }
        .popup button {
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #007aff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .popup button:hover {
            background-color: #005bb5;
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
    <h2 style="color: #fff;">강의 일정</h2>
    <div id="scheduleList">
        <ul></ul>
    </div>
    <h3 style="color: #fff;">새 강의 추가</h3>
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
    const scheduleList = document.querySelector('#scheduleList ul');

    let date = new Date();
    const schedules = {}; // To store schedules for each date

    async function fetchSchedules(year, month) {

    	
        try {
            const response = await fetch(`${pageContext.request.contextPath}/mypage/myopenRenderSchedule.do?year=\${year}&month=\${month}`);
            if (!response.ok) {
                throw new Error('Failed to fetch schedules');
            }
            return await response.json();
        } catch (error) {
            console.error(error);
            return {};
        }
    }

    async function renderCalendar() {
        const year = date.getFullYear();
        const month = date.getMonth();

        currentMonth.textContent = date.toLocaleDateString('ko-KR', {
            month: 'long',
            year: 'numeric'
        });

        calendarDates.innerHTML = '';

        const firstDayOfMonth = new Date(year, month, 1).getDay();
        const daysInMonth = new Date(year, month + 1, 0).getDate();

        const fetchedSchedules = await fetchSchedules(year, month + 1);
        console.log("asdfasdfasd:::"+fetchedSchedules);
        
        Object.assign(schedules, fetchedSchedules);

        for (let i = 0; i < firstDayOfMonth; i++) {
            const emptyCell = document.createElement('div');
            calendarDates.appendChild(emptyCell);
        }

        for (let i = 1; i <= daysInMonth; i++) {
            const dayCell = document.createElement('div');
            dayCell.textContent = i;
            dayCell.classList.add('day');

            const dateKey = `\${year}-0\${month + 1}-0\${i}`;
            if (schedules[dateKey]) {
                schedules[dateKey].forEach(schedule => {
                    const scheduleItem = document.createElement('div');
                    scheduleItem.classList.add('schedule-item');
  					
                    scheduleItem.textContent = `\${schedule.className} (\${schedule.openDate})`;
                    dayCell.appendChild(scheduleItem);
                });
            }

            dayCell.addEventListener('click', () => {
                document.querySelectorAll('.day').forEach(day => day.classList.remove('selected'));
                dayCell.classList.add('selected');

                renderSchedule(dateKey);

                popup.style.display = 'block';
                popupOverlay.style.display = 'block';
            });

            calendarDates.appendChild(dayCell);
        }
    }

    function renderSchedule(dateKey) {
        scheduleList.innerHTML = '';
        if (schedules[dateKey]) {
            schedules[dateKey].forEach(schedule => {
                const li = document.createElement('li');
                li.textContent = schedule.name;
                scheduleList.appendChild(li);
            });
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

        const selectedDate = document.querySelector('.day.selected');
        if (!selectedDate) {
            alert('날짜를 선택해주세요.');
            return;
        }

        const dateKey = `${date.getFullYear()}-${date.getMonth() + 1}-${selectedDate.textContent}`;
        if (!schedules[dateKey]) {
            schedules[dateKey] = [];
        }

        schedules[dateKey].push({
            name: lectureName,
            time: "시간 미정", // Placeholder for now
            content: lectureContent,
            video: lectureVideo
        });

        renderCalendar();

        alert('강의가 저장되었습니다!');
        popup.style.display = 'none';
        popupOverlay.style.display = 'none';
    });

    renderCalendar();
</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
