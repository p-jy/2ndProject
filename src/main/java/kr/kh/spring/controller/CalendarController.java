package kr.kh.spring.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/calendar")
public class CalendarController {

    // FullCalendar에 표시할 전체 이벤트
    @GetMapping("/events")
    public List<Map<String, Object>> getEvents() {
        
        List<Map<String, Object>> events = null;
        
		return events;
    }

    // 날짜 클릭 시, 해당 날짜의 스케줄만 반환
    @GetMapping("/schedules")
    public List<Map<String, Object>> getSchedulesByDate(@RequestParam String date) {
        // 예제 데이터: 실제론 DB에서 해당 날짜로 쿼리해야 함
        List<Map<String, Object>> schedules = null;

        return schedules;
    }
}

