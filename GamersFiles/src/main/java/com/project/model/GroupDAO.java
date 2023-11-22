package com.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.project.database.SqlSessionManager;

public class GroupDAO {
	// 세션 생성해 줄 Factory 생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// connection, close, ... sql문 실행
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	// 데이터 생성
	public int insertGroup(GroupDTO gdto) {
		int cnt = 0;

		try {
			cnt = sqlSession.insert("com.project.database.GroupMapper.insertGroup", gdto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;
	}

	// 데이터 조회
	public GroupDTO selectGroup(GroupDTO gdto) {
		GroupDTO select = null;
		try {
			select = sqlSession.selectOne("com.project.database.GroupMapper.selectGroup", gdto);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return select;

	}

	// 데이터 중복 체크
	public boolean groupCheck(String inputG) {
		boolean isCheck = false;
		try {
			isCheck = sqlSession.selectOne("com.project.database.GroupMapper.groupCheck", inputG);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return isCheck; // true or false

	}

	// 데이터 수정
	public int updateGroup(GroupDTO gdto) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.project.database.GroupMapper.updateGroup", gdto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 데이터 리스트
	public List<GroupDTO> groupList() {
		List<GroupDTO> groups = null;
		try {
			groups = sqlSession.selectList("com.project.database.GroupMapper.groupList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return groups;
	}

	// 데이터 리스트
	public List<GroupDTO> groupList2(String c_name) {
		List<GroupDTO> groups = null;
		try {
			groups = sqlSession.selectList("com.project.database.GroupMapper.groupList2", c_name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return groups;
	}

	// 데이터 삭제
	public int deleteGroup(String g_name) {
		int cnt = 0;
		try {
			cnt = sqlSession.delete("com.project.database.GroupMapper.deleteGroup", g_name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}
}
