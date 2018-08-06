package com.test.ex;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Inject
	SqlSession sqlSession;

	@Override
	public void insert(MemberDTO data) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String selectMember(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO LoginMember(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO loginProcess(MemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.test.ex.MemberDAO.loginProcess", dto);
	}

	@Override
	public ArrayList<MemberDTO> memberSelect() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO selectMemberOne(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(String id) {
		// TODO Auto-generated method stub
		
	}

}
