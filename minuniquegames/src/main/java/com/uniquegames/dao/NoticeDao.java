package com.uniquegames.dao;

import java.util.ArrayList;

import com.uniquegames.vo.NoticeVo;

public class NoticeDao extends DBConnBoard {

	/**
	 * select - 전체 리스트 조회
	 */
	public ArrayList<NoticeVo> select() {
		ArrayList<NoticeVo> list = new ArrayList<NoticeVo>();

		String sql = "SELECT @ROWNUM:= @ROWNUM + 1 AS RNO, POST_ID, TITLE, CONTENT, COMPANY_ID, NOTICE_HITS, CAST( DATE_FORMAT( NOTICE_DATE, '%Y-%m-%d %H:%i:%s' ) AS CHAR(19) ) AS NOTICE_DATE\r\n"
				+ "FROM (SELECT POST_ID, TITLE, CONTENT, COMPANY_ID, NOTICE_HITS, NOTICE_DATE FROM NOTICE ORDER BY NOTICE_DATE DESC) SUB, (SELECT @ROWNUM:=0) TMP";

		getPreparedStatment(sql);

		try {

			rs = pstmt.executeQuery();

			while (rs.next()) {

				NoticeVo noticeVo = new NoticeVo();
				noticeVo.setRno(rs.getInt(1));
				noticeVo.setPost_id(rs.getInt(2));
				noticeVo.setTitle(rs.getString(3));
				noticeVo.setContent(rs.getString(4));
				noticeVo.setCompany_id(rs.getString(5));
				noticeVo.setNotice_hits(rs.getInt(6));
				noticeVo.setNotice_date(rs.getDate(7));

				list.add(noticeVo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
