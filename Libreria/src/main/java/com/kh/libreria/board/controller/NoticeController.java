package com.kh.libreria.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.libreria.board.model.exception.BoardException;
import com.kh.libreria.board.service.NoticeService;
import com.kh.libreria.board.vo.Board;
import com.kh.libreria.board.vo.Reply;
import com.kh.libreria.common.PageInfo;
import com.kh.libreria.common.Pagination;
import com.kh.libreria.image.model.vo.Image;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noService;

	@RequestMapping("NoticeList.bd")
	public ModelAndView NoticeList(@RequestParam(value="page", required=false, defaultValue = "1") Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = noService.getListCount(3);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = noService.selectList(pi,3);
		
		if(list != null) {
			mv.addObject("noticeList", list);
			mv.addObject("pi", pi);
			mv.setViewName("noticelist");
		} else {
			throw new BoardException("문의사항 목록 조회를 실패 하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("NoticeWriteForm.bd")
	public String NoticeWriteForm() {
		return "noticewrite";
	}
	
	@RequestMapping("NoticeWrite.bd")
	public String NoticeWrite(Board b, Image i ,@RequestParam("uploadFile") MultipartFile uploadFile, 
			HttpServletRequest request) throws IOException {
		
		if(!uploadFile.getOriginalFilename().equals("")) {
			// savaFile() : 파일을 저장할 경로 지정
			String renameFileName = saveFile(uploadFile, request);
			if(renameFileName!=null) {
				i.setOrigin_name(uploadFile.getOriginalFilename());  // 원본 파일명
				i.setChange_name(renameFileName);  // 새로 생성한 파일명
			}
		}
		int result  = noService.insertBoard(b);
	
		if(result > 0) {  //  board insert성공 
			if(i.getOrigin_name()==null) {   // 첨부파일 없을 때
				return "redirect:NoticeList.bd"; 
			}else {							// 첨부파일 있을 때
				int result2 = noService.insertImage(i);
				if(result2 > 0) {
					int result3 = noService.insertBoardImg();
					if(result3 > 0 ) {
						return "redirect:NoticeList.bd";
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
	
	@RequestMapping("NoticeSelect.bd")
	public ModelAndView NoticeSelect(@RequestParam("bo_no") int bo_no, ModelAndView mv) {
		Board notice = noService.selectBoard(bo_no);
		if(notice != null ) {
			int result = noService.updateBoardCount(bo_no);
			if(result>0) {
				Image img = noService.selectImage(bo_no);
				mv.addObject("img", img)
				.addObject("notice", notice)
				.setViewName("noticeview");
			}
		} else {
			throw new BoardException("QNA 상세페이지 접속에 실패 하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("NoticeUpdateForm.bd")
	public ModelAndView NoticeUpdateForm(@RequestParam("bo_no") int bo_no, ModelAndView mv) {
		Board notice = noService.selectBoard(bo_no);
		Image img = noService.selectImage(bo_no);
		mv.addObject("notice", notice)
		.addObject("img", img)
		.setViewName("noticeupdate");
		return mv;
	}
	
	@RequestMapping("NoticeUpdate.bd")
	public String NoticeUpdate(Board b, Image i, @RequestParam("uploadFile") MultipartFile uploadFile,
			@RequestParam("delim_file") int delim_file, HttpServletRequest request) {
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile, request);
			if(renameFileName != null) {
				i.setOrigin_name(uploadFile.getOriginalFilename());  // DB에 반영시킬 원본파일명
				i.setChange_name(renameFileName); // DB에 반영시킬 새로 생성할 파일명
			}
		}
		
		int result = noService.updateBoard(b); // 일단 Board테이블을 update
		
		if(result>0) { // Board테이블 수정 성공시
			int result2= 0;
			if(delim_file == 1) { // Image테이블 update
				int img_no = noService.selectImageNo(b.getBo_no());  // 수정할 img_no를 받아온다
				i.setImg_no(img_no);
				result2 = noService.updateImage(i); // 파일명 update
			}else if(delim_file==2){  //Image테이블 insert
				result2 = noService.insertImage(i);
				int result3 = noService.insertBoardImg2(b.getBo_no());
			}else if(delim_file==-1) {  // Image테이블 delete
				int img_no = noService.selectImageNo(b.getBo_no());
				result2 = noService.deleteImage(img_no);
			}else {
				return "redirect:NoticeSelect.bd?bo_no="+b.getBo_no();
			}
			System.out.println(result2);
			if(result2>0) {
				return "redirect:NoticeSelect.bd?bo_no="+b.getBo_no();
			}else {
				throw new BoardException("게시글 수정에 실패하였습니다.\n다시 시도해주세요.");
			}
		}else {
			throw new BoardException("게시글 수정에 실패하였습니다.\n다시 시도해주세요.");
		}
	}
}
