package com.uniquegames.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.uniquegames.dao.CommentDao;
import com.uniquegames.vo.CommentVo;

@Service
public class CommentServiceImpl implements CommentService {

	CommentDao commentDao = new CommentDao();

	/**
	 * 댓글 - 작성
	 */
	@Override
	public int commentInsert(CommentVo commentVo) {

		commentVo.setComment_content(commentVo.getComment_content().replaceAll("\r\n", "<br>"));

		return commentDao.insert(commentVo);
	}

	/**
	 * 댓글 - 페이지별 댓글 전체 리스트
	 */
	@Override
	public ArrayList<CommentVo> select(String no) {

		return commentDao.select(no);
	}

}
