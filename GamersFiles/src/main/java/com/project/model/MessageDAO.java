package com.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.project.database.SqlSessionManager;

public class MessageDAO {

	// 세션 생성해 줄 Factory 생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// connection, close, ... sql문 실행
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	// 데이터 생성
	public int insertMessage(MessageDTO vo) {
		int cnt = 0;

		try {
			cnt = sqlSession.insert("com.project.database.MessageMapper.insertMessage", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 데이터 조회
	public List<MessageDTO> showMessage(String g_nick) {
		List<MessageDTO> m_list = sqlSession.selectOne("com.project.database.MessageMapper.showMessage", g_nick);
		sqlSession.close();
		return m_list;

	}

	// 데이터 중복 체크
	public boolean messageCheck(String inputE) {
		boolean isCheck = false;
		try {
			isCheck = sqlSession.selectOne("com.project.database.MessageMapper.insertMessage", inputE);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return isCheck; // true or false

	}

	// 데이터 수정
	public int updateMessage(MessageDTO edto) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.project.database.MessageMapper.insertMessage", edto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 데이터 리스트
	public List<MessageDTO> messageList() {
		List<MessageDTO> messages = null;
		try {
			messages = sqlSession.selectList("com.project.database.MessageMapper.insertMessage");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return messages;
	}

	// 데이터 삭제
	public int deleteMessage(int e_num) {
		int cnt = 0;
		try {
			cnt = sqlSession.delete("com.project.database.MessageMapper.insertMessage", e_num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

}
