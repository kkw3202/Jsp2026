package model.member;
import java.sql.*;
import java.util.*;

import DBPKG.Util;

public class MemberDAO {
	// 전역변수 선언부
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql ="";
	//---- 이하 sql문 작성 메소드의 모임
	
	
	// id만 추출하는 메소드 작성. // 메소드명 : getId()
	public String getId(String id) {
		String chkid="";
		
		try {
			con = Util.getConnection();
			
			sql = "select id from member where id=?";
			// ? => db 에 들어가는 "값". 칼럼명이나 테이블 명, 일부 단어만 자르는 검색어 등은 들어 갈 수 없음
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chkid = id;
				// chkid = rs.getString(1);
				// chkid = rs.getString("id"); 
				// 3가지 전부 지금 상황에서는 결과 동일!
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch (Exception e) {e.printStackTrace();}
		}
		return chkid;
	}
	public String getPass(String id) {
		String chkpass="";
		
		try {
			con = Util.getConnection();
			
			sql = "select pass from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chkpass = rs.getString("pass");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch (Exception e) {e.printStackTrace();}
		}
		return chkpass;
	}
	// --------------- 
	// 한 사람의 데이터를 DB에 저장하는 메소드
	public void insertMember(MemberDTO mdto) {
		try {
			con = Util.getConnection();
			
			String sql = "insert into member values (?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPass());
			pstmt.setString(3, mdto.getEmail());
			pstmt.setString(4, mdto.getTel());
			pstmt.setString(5, mdto.getHobby());
			pstmt.setString(6, mdto.getJob());
			pstmt.setString(7, mdto.getAge());
			pstmt.setString(8, mdto.getInfo());
			
			int result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch (Exception e) {e.printStackTrace();}
		}
	}
	//------------------
	public ArrayList<MemberDTO> getAllMember() {
		ArrayList<MemberDTO> m = new ArrayList<MemberDTO>();
		
		try {
			con = Util.getConnection();
			
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MemberDTO mdto = new MemberDTO();
				
				mdto.setId(rs.getString(1));
				mdto.setPass(rs.getString(2));
				mdto.setEmail(rs.getString(3));
				mdto.setTel(rs.getString(4));
				mdto.setHobby(rs.getString(5));
				mdto.setJob(rs.getString(6));
				mdto.setAge(rs.getString(7));
				mdto.setInfo(rs.getString(8));
				
				// ArrayList 에 정보 담기
				m.add(mdto);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch (Exception e) {e.printStackTrace();}
		}
		// 리턴 작성
		return m;
	}
	//------------------ 2026-10-28 db 쿼리 업데이트
	// 메소드 이름 : loginCheck()
	
	public boolean loginCheck(String id, String pass) {
		
		try {
			con = Util.getConnection();
			
			String sql = "select pass from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(pass)) return true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		
		return false;
	}
	//------------------ 2026-10-28 db 쿼리 업데이트
	// 이메일 또는 아이디로 회원목록을 검색하는 메소드
	// 메소드 이름 : searchMemberList()
	
	public ArrayList<MemberDTO> getSearchMember(String searchType, String keyword) {
		ArrayList<MemberDTO> m = new ArrayList<MemberDTO>();
		
		try {
			con = Util.getConnection();
			
			String sql = "select * from member where " + searchType + " like '%"+ keyword +"%'";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO mdto = new MemberDTO();
				mdto.setId(rs.getString(1));
				mdto.setPass(rs.getString(2));
				mdto.setEmail(rs.getString(3));
				mdto.setTel(rs.getString(4));
				mdto.setHobby(rs.getString(5));
				mdto.setJob(rs.getString(6));
				mdto.setAge(rs.getString(7));
				mdto.setInfo(rs.getString(8));
				
				m.add(mdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch (Exception e) {e.printStackTrace();}
		}
		// 리턴 작성
		return m;
	}
	//------------------ 2026-10-28 db 쿼리 업데이트
	// 회원 한 명의 모든 정보를 추출하는 메소드
	public MemberDTO getMemberDetail(String id) {
		MemberDTO mdto = new MemberDTO();
		try {
			con = Util.getConnection();
			
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mdto.setId(rs.getString(1));
				mdto.setPass(rs.getString(2));
				mdto.setEmail(rs.getString(3));
				mdto.setTel(rs.getString(4));
				mdto.setHobby(rs.getString(5));
				mdto.setJob(rs.getString(6));
				mdto.setAge(rs.getString(7));
				mdto.setInfo(rs.getString(8));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch (Exception e) {e.printStackTrace();}
		}
		return mdto;
	}
	//------------------ 2026-10-28 db 쿼리 업데이트
	// 회원 한 명의 모든 정보를 업데이트 하는 메소드
	public int setUpdateMember(MemberDTO mdto) {
		int result = 0;
		
		try {
			con = Util.getConnection();
			
			String sql = "update member set pass=?, email=?, tel=?, hobby=?, job=?, age=?, info=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getPass());
			pstmt.setString(2, mdto.getEmail());
			pstmt.setString(3, mdto.getTel());
			pstmt.setString(4, mdto.getHobby());
			pstmt.setString(5, mdto.getJob());
			pstmt.setString(6, mdto.getAge());
			pstmt.setString(7, mdto.getInfo());
			pstmt.setString(8, mdto.getId());
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch (Exception e) {e.printStackTrace();}
		}
		return result;
	}
	
	
}
