package com.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.project.database.SqlSessionManager;

public class ApplyDAO {

	// 세션 생성해 줄 Factory 생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// connection, close, ... sql문 실행
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	public List<ApplyDTO> applyList(String rcv_nick) {
		List<ApplyDTO> applys = null;
		try {
			applys = sqlSession.selectList("com.project.database.ApplyMapper.applyList", rcv_nick);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return applys;
	}
}
