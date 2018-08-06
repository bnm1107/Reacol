package com.test.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.test.ex.MemberDAO;
import com.test.ex.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;
	
	@Override
	public MemberDTO loginProcess(MemberDTO dto) {
		// TODO Auto-generated method stub
		return dao.loginProcess(dto);
	}

}
