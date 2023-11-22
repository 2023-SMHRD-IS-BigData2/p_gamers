package com.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.project.database.SqlSessionManager;

public class JobDAO {
	// 세션 생성해 줄 Factory 생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// connection, close, ... sql문 실행
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	// 데이터 조회
	public String selectJob(String m_class) {
		String m_position = null;
		try {
			m_position = sqlSession.selectOne("com.project.database.JobMapper.selectJob", m_class);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return m_position;
	}

	// 데이터 리스트
	public List<JobDTO> jobList() {
		List<JobDTO> jobs = null;
		try {
			jobs = sqlSession.selectList("com.project.database.JobMapper.jobList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return jobs;
	}
}
