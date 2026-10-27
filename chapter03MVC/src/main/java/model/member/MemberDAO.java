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
	
	
}
