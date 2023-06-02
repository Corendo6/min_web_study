package com.uniquegames.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.uniquegames.vo.CommentVo;
import com.uniquegames.vo.NoticeVo;

@Repository
public interface NoticeMapper {
	ArrayList<NoticeVo> selectNotice(int startCount, int endCount);

	NoticeVo selectContent(String no);

	int insertNotice(NoticeVo noticeVo);

	int updateNotice(NoticeVo noticeVo);

	int deleteNotice(String no);

	int deleteList(String[] list);

	void hitsCount(String no);

	int insertFile(NoticeVo noticeVo);

	int updateFile(NoticeVo noticeVo);

	int updateUploadFile(NoticeVo noticeVo);

	int fileCheck(NoticeVo noticeVo);

	int totRowCount();

	ArrayList<CommentVo> selectComment(String no);

	int insertComment(CommentVo commentVo);

	int deleteComment(String no);
}
