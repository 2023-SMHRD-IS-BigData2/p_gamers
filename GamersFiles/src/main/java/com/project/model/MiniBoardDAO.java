package com.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.project.database.SqlSessionManager;

public class MiniBoardDAO {
	// 세션 생성해 줄 Factory 생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// connection, close, ... sql문 실행
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	// 데이터 생성
	public int insertMBoard(MiniBoardDTO dto) {

		int cnt = 0;

		try {
			cnt = sqlSession.insert("com.project.database.MiniBoardMapper.insertMBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;
	}

	// 데이터 리스트
	public List<MiniBoardDTO> MBoardList(String g_name) {
		List<MiniBoardDTO> mboard = null;
		try {
			mboard = sqlSession.selectList("com.project.database.MiniBoardMapper.MBoardList", g_name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return mboard;
	}

	public int DeleteMBoard(String g_name) {
		int cnt = 0;

		try {
			cnt = sqlSession.delete("com.project.database.MiniBoardMapper.DeleteMBoard", g_name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;
	}
}
