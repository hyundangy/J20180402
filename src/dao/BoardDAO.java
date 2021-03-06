package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private static BoardDAO instance;

	private BoardDAO() {
	}

	public static BoardDAO getInstance() {
		if (instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx
					.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	// ListAction사용
	// 게시판 본문의 내용을 출력
	public List<Board> list() throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where re_level = 0 order by ref desc";
		String sql1 = "Select * from (select rownum rn ,a.* from (select * from"
				+ " board Order by ref desc)a)where (rn between ? and ?) and (re_level = 0)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			/*
			 * pstmt.setInt(1, startRow); pstmt.setInt(2, endRow);
			 */
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBnum(rs.getInt("bnum"));
				board.setCategory(rs.getString("category"));
				board.setId(rs.getString("id"));
				board.setSubject(rs.getString("subject"));
				board.setWdate(rs.getDate("wdate"));
				board.setReadcount(rs.getInt("readcount"));
				board.setRef(rs.getInt("ref"));
				board.setRe_level(rs.getInt("re_level"));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		}
		return list;
	}

	// ListAction에서 사용
	// 게시판 게시글의 총합을 구해주는 메소드
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from board where re_level = 0";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return tot;
	}

	// ContentAction에서 사용
	// 게시판의 조회수 카운트 메소드
	public void readCount(int bnum) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set readcount=readcount+1 where bnum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

	/*
	 * ContentAction, DeleteFromAction, replyWriteFromAction,
	 * UpdateFormAction,WriterFormAction에서 사용 Borad의 속성값을 가지오는 메소드
	 */

	public Board select(int bnum) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from board where bnum=" + bnum;
		Board board = new Board();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				board.setBnum(rs.getInt("bnum"));
				board.setId(rs.getString("id"));
				board.setCategory(rs.getString("category"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setReadcount(rs.getInt("readcount"));
				board.setWdate(rs.getDate("wdate"));
				board.setRef(rs.getInt("ref"));
				board.setRe_level(rs.getInt("re_level"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return board;
	}

	/*
	 * WriterProAction에서 사용 select로 받은 값을 이용해 게시글을 작성하는 메소드
	 */
	public int insert(Board board) throws SQLException {
		int bnum = board.getBnum();
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into board values(?,?,?,?,?,?,sysdate,?,?)";
		String sql1 = "select nvl(max(bnum),0) from board";
		/*
		 * String sql2 =
		 * "update board set re_step = re_step+1 where ref=? and re_step > ?";
		 */

		try {
			conn = getConnection();
			/*
			 * if (bnum != 0) { pstmt = conn.prepareStatement(sql2);
			 * pstmt.setInt(1, board.getRef()); pstmt.setInt(2,
			 * board.getRe_step()); pstmt.executeUpdate(); pstmt.close();
			 * board.setRe_step(board.getRe_step() + 1);
			 * board.setRe_level(board.getRe_level() + 1); }
			 */
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			// key�횓 BNUM 1쩐쩔 횁천째징 ,mysql auto_increment 쨋횉쨈횂 oracle sequence
			// sequence쨍짝 쨩챌쩔챘 : values(쩍횄횆철쩍쨘쨍챠 (board_seq).nextval,?,?...)
			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
			if (bnum == 0)
				board.setRef(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, board.getId());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getReadcount());
			pstmt.setString(6, board.getCategory());
			pstmt.setInt(7, board.getRef());
			pstmt.setInt(8, board.getRe_level());
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			if (rs != null)
				rs.close();
		}
		return result;
	}

	/*
	 * UpdateProAction에서 사용 게시글 수정에 사용되는 메소드
	 */
	public int update(Board board) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set category=?,subject=?,id=?,content=? where bnum=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getCategory());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getId());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getBnum());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	/*
	 * DeleteProAction에서 사용 게시글 삭제에 사용되는 메소드
	 */
	public int delete(int bnum, String passwd) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "delete from board where bnum=?";
		String sql1 = "select id from board where bnum=?";
		try {
			String dbid = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, bnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbid = rs.getString(1);
				if (dbid.equals(passwd)) {
					rs.close();
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, bnum);
					result = pstmt.executeUpdate();
				} else
					result = 0;
			} else
				result = -1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	/*
	 * ReplyWriteProAction에서 사용 게시글의 댓글을 입력할때 사용되는 메소드
	 */

	public int replyInsert(Board board) throws SQLException {
		int bnum = board.getBnum();
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into board values(?,?,?,null,?,?,sysdate,?,?)";
		String sql1 = "select nvl(max(bnum),0) from board";
		/*String sql2 = "update board set re_level = re_level+1 where ref=? and re_level > ?";*/

		try {
			conn = getConnection();

			/*if (bnum != 0) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, board.getRef());
				pstmt.setInt(2, board.getRe_level());
				pstmt.executeUpdate();
				pstmt.close();
				board.setRef(board.getRef());
				board.setRe_level(board.getRe_level());
			}*/
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();

			int number = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
			if (bnum == 0)
				board.setRef(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, board.getId());
			pstmt.setString(3, board.getSubject());
			pstmt.setInt(4, board.getReadcount());
			pstmt.setString(5, board.getCategory());
			pstmt.setInt(6, board.getRef());
			pstmt.setInt(7, board.getRe_level());
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			if (rs != null)
				rs.close();
		}
		return result;
	}

	/*
	 * ContentAction에서 사용 댓글을 출력할때 사용되는 메소드
	 */

	public List<Board> replyList(int startRow, int endRow, int ref)
			throws SQLException {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where re_level >0 and ref = ?";
		String sql2 = "Select * from (select rownum rn ,a.* from (select * from"
				+ " board Order by wdate desc)a)where (rn between ? and ?) and (re_level > 0) and(ref = ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, ref);
			System.out.println("startRow-->>" + startRow);
			System.out.println("endRow-->>" + endRow);
			System.out.println("ref-->>" + ref);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBnum(rs.getInt("bnum"));
				board.setId(rs.getString("id"));
				board.setSubject(rs.getString("subject"));
				board.setWdate(rs.getDate("wdate"));
				board.setRef(rs.getInt("ref"));
				board.setRe_level(rs.getInt("re_level"));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		}
		return list;
	}


}
