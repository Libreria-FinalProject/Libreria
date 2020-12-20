package com.kh.libreria.member.model.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.libreria.book.model.vo.Book;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.member.model.DAO.MemberDAO;
import com.kh.libreria.member.model.vo.Card;
import com.kh.libreria.member.model.vo.Member;
import com.kh.libreria.member.model.vo.Money;

@Service("mService")
public class MemberSeriviceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	   
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public Member loginMember(Member m) {
		return mDAO.loginMember(sqlSession, m);
	}
	
	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int checkIdDup(String mem_email) {
		return mDAO.checkIdDup(sqlSession, mem_email);
	}
	
	@Override
	public int checkPwd(Member m) {
		return mDAO.checkPwd(sqlSession, m);
	}
	
	@Override
	public String checkPwd2(Member m) {
		return mDAO.checkPwd2(sqlSession, m);
	}

	@Override
	public int idCheck(String mem_email) {
		return mDAO.idCheck(sqlSession, mem_email);
	}
	@Override
	public int leaveMember(int no_leave) {
		return mDAO.leaveMember(sqlSession, no_leave);
	}


	@Override
	public int updateLoginDate(Member m) {
		return mDAO.updateLoginDate(sqlSession, m);
	}


	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	@Override
	public int getMoneyListCount(int mem_no) {
		return mDAO.getMoneyListCount(sqlSession, mem_no);
	}
	

	@Override
	public ArrayList<Money> confirmMoney(int mem_no, PageInfo pi) {
		return mDAO.confirmMoney(sqlSession, mem_no, pi);
	}


	@Override
	public Card getRegistedCard(int mem_no) {
		return mDAO.getRegistedCard(sqlSession, mem_no);
	}


	@Override
	public int changeCard(int mem_no) {
		return mDAO.changeCard(sqlSession, mem_no);
	}


	@Override
	public int newCard(Card card) {
		return mDAO.newCard(sqlSession, card);
	}


	@Override
	public int buyMoney(HashMap<String, String> charge_info) {
		return mDAO.buyMoney(sqlSession, charge_info);
	}


	@Override
	public int matchCardInfo(Card card) {
		return mDAO.matchCardInfo(sqlSession, card);
	}


	@Override
	public int updateMemberMoney(HashMap<String, String> charge_info) {
		return mDAO.updateMemberMoney(sqlSession , charge_info);
	}


	@Override
	public ArrayList<Book> getSellList(int mem_no, PageInfo pi) {
		return mDAO.getSellList(sqlSession, mem_no, pi);
	}


	@Override
	public int getSellListCount(int mem_no) {
		return mDAO.getSellListCount(sqlSession, mem_no);
	}

	@Override
	public ArrayList<Book> getBuyList(int mem_no, PageInfo pi) {
		return mDAO.getBuyList(sqlSession, mem_no, pi);
	}

	@Override
	public int getBuyListCount(int mem_no) {
		return mDAO.getBuyListCount(sqlSession, mem_no);
	}

	@Override
	public int checkEmail(String mem_email) {
		return mDAO.checkEmail(sqlSession, mem_email);
	}

	@Override
	public Member loginMemberWtihKakao(String kakaoEmail) {
		return mDAO.loginMemberWithKakao(sqlSession, kakaoEmail);
	}

	@Override
	public Member idSearch(String mem_email) {
		return mDAO.idSearch(sqlSession, mem_email);
	}
	@Override
	public String getMemberEmail(Member m) {
		return mDAO.getMemberEmail(sqlSession,m);
	}
	@Override
	public int getMemberEmailCnt(Member m) {
		return mDAO.getMemberEmailCnt(sqlSession,m);
	}
	@Override
	public ArrayList<Member> getMemberList(Member m) {
		return mDAO.getMemberList(sqlSession,m);
	}

	@Override
	public int findPwEmail(Member m) {
		return mDAO.findPwEmail(sqlSession, m);
	}

	@Override
	public int updatePw(Member m) {
		return mDAO.updatePw(sqlSession, m);
	}
	
	@Override
	public void find_pw(HttpServletResponse response, Member m) throws Exception {

		// 임시 비밀번호 생성
		// 알파벳 A~Z까지 의 랜덤실수에  
		//소문자를 사용하기위해 a의 아스키코드인 97을 더해준다.  a~z까지 
		String mem_pw = "";
		for (int i = 0; i < 12; i++) {
			mem_pw += (char) ((Math.random() * 26) + 97);
		}
		m.setMem_pw(mem_pw);
		
		// 비밀번호 변경 메일 발송
		send_mail(m);
		
		String encPwd = bcryptPasswordEncoder.encode(mem_pw);
		m.setMem_pw(encPwd);
		
		// 비밀번호 변경
		mDAO.updatePw(sqlSession, m);
		}
	
	@Override
	public void send_mail(Member m) throws Exception{
		// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "libreriafinal@naver.com";
			String hostSMTPpwd = "Libreriafinal";

		// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "libreriafinal@naver.com";
			String fromName = "Libreria";
			String subject = "이메일 발송 테스트";
			String msg = "";
			
			subject = "Libreria 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h2>LIBRERIA</h2>";
			msg += "<h3 style='color: blue;'>";
			msg += m.getMem_email() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += m.getMem_pw() + "</p></div>";
			
			//받는사람 e_mail 주소
			String mail = m.getMem_email(); //받는사람 email
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		}
	
	
	}
	
