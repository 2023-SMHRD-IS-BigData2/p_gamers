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

	// 공대 가입 승인시 해당 멤버 공대 소속 변경
	public int applyUpdateMember(ApplyRaidDTO dto) {
		int apply = 0;
		try {
			apply = sqlSession.update("com.project.database.ApplyMapper.applyUpdateMember", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return apply;
	}

	// 레이드 가입 승인시 레이드 가입 신청을 삭제
	public int applyDelete(ApplyRaidDTO dto) {
		int apply = 0;
		try {
			apply = sqlSession.delete("com.project.database.ApplyMapper.applyDelete", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return apply;
	}

	// 레이드 가입 승인시 승인한 상대 포지션에 맞게 모집현황 변경
	public int applyDiscount(ApplyRaidDTO dto) {
		int apply = 0;

		System.out.println(dto.getSend_pos());
		try {
			apply = sqlSession.update("com.project.database.ApplyMapper.applyDiscount", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return apply;
	}

	// 데이터 생성
	public int insertApply(ApplyDTO adto) {
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.project.database.ApplyMapper.insertApply", adto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

}
