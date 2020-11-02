package com.kh.libreria.member.model.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int checkPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.checkPwd", m);
	}

	public int leaveMember(SqlSessionTemplate sqlSession, int no_leave) {
		return sqlSession.update("memberMapper.leaveMember", no_leave);
	}

	public int updateLoginDate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateLoginDate", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}

}
