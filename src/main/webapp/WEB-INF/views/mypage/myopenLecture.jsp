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
}

.calendar {
	display: flex;
	flex-direction: column;
	align-items: center;
	 margin: 20px; 
	 margin-bottom: 150px;
}

.calendar-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 1200px;
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
	width: 1200px;
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

.schedule-item a {
	color: #fff;
	text-decoration: none;
}

.schedule-item a:hover {
	text-decoration: underline;
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
		<label for="lectureName">강의명:</label> <input type="text"
			id="lectureName" placeholder="강의명을 입력하세요"> <label
			for="lectureContent">강의내용:</label>
		<textarea id="lectureContent" rows="4" placeholder="강의내용을 입력하세요"></textarea>

		<label for="lectureDate">선택날짜</label> 
		<input type="date"
			id="lectureDate" readonly> 
		<label for="lectureTime">시간 선택:</label>
		<div style="display: flex; gap: 5px;">
			<input type="time" id="lectureTime">
			 <select id="timePeriod">
				<option value="AM">AM</option>
				<option value="PM">PM</option>
			</select>
		</div>

		<label for="lectureVideo">강의이미지 업로드:</label> 
		<input type="file" name="lectureImage" id="lectureImage">

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
        Object.assign(schedules, fetchedSchedules);

        for (let i = 0; i < firstDayOfMonth; i++) {
            const emptyCell = document.createElement('div');
            calendarDates.appendChild(emptyCell);
        }
        


        for (let i = 1; i <= daysInMonth; i++) {
            const dayCell = document.createElement('div');
            dayCell.textContent = i;
            dayCell.classList.add('day');
            
            let dateKey ='';
			
            if(i<10){
            	dateKey = `\${year}-0\${month + 1}-0\${i}`;
            }else{
            	dateKey = `\${year}-0\${month + 1}-\${i}`;
            }
            if (schedules[dateKey]) {
                schedules[dateKey].forEach(schedule => {
                    const scheduleItem = document.createElement('div');
                    scheduleItem.classList.add('schedule-item');
                    scheduleItem.innerHTML = `<a href="${pageContext.request.contextPath}/lecture/myclassDetail.do?id=\${schedule.lectureNo}" target="_blank">\${schedule.name} (\${schedule.time})</a>`;
                    dayCell.appendChild(scheduleItem);
                });
            }

            dayCell.addEventListener('click', () => {
                document.querySelectorAll('.day').forEach(day => day.classList.remove('selected'));
                dayCell.classList.add('selected');

                renderSchedule(dateKey);
                
                 // 강의 입력 필드 초기화
                document.getElementById('lectureName').value = '';
                document.getElementById('lectureContent').value = '';
                document.getElementById('lectureDate').value = '';
                document.getElementById('lectureTime').value = '';
                document.getElementById('timePeriod').value = 'AM'; 
                
                
                // 클릭한 날짜를 날짜 입력 필드에 설정
                const year = date.getFullYear();
                const month = String(date.getMonth() + 1).padStart(2, '0'); // 0부터 시작하므로 1을 더함
                const day = String(i).padStart(2, '0'); // 클릭한 날짜
                document.getElementById('lectureDate').value = `\${year}-\${month}-\${day}`;

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
                li.innerHTML = `<a href="${pageContext.request.contextPath}/mypage/addLectureDetail.do?id=\${schedule.lectureNo}" target="_blank">\${schedule.name} (\${schedule.time})</a>`;
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

        saveLecture.addEventListener('click', async () => {
        const lectureName = document.getElementById('lectureName').value;
        const lectureContent = document.getElementById('lectureContent').value;
        const lectureDate = document.getElementById('lectureDate').value;
        const lectureTime = document.getElementById('lectureTime').value;
        const lectureImage = document.querySelector("input[name='lectureImage']")
		
        
        if (!lectureDate || !lectureTime) {
            alert('날짜와 시간을 선택해주세요.');
            return;
        }

        const timePeriod = document.getElementById('timePeriod').value; // AM or PM
	
        const lectureData = {
            name: lectureName,
            content: lectureContent,
            date: lectureDate,
            time: `\${lectureTime} \${timePeriod}` // Combine time and period
        };
        

        // 강의 등록 제한 확인
        const dateKey = `\${lectureDate}`;
        if (!schedules[dateKey]) {
            schedules[dateKey] = []; // 날짜에 스케줄이 없는 경우 초기화
        }

        const maxLecturesPerDay = 3; // 하루에 등록 가능한 최대 강의 수
        if (schedules[dateKey].length >= maxLecturesPerDay) {
            alert(`한 날짜에는 최대 \${maxLecturesPerDay}개의 강의만 등록할 수 있습니다.`);
            return;
        }
        let formData = new FormData();
        
        
        formData.append("name", lectureName);
        formData.append("content", lectureContent);
        formData.append("date", lectureDate);
        formData.append("time", lectureTime+" "+timePeriod);
        formData.append("lectureImage", lectureImage.files[0]);
        
        xx
        
        try {
            const response = await fetch('${pageContext.request.contextPath}/mypage/myopenLectureAdd.do', {
                method: 'POST',
                body: formData
            });

           
                alert('강의가 저장되었습니다!');
                renderCalendar();
                popup.style.display = 'none';
                popupOverlay.style.display = 'none';

        } catch (error) {
            console.error('Error saving lecture:', error);
            alert('강의 저장 중 오류가 발생했습니다.');
        }
        });

        renderCalendar();
        </script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
