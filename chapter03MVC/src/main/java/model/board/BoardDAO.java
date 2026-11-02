package model.board;
import java.sql.*;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.Catch;

import DBPKG.*;

public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// --------------------------------------------------------
	// 특정 페이지의 정보를 반환하는 메소드
	public ArrayList<BoardDTO> getAllboard(int startRow, int pageSize) {
		ArrayList<BoardDTO> arr = new ArrayList<BoardDTO>();
		
		try {
			con = Util.getConnection();
			
			String sql = "select * from board where chkDel=0 order by ref desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				bdto.setNum(rs.getInt(1));
				bdto.setWriter(rs.getString(2));
				bdto.setEmail(rs.getString(3));
				bdto.setSubject(rs.getString(4));
				bdto.setPassword(rs.getString(5));
				bdto.setReg_date(rs.getString(6));
				bdto.setRef(rs.getInt(7));
				bdto.setRe_step(rs.getInt(8));
				bdto.setReadcount(rs.getInt(9));
				bdto.setContent(rs.getString(10));
				bdto.setId(rs.getString(11));
				
				arr.add(bdto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return arr;
	}
	
	// --------------------------------------------------------
	// 보드의 전체 갯수를 반환하는 메소드
	public int getAllCount() {
		
		int result = 0;
		
		try {
			con = Util.getConnection();
			
			String sql = "select count(*) from board where chkDel=0";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	// --------------------------------------------------------
	// 하나의 게시글을 삽입하는 메소드
	public void insertBoard(BoardDTO bdto) {
		try {
			int ref = 0;
			int re_step = 0;
			
			
			con = Util.getConnection();
			
			String sql = "select max(ref)+1 from board";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) ref = rs.getInt(1);		
			
			pstmt.close();
			rs.close();
			
			
			sql = "insert into board values(null, ?, ?, ?, ?, current_date(), ?, ?, 0, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bdto.getWriter());
			pstmt.setString(2, bdto.getEmail());
			pstmt.setString(3, bdto.getSubject());
			pstmt.setString(4, bdto.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setString(7, bdto.getContent());
			pstmt.setString(8, bdto.getId());
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("업뎃 실패");
		}finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// --------------------------------------------------------
	// 하나의 게시글을 출력하는 메소드
	public BoardDTO getBoardInfo(int num) {
		BoardDTO bdto = new BoardDTO();
		
		try {
			con = Util.getConnection();
			
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bdto.setNum(rs.getInt("num"));
				bdto.setPassword(rs.getString("password"));
				bdto.setWriter(rs.getString("writer"));
				bdto.setEmail(rs.getString("email"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setReg_date(rs.getString("reg_date"));
				bdto.setReadcount(rs.getInt("readcount"));
				bdto.setContent(rs.getString("content"));
				bdto.setRef(rs.getInt("ref"));
				bdto.setRe_step(rs.getInt("re_step"));
				bdto.setId(rs.getString("id"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return bdto;
		
	}
	
	// --------------------------------------------------------
	// 조회수를 증가시키는 메소드
	public void readcountUper(int num) {
		try {
			int befor_readcount = 0;
			
			con = Util.getConnection();
			
			String sql = "select readcount from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				befor_readcount = rs.getInt(1);
			}
			
			pstmt.close();
			rs.close();
			
			int new_readcount = befor_readcount+1;
			
			sql = "update board set readcount=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, new_readcount);
			pstmt.setInt(2, num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// --------------------------------------------------------
	// 답글 작성용 메소드
	public void reinsertBoard(BoardDTO bdto) {
		try {
			con = Util.getConnection();

			int ref = bdto.getRef();
			int re_step = 1;
			
			System.out.println("ref : " + ref);
			System.out.println("re_step : " + re_step);
			
			String sql = "insert into board values(null, ?, ?, ?, ?, current_date(), ?, ?, 0, ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bdto.getWriter());
			pstmt.setString(2, bdto.getEmail());
			pstmt.setString(3, bdto.getSubject());
			pstmt.setString(4, bdto.getPassword());
			pstmt.setInt(5, ref); // 원 글의 ref 값
			pstmt.setInt(6, re_step);
			pstmt.setString(7, bdto.getContent());
			pstmt.setString(8, bdto.getId());
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("답글작성 실패");
		}finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// --------------------------------------------------------
	// 게시글 수정 메소드
	public void updateOneBoard(int num, String subject, String content) {
		try {
			
			String sql = "update board set subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("업뎃 실패");
		}finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	// --------------------------------------------------------
	// 게시글 하나 소프트 삭제하는 메소드
	public void boardDelete(int num) {
		// chkDel 1 => 화면에 출력 안함.
		// chkDel 0 => 화면에 출력 함.
		try {
			con = Util.getConnection();
			
			String sql = "update board set chkDel = 1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
}
