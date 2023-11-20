package com.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.project.database.SqlSessionManager;

public class CalendarDAO {

	// 세션 생성해 줄 Factory 생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// connection, close, ... sql문 실행
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	// 데이터 생성
	public int insertCalendar(CalendarDTO adto) {
		
		int cnt = 0;

		try {
			cnt = sqlSession.insert("com.project.database.CalendarMapper.insertCalendar", adto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;
	}

	// 데이터 조회
	public CalendarDTO selectCalendar(CalendarDTO adto) {
		CalendarDTO select = null;
		try {
			select = sqlSession.selectOne("com.project.database.CalendarMapper.selectCalendar", adto);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return select;

	}

	// 데이터 중복 체크
	public boolean calendarCheck(String inputA) {
		boolean isCheck = false;
		try {
			isCheck = sqlSession.selectOne("com.project.database.CalendarMapper.emailCheck", inputA);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return isCheck; // true or false

	}

	// 데이터 수정
	public int updateCalendar(CalendarDTO adto) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.project.database.CalendarMapper.updateGroup", adto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 데이터 리스트
	public List<CalendarDTO> calendarList() {
		List<CalendarDTO> calendars = null;
		try {
			calendars = sqlSession.selectList("com.project.database.CalendarMapper.calendarList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return calendars;
	}

	// 데이터 삭제
	public int deleteCalendar(int a_num) {
		int cnt = 0;
		try {
			cnt = sqlSession.delete("com.project.database.CalendarMapper.deleteCalendar", a_num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

}
