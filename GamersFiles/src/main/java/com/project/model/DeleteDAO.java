package com.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.project.database.SqlSessionManager;

public class DeleteDAO {

	// 세션 생성해 줄 Factory 생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// connection, close, ... sql문 실행
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	// 데이터 생성
	public int insertGroup(GroupDTO gdto) {
		int cnt = 0;

		try {
			cnt = sqlSession.insert("com.project.database.MemberMapper.insertGroup", gdto);
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
			select = sqlSession.selectOne("com.project.database.MemberMapper.selectGroup", gdto);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return select;

	}

	// 데이터 리스트
	public List<GroupDTO> groupList() {
		List<GroupDTO> groups = null;
		try {
			groups = sqlSession.selectList("com.project.database.MemberMapper.groupList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return groups;
	}

	// 데이터 삭제
	public int deleteMember(String m_id) {
		int cnt = 0;
		try {
			cnt = sqlSession.delete("com.project.database.MemberMapper.deleteMember", m_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}
	
	public int deleteGroupinfo(String g_name) {
		int cnt = 0;
		try {
			cnt = sqlSession.delete("com.project.database.DeleteMapper.deleteGroupinfo", g_name);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}
	public int allDelelteMessage(String M_id) {
		int cnt = sqlSession.delete("com.project.database.MessageMapper.allDelelteMessage", M_id);
		sqlSession.close();
		System.out.println("들어옴?");
		return cnt;
	}


}
