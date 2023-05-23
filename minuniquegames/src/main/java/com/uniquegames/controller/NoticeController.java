package com.uniquegames.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.uniquegames.dao.NoticeDao;
import com.uniquegames.vo.NoticeVo;

@Controller
public class NoticeController {

	/**
	 * notice-list.do 공지사항 - 전체 리스트
	 */
	@RequestMapping(value = "/notice_list.do", method = RequestMethod.GET)
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
	 * notice_write.do 공지사항 - 작성
	 */
	@RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
	public String noticeWrite() {
		return "/board/board_write";
	}

	/**
	 * notice_write_proc.do 공지사항 - 작성 처리
	 */
	@RequestMapping(value = "/notice_write_proc.do", method = RequestMethod.POST)
	public String noticeWriteProc(NoticeVo noticeVo, RedirectAttributes attributes) {

		NoticeDao noticeDao = new NoticeDao();
		int result = noticeDao.insert(noticeVo);

		if (result == 1) {
			attributes.addFlashAttribute("result", "success");
		} else {
			attributes.addFlashAttribute("result", "fail");
		}

		return "redirect:/notice_list.do";
	}

	/**
	 * notice_content.do 공지사항 - 상세 보기
	 */
	@RequestMapping(value = "/notice_content.do", method = RequestMethod.GET)
	public ModelAndView noticeContent(String no) {
		ModelAndView model = new ModelAndView();
		NoticeDao noticeDao = new NoticeDao();

		NoticeVo noticeVo = noticeDao.select(no);

		model.addObject("noticeVo", noticeVo);
		model.setViewName("/board/board_content");

		return model;
	}

	/**
	 * notice_delete.do 공지사항 - 삭제
	 */
	@RequestMapping(value = "/notice_delete.do", method = RequestMethod.POST)
	public String noticeDelete(String no, RedirectAttributes attributes) {

		NoticeDao noticeDao = new NoticeDao();

		int result = noticeDao.delete(no);
		if (result == 1) {
			attributes.addFlashAttribute("result", "complete");
		} else {
			attributes.addFlashAttribute("result", "fail");
		}

		return "redirect:/notice_list.do";
	}

	/**
	 * notice_update.do 공지사항 - 수정
	 */
	@RequestMapping(value = "/notice_update.do", method = RequestMethod.GET)
	public ModelAndView noticeUpdate(String no) {
		ModelAndView model = new ModelAndView();
		NoticeDao noticeDao = new NoticeDao();

		NoticeVo noticeVo = noticeDao.select(no);

		model.addObject("noticeVo", noticeVo);
		model.setViewName("/board/board_update");

		return model;
	}

	/**
	 * notice_update_proc.do 공지사항 - 수정 처리
	 */
	@RequestMapping(value = "/notice_update_proc.do", method = RequestMethod.POST)
	public String noticeUpdateProc(NoticeVo noticeVo, RedirectAttributes attributes) {
		NoticeDao noticeDao = new NoticeDao();

		int result = noticeDao.update(noticeVo);
		if (result == 1) {
			attributes.addFlashAttribute("result", "success");
		} else {
			attributes.addFlashAttribute("result", "fail");
		}
		return "redirect:/notice_content.do?no=" + noticeVo.getPost_id();
	}

}
