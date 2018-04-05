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

public class PartyDAO {
	private static PartyDAO instance;
	private PartyDAO(){}
	public static PartyDAO getInstance(){
		if(instance==null){
			instance = new PartyDAO();
		}
		return instance;
	}
	private Connection getConn(){
		Connection conn = null;
		try{
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return conn;
	}
	public int getTotalCnt() throws SQLException {
		Connection conn = null;	Statement stmt= null; 
		ResultSet rs = null;    int tot = 0;
		String sql = "select count(*) from party";
		try {
			conn = getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	//파티 게시판에서 파티 간략정보, 파티 상세정보를 출력 partyBoard line.169 to line.241
	public List<Party> list(int startRow, int endRow) throws SQLException {
		List<Party> list = new ArrayList<Party>();
		Connection conn = null;
		PreparedStatement pstmt1 = null; PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null; PreparedStatement pstmt4 = null;
		PreparedStatement pstmt5 = null;
		ResultSet rs1 = null; ResultSet rs2 = null; ResultSet rs3 = null; ResultSet rs4 = null;
		ResultSet rs5 = null;
		//sql1 = 게시판 형식으로 출력 /파티번호 역순으로 정렬
		 String sql1 = "select * from (select rownum rn ,a.* from (select * from party order by pnum desc) a ) where rn between ? and ?";
		 //sql2 = 각 파티가 가는 카페 정보 - 파티에 입력된 카페 번호 기준
		 String sql2 = "select * from cafe where cnum=?";
		 //sql3 = 각 파티가 가는 테마 정보 - 카페+테마 번호 기준
		 String sql3 = "select * from theme where cnum=? and tnum=?";
		 //sql4 = 파티 현재인원 수 - 파티장(pmnum=1)제외
		 String sql4 = "select count(*) from partymem where pnum=? and pmnum!=?";
		 //sql5 = 파티장 이름
		 String sql5 = "select * from member where member.id=(select id from partymem where pnum=? and pmnum=?)";
		try {
			conn = getConn();
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, startRow);
			pstmt1.setInt(2, endRow);
			rs1 = pstmt1.executeQuery();
			while (rs1.next()) {
				Party party = new Party();
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setInt(1, rs1.getInt("cnum"));
				rs2 = pstmt2.executeQuery();
				while(rs2.next()){
					party.setTnum(rs1.getInt("tnum"));
					party.setCname(rs2.getString("cname"));
					party.setCaddress(rs2.getString("caddress"));
					party.setContent(rs2.getString("content"));
					party.setType(rs2.getString("type"));
					party.setOpen(rs2.getInt("open"));
					party.setClose(rs2.getInt("close"));
					party.setPrice(rs2.getInt("price"));
					party.setRedprice(rs2.getInt("redprice"));
					party.setImage1(rs2.getString("image1"));
					}
				pstmt3 = conn.prepareStatement(sql3);
				pstmt3.setInt(1, rs1.getInt("cnum"));
				pstmt3.setInt(2, rs1.getInt("tnum"));
				rs3 = pstmt3.executeQuery();
				while(rs3.next()){
					party.setTname(rs3.getString("tname"));
					party.setTcontent(rs3.getString("tcontent"));
				}
				party.setCnum(rs1.getInt("cnum"));
				party.setPnum(rs1.getInt("pnum"));
				party.setPreg_date(rs1.getDate("preg_date"));
				party.setHopedate(rs1.getString("hopedate"));
				party.setHopehour(rs1.getInt("hopehour"));
				party.setMax(rs1.getInt("max"));
				party.setPcontent(rs1.getString("pcontent"));
				pstmt4 = conn.prepareStatement(sql4);
				pstmt4.setInt(1, rs1.getInt("pnum"));
				pstmt4.setString(2, "1");
				rs4 = pstmt4.executeQuery();
				while(rs4.next()){
					party.setPmcount(rs4.getInt(1));
				}
				pstmt5 = conn.prepareStatement(sql5);
				pstmt5.setInt(1, rs1.getInt("pnum"));
				pstmt5.setString(2, "1");
				rs5 = pstmt5.executeQuery();
				while(rs5.next()){
					party.setId(rs5.getString("id"));
				}
				list.add(party);
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {	
			if(rs5!=null)rs5.close();
			if(pstmt5!=null)pstmt5.close();
			if(rs4!=null)rs4.close();
			if(pstmt4!=null)pstmt4.close();
			if(rs3!=null)rs3.close();
			if(pstmt3!=null)pstmt3.close();
			if(rs2!=null)rs2.close();
			if(pstmt2!=null)pstmt2.close();
			if (rs1 !=null) rs1.close();
			if (pstmt1 != null) pstmt1.close();
			if (conn !=null) conn.close();
		}
		return list;
	}
	//파티원 정보를 출력 partyBoard line.274
	public List<PartyMem> memList() throws SQLException {
		List<PartyMem> memList = new ArrayList<PartyMem>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		//sql = 파티원 정보
		String sql = "select * from member, partymem where member.id=partymem.id order by pnum, pmnum";
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				PartyMem partyMem = new PartyMem();
				partyMem.setId(rs.getString("id"));
				partyMem.setPnum(rs.getInt("pnum"));
				partyMem.setPmnum(rs.getInt("pmnum"));
				partyMem.setName(rs.getString("name"));
				partyMem.setSex(rs.getString("sex"));
				partyMem.setBirth(rs.getString("birth"));
				partyMem.setEmail(rs.getString("email"));
				partyMem.setTel(rs.getString("tel"));
				partyMem.setIntro(rs.getString("intro"));
				memList.add(partyMem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return memList;
	}
	public int partyOut(int pnum, String id) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from partymem where pnum=? and id=?";
		String sql2 = "delete from partymem where id=?";
		conn = getConn();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			System.out.println(id);
			if(rs.next()){
				rs.close();
				pstmt.close();
				System.out.println(id);
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, id);
				result = pstmt.executeUpdate();
				System.out.println(id);
			}else result = -1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
