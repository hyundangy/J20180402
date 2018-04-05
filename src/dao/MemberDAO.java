package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance;
	private MemberDAO() {};
	public static MemberDAO getInstance() {
		if(instance == null)
			instance = new MemberDAO();
		return instance;
	}



	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	// 회원정보 가져오기(service.LoginAction)
	public Member getUserInfo(String id) throws SQLException {
		String sql = "select * from member where id=?";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = new Member();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setAdmin(rs.getInt(3));
				member.setName(rs.getString(4));
				member.setBirth(rs.getString(5));
				member.setImage(rs.getString(6));
				member.setSex(rs.getString(7));
				member.setAddress(rs.getString(8));
				member.setEmail(rs.getString(9));
				member.setTel(rs.getString(10));
				member.setIntro(rs.getString(11));
				member.setPoint(rs.getInt(12));
				member.setReg_date(rs.getDate(13));
				member.setMem_del_yn(rs.getString(14));
			}
			rs.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		}
		return member;
	}

	// 아이디 중복체크 (join.jsp -> checkId.jsp)
	public int checkId(String id) throws SQLException {
		if(id.length() < 4 || id.length() > 20)
			return -1;

		String sql = "select id from member where id=?";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			System.out.println(rs);
			if(rs.next())
				result = 1;
			else
				result = 0;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		}
		return result;
	}
	// 회원가입(join.jsp -> JoinAction.java)
	public int join(Member member) throws SQLException {
		String sql = "insert into member values(?, ?, 1, ?, ?, ?, ?,? ,?, ?, ?, 1000, sysdate, 'N')";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getBirth());
			pstmt.setString(5, member.getImage());
			pstmt.setString(6, member.getSex());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getTel());
			pstmt.setString(10, member.getIntro());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		}
		return result;
	}

	// 로그인(login.jsp -> LoginAction.java)
	public int login(String id, String password) throws SQLException {
		String sql = "select password from member where id=?";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbPwd = rs.getString(1);
				if (dbPwd.equals(password))
					result = 1;
				else
					result = 0;
			} else result = -1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		}
		System.out.println(result);
		return result;
	}

	//관리자가 3보다 작은, 삭제되지 않은 멤버 전체 수를 뽑는 메소드
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from MEMBER where (mem_del_yn = 'N') "
				+ "and (admin < 3)";
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

	// 관리자가 3보다 작은, 삭제되지 않은 멤버 전체 리스트를 뽑는 메소드
	public List<Member> memberlist() throws SQLException {
		List<Member> list = new ArrayList<Member>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from MEMBER " + "where (mem_del_yn = 'N') "
				+ "and (admin < 3)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setAdmin(rs.getInt("admin"));
				member.setName(rs.getString("name"));
				member.setBirth(rs.getString("birth"));
				member.setImage(rs.getString("image"));
				member.setSex(rs.getString("sex"));
				member.setAddress(rs.getString("address"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
				member.setIntro(rs.getString("intro"));
				member.setPoint(rs.getInt("point"));
				member.setReg_date(rs.getDate("reg_date"));
				member.setMem_del_yn(rs.getString("mem_del_yn"));
				list.add(member);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
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

	// 관리자 페이지: MemberAddProAction에서 쓰는 메소드
	// 프로필 사진만 default로 한 회원 생성 메소드
	public int memberInsert(Member member) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql = "insert into MEMBER values "
				+ "(?,?,?,?,?,null,?,?,?,?,?,?,sysdate,'N')";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setInt(3, member.getAdmin());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getBirth());
			pstmt.setString(6, member.getSex());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getTel());
			pstmt.setString(10, member.getIntro());
			pstmt.setInt(11, member.getPoint());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;

	}

		public Member memberSelect(String id) {
			// TODO Auto-generated method stub
			return null;
		}

}
