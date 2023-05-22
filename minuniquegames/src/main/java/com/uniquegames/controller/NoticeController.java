package com.uniquegames.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.dao.NoticeDao;
import com.uniquegames.vo.NoticeVo;

@Controller
public class NoticeController {

	/**
	 * notice-list.do 공지사항 - 전체 리스트
	 */
	@RequestMapping(value = "/notice-list.do", method = RequestMethod.GET)
	public ModelAndView noticeList() {
		ModelAndView model = new ModelAndView();
		NoticeDao noticeDao = new NoticeDao();

		ArrayList<NoticeVo> list = noticeDao.select();
		model.addObject("list", list);
		model.setViewName("/board/board_list");

		return model;
	}

//	/**
//	 * notice-list-user.do ��ü ����Ʈ
//	 */
//	@RequestMapping(value = "/board-list-user.do", method = RequestMethod.GET)
//	public String noticeListUser() {
//		return "/board/board_list_user";
//	}

	/**
	 * notice-write.do 공지사항 - 작성
	 */
	@RequestMapping(value = "/notice-write.do", method = RequestMethod.GET)
	public String noticeWrite() {
		return "/board/board_write";
	}
	
	/**
	 * notice_write_proc.do 공지사항 - 작성 처리
	 */
	@RequestMapping(value = "/notice-write-proc.do", method = RequestMethod.POST)
	public String noticeWriteProc(NoticeVo noticeVo) {
		
		return "redirect:/notice-list.do";
	}

	/**
	 * notice-content.do ��ü ����Ʈ
	 */
	@RequestMapping(value = "/notice-content.do", method = RequestMethod.GET)
	public String noticeContent() {
		return "/board/board_content";
	}

	/**
	 * notice-update.do ����
	 */
	@RequestMapping(value = "/notice-update.do", method = RequestMethod.GET)
	public String noticeUpdate() {
		return "/board/board_update";
	}

}
