package com.kh.libreria.admin.model.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.libreria.common.PageInfo;
import com.kh.libreria.member.model.vo.Member;

@Repository("adminDAO")
public class AdminDAO {

	public ArrayList<Member> getRestMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.getRestMemberList", null, rowBounds);
	}

	public int getRestMemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.getRestMemberListCount");
	}

}
