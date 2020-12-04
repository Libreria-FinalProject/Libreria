package com.kh.libreria.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.libreria.board.model.exception.BoardException;
import com.kh.libreria.board.service.QNAService;
import com.kh.libreria.board.vo.Board;
import com.kh.libreria.board.vo.Reply;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.common.Pagination;
import com.kh.libreria.image.model.vo.Image;

@Controller
public class QNAController {
	
	@Autowired
	private QNAService qnaService;
	
	@RequestMapping("QNAList.bd")
	public ModelAndView QNAList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {	
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = qnaService.getListCount(2);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> qnaList = qnaService.selectList(pi,2);
		ArrayList<Reply> replyList = qnaService.getReplyCount(pi,2);
		System.out.println(replyList);
		mv.addObject("qnaList", qnaList);
		mv.addObject("replyList", replyList);
		mv.addObject("pi", pi);
		mv.setViewName("QNAlist");

		return mv;
	}
	
	@RequestMapping("QNASelect.bd")
	public ModelAndView QNASelect(@RequestParam("bo_no") int bo_no, ModelAndView mv) {
		Board qna = qnaService.selectBoard(bo_no);
		if(qna != null ) {
			int result = qnaService.updateBoardCount(bo_no);
			if(result>0) {
				Image img = qnaService.selectImage(bo_no);
			    ArrayList<Reply> replyList = qnaService.selectReplyList(bo_no); 
				mv.addObject("img", img)
				.addObject("qna", qna)
				.addObject("replyList", replyList)
				.setViewName("QNAview");
			}
		} else {
			throw new BoardException("QNA 상세페이지 접속에 실패 하였습니다.");
		}
		return mv;
	}	
	
	@RequestMapping("QNAWriteForm.bd")
	public String QNAWriteForm(HttpServletRequest request) {
		
		return "QNAwrite";
	}

	
	@RequestMapping("QNAWrite.bd")
	public String QNAWrite(Board b, Image i ,@RequestParam("uploadFile") MultipartFile uploadFile, 
			HttpServletRequest request) throws IOException {
		
		if(!uploadFile.getOriginalFilename().equals("")) {
			// savaFile() : 파일을 저장할 경로 지정
			String renameFileName = saveFile(uploadFile, request);
			if(renameFileName!=null) {
				i.setOrigin_name(uploadFile.getOriginalFilename());  // 원본 파일명
				i.setChange_name(renameFileName);  // 새로 생성한 파일명
			}
		}
		int result  = qnaService.insertBoard(b);
	
		if(result > 0) {  //  board insert성공 
			if(i.getOrigin_name()==null) {   // 첨부파일 없을 때
				return "redirect:QNAList.bd"; 
			}else {							// 첨부파일 있을 때
				int result2 = qnaService.insertImage(i);
				if(result2 > 0) {
					int result3 = qnaService.insertBoardImg();
					if(result3 > 0 ) {
						return "redirect:QNAList.bd";
					}else {
						throw new BoardException("게시글 작성에 실패하였습니다.");
					}
				}else {
					throw new BoardException("게시글 작성에 실패하였습니다.");
				}
			}
		}else {
			throw new BoardException("게시글 작성에 실패하였습니다.");
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch(Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	@RequestMapping("QNAUpdateForm.bd")
	public ModelAndView QNAUpdateForm(@RequestParam("bo_no") int bo_no, ModelAndView mv) {
		Board qna = qnaService.selectBoard(bo_no);
		Image img = qnaService.selectImage(bo_no);
		mv.addObject("qna", qna)
		.addObject("img", img)
		.setViewName("QNAupdate");
		return mv;
	}
	
	@RequestMapping("QNAUpdate.bd")
	public String QNAUpdate(Board b, Image i, @RequestParam("uploadFile") MultipartFile uploadFile,
			@RequestParam("delim_file") int delim_file, HttpServletRequest request) {
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile, request);
			if(renameFileName != null) {
				i.setOrigin_name(uploadFile.getOriginalFilename());  // DB에 반영시킬 원본파일명
				i.setChange_name(renameFileName); // DB에 반영시킬 새로 생성할 파일명
			}
		}
		
		int result = qnaService.updateBoard(b); // 일단 Board테이블을 update
		
		if(result>0) { // Board테이블 수정 성공시
			int result2= 0;
			if(delim_file == 1) { // Image테이블 update
				int img_no = qnaService.selectImageNo(b.getBo_no());  // 수정할 img_no를 받아온다
				i.setImg_no(img_no);
				result2 = qnaService.updateImage(i); // 파일명 update
			}else if(delim_file==2){  //Image테이블 insert
				result2 = qnaService.insertImage(i);
				int result3 = qnaService.insertBoardImg2(b.getBo_no());
			}else if(delim_file==-1) {  // Image테이블 delete
				int img_no = qnaService.selectImageNo(b.getBo_no());
				result2 = qnaService.deleteImage(img_no);
			}else {
				return "redirect:QNASelect.bd?bo_no="+b.getBo_no();
			}
			System.out.println(result2);
			if(result2>0) {
				return "redirect:QNASelect.bd?bo_no="+b.getBo_no();
			}else {
				throw new BoardException("게시글 수정에 실패하였습니다.\n다시 시도해주세요.");
			}
		}else {
			throw new BoardException("게시글 수정에 실패하였습니다.\n다시 시도해주세요.");
		}
	}
	
	@RequestMapping("insertReply.bd")
	public void insertReply(Reply reply, HttpServletResponse response) throws IOException {
		int result = qnaService.insertReply(reply);
		if(result>0) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
			
		}
		
	}
	
	@RequestMapping("deleteReply.bd")
	public void deleteReply(@RequestParam("reply_no") int reply_no,HttpServletResponse response) throws IOException {
		int result = qnaService.deleteReply(reply_no);
		if(result>0) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}
		
	}
	

	
	@RequestMapping("centermain.bn")
	public String Centermain() {
		
		return "centermain";
	}
	
	
	
	
}

