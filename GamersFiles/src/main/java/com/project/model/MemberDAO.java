
package com.project.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.project.database.SqlSessionManager;

public class MemberDAO {
	// 세션 생성해 줄 Factory 생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// connection, close, ... sql문 실행
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	// 데이터 생성
	public int insertMember(MemberDTO mdto) {
		int cnt = 0;

		try {
			cnt = sqlSession.insert("com.project.database.MemberMapper.insertMember", mdto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;
	}

	// 데이터 조회
	public MemberDTO selectMember(MemberDTO mdto) {
		MemberDTO login = null;
		try {
			login = sqlSession.selectOne("com.project.database.MemberMapper.selectMember", mdto);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return login;
	}

	// 데이터 중복 체크
	public boolean memberCheck(String inputI) {
		boolean isCheck = false;
		try {
			isCheck = sqlSession.selectOne("com.project.database.MemberMapper.memberCheck", inputI);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return isCheck; // true or false

	}

	// 데이터 수정
	public int updateMember(MemberDTO mdto) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.project.database.MemberMapper.updateMember", mdto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 데이터 리스트
	public List<MemberDTO> memberList() {
		List<MemberDTO> members = null;
		try {
			members = sqlSession.selectList("com.project.database.MemberMapper.memberList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return members;
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

	// 데이터 리스트
	public List<MemberDTO> raidMemberList(String g_name) {
		List<MemberDTO> members = null;
		try {
			members = sqlSession.selectList("com.project.database.MemberMapper.raidMemberList", g_name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return members;
	}

	// 데이터 수정
	public int updateComent(ComentDTO dto) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.project.database.MemberMapper.updateComent", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 데이터 수정
	public int updateGroup(MemberDTO mdto) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.project.database.MemberMapper.updateGroup", mdto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	public int nullGroup(String m_id) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.project.database.MemberMapper.nullGroup", m_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 데이터 조회
	public int countGroup(String g_name) {
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne("com.project.database.MemberMapper.countGroup", g_name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}
	


}
