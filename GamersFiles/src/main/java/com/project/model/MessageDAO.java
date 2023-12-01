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

	// 
	public int insertMessage(MessageDTO vo) {
		int cnt = 0;
		// 메시지 등록
		try {
			cnt = sqlSession.insert("com.project.database.MessageMapper.insertMessage", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 본인에게 온 모든 메시지를 가져오는 메소드
	public List<MessageDTO> showMessage(String e_recipient) {
		List<MessageDTO> m_list = sqlSession.selectList("com.project.database.MessageMapper.showMessage", e_recipient);
		sqlSession.close();
		return m_list;

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
	// 메시지 상세 내용을 확인하는 메소드
	public MessageDTO detailMessage(int E_num) {
		MessageDTO message = null;
		message = sqlSession.selectOne("com.project.database.MessageMapper.detailMessage", E_num);		
		return message;
	}



}
