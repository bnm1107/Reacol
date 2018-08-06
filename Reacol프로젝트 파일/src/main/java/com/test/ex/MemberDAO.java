package com.test.ex;

import java.util.ArrayList;

public interface MemberDAO {
	public void insert(MemberDTO data);
	public String selectMember(String id);
	public MemberDTO LoginMember(String id);
	public MemberDTO loginProcess(MemberDTO dto);
	public ArrayList<MemberDTO> memberSelect();
	public MemberDTO selectMemberOne(String id);
	public void modifyMember(MemberDTO dto);
	public void deleteMember(String id);
}