package com.beans.web_project;

import java.util.ArrayList;

public class EmpDao extends DBConn {

	/** 리스트 출력 **/
	public ArrayList<EmpVo> getList() {
		ArrayList<EmpVo> resultList = new ArrayList<EmpVo>();
		// 3. PreparedStatement 객체 생성
		String sql = "select empno, ename, deptno from emp";
		getPreparedStatement(sql);
		try {
			// 4. ResultSet 객체 생성
			rs = pstmt.executeQuery();

			// 5. 데이터 출력
			while (rs.next()) {
				EmpVo emp = new EmpVo();
				emp.setEmpno(rs.getInt(1));
				emp.setEname(rs.getString(2));
				emp.setDeptno(rs.getInt(3));
				resultList.add(emp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultList;
	}
}
