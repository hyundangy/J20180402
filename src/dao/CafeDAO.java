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

public class CafeDAO {
	private static CafeDAO instance;
	private CafeDAO() {}
	public static CafeDAO getInstance() {
		if (instance == null) {	
			instance = new CafeDAO();		
			}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
			}
		return conn;
	}
	
	// vr 移댄럹 由ъ뒪�듃 遺덈윭�삤湲� (vrMainView)
	public List<Cafe> list() throws SQLException{	
		List<Cafe> list = new ArrayList<Cafe>();
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select * from cafe where type='vr' ";
		
		try{
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Cafe cafe = new Cafe();
				cafe.setCnum(rs.getInt("cnum"));
				cafe.setCname(rs.getString("cname"));
				cafe.setCaddress(rs.getString("caddress"));
				cafe.setOpen(rs.getInt("open"));
				cafe.setClose(rs.getInt("close"));
				cafe.setPrice(rs.getInt("price"));
				cafe.setRedprice(rs.getInt("redprice"));
				cafe.setType(rs.getString("type"));
				cafe.setImage1(rs.getString("image1"));
				cafe.setImage2(rs.getString("image2"));
				cafe.setImage3(rs.getString("image3"));
				cafe.setContent(rs.getString("content"));
				cafe.setRoomcount(rs.getInt("roomcount"));
				cafe.setCafe_del_yn(rs.getString("cafe_del_yn"));
				cafe.setCurl(rs.getString("curl"));
				list.add(cafe);
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		return list;
	}
	
	public List<Theme> v_select_theme(int cnum) throws SQLException{	// �빐�떦 移댄럹�뿉 留욌뒗 寃뚯엫 由ъ뒪�듃 遺덈윭�삤湲�(vrList1View)
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs= null;
		String sql= "select * from theme where cnum="+cnum;
		List<Theme> list = new ArrayList<Theme>();

		try{
			conn=getConnection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				Theme theme = new Theme();
				theme.setCnum(rs.getInt("cnum"));
				theme.setTnum(rs.getInt("tnum"));
				theme.setTname(rs.getString("tname"));
				theme.setTcontent(rs.getString("tcontent"));
				theme.setTimage(rs.getString("timage"));
				theme.setScore1(rs.getDouble("score1"));
				theme.setScore2(rs.getDouble("score2"));
				theme.setScore3(rs.getDouble("score3"));
				theme.setScore4(rs.getDouble("score4"));
				theme.setHeadcount(rs.getInt("headcount"));
				list.add(theme);
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		return list;
	}
	
	// 移댄럹 踰덊샇�뿉 留욌뒗 移댄럹 �젙蹂� �뼸湲�(vrReserveView)
	public Cafe cafe_info(int cnum) throws SQLException{	
		Cafe cafe = new Cafe();
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String sql = "select * from cafe where cnum="+cnum;
		
		try{
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
			    cafe.setCnum(rs.getInt("cnum"));
				cafe.setCname(rs.getString("cname"));
				cafe.setCaddress(rs.getString("caddress"));
				cafe.setOpen(rs.getInt("open"));
				cafe.setClose(rs.getInt("close"));
				cafe.setPrice(rs.getInt("price"));
				cafe.setRedprice(rs.getInt("redprice"));
				cafe.setType(rs.getString("type"));
				cafe.setImage1(rs.getString("image1"));
				cafe.setImage2(rs.getString("image2"));
				cafe.setImage3(rs.getString("image3"));
				cafe.setContent(rs.getString("content"));
				cafe.setRoomcount(rs.getInt("roomcount"));
				cafe.setCafe_del_yn(rs.getString("cafe_del_yn"));
				cafe.setCurl(rs.getString("curl"));
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		return cafe;
	}
	
	public Theme v_theme(int cnum,int tnum) throws SQLException{	//�삁�빟�븯湲� �닃���쓣 �븣, 寃뚯엫 �젙蹂� 遺덈윭�삤湲�(vrReserveView)
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		String sql = "select * from theme where cnum="+cnum +" and tnum="+tnum;
		Theme theme = new Theme();
		
		try{
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery(sql);
			while(rs.next()){
				theme.setCnum(rs.getInt("cnum"));
				theme.setTnum(rs.getInt("tnum"));
				theme.setTname(rs.getString("tname"));
				theme.setTcontent(rs.getString("tcontent"));
				theme.setTimage(rs.getString("timage"));
				theme.setScore1(rs.getDouble("score1"));
				theme.setScore2(rs.getDouble("score2"));
				theme.setScore3(rs.getDouble("score3"));
				theme.setScore4(rs.getDouble("score4"));
				theme.setHeadcount(rs.getInt("headcount"));
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		return theme;
	}
	
	// 硫붿씤�솕硫댁뿉�꽌 諛⑺깉異쒖씠誘몄� �겢由��떆, 諛⑺깉異� 移댄럹 由ъ뒪�듃 蹂댁뿬二쇨린
		// roomMainAction.java �뿉�꽌 �궗�슜
		public List<Cafe> r_list() throws SQLException{  
			List<Cafe> list = new ArrayList<Cafe>();
			Connection conn = null;
			PreparedStatement pstmt= null;
			ResultSet rs = null;
			String sql = "select * from cafe where type='room' ";
			
			try{
				conn=getConnection();
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Cafe cafe = new Cafe();
					cafe.setCnum(rs.getInt("cnum"));
					cafe.setCname(rs.getString("cname"));
					cafe.setCaddress(rs.getString("caddress"));
					cafe.setOpen(rs.getInt("open"));
					cafe.setClose(rs.getInt("close"));
					cafe.setPrice(rs.getInt("price"));
					cafe.setRedprice(rs.getInt("redprice"));
					cafe.setType(rs.getString("type"));
					cafe.setImage1(rs.getString("image1"));
					cafe.setImage2(rs.getString("image2"));
					cafe.setContent(rs.getString("content"));
					cafe.setRoomcount(rs.getInt("roomcount"));
					cafe.setCafe_del_yn(rs.getString("cafe_del_yn"));
					cafe.setCurl(rs.getString("curl"));
					list.add(cafe);
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}
			return list;
		}
		
		//移댄럹 �쟾泥� 由ъ뒪�듃 諛쏆븘�삤湲�
		public List<Cafe> CafeList() throws SQLException {
			List<Cafe> cafelist = new ArrayList<Cafe>();
			String sql = "select * from cafe";
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					do {
						Cafe cafe = new Cafe();
						cafe.setCnum(rs.getInt("cnum"));
						cafe.setId(rs.getString("id"));
						cafe.setCname(rs.getString("cname"));
						cafe.setCaddress(rs.getString("caddress"));
						cafe.setOpen(rs.getInt("open"));
						cafe.setClose(rs.getInt("close"));
						cafe.setPrice(rs.getInt("price"));
						cafe.setRedprice(rs.getInt("redprice"));
						cafe.setType(rs.getString("type"));
						cafe.setImage1(rs.getString("image1"));
						cafe.setImage2(rs.getString("image2"));
						cafe.setImage3(rs.getString("image3"));
						cafe.setContent(rs.getString("content"));
						cafe.setRoomcount(rs.getInt("roomcount"));
						cafe.setCafe_del_yn(rs.getString("cafe_del_yn"));
						cafe.setCurl(rs.getString("curl"));
						cafelist.add(cafe);
					} while (rs.next());
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
			return cafelist;
		}
		
		//SearchGpsAction
		//吏��뿭 keyword媛� �뱾�뼱媛��뒗 移댄럹 由ъ뒪�듃 諛쏆븘�삤湲�
		public List<Cafe> searchCafelist(String keyword) throws SQLException {
			List<Cafe> cafelist = new ArrayList<Cafe>();
			String sql = "select * from cafe where caddress like ?";
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + keyword + '%');
				rs = pstmt.executeQuery();
				if (rs.next()) {
					do {
						Cafe cafe = new Cafe();
						cafe.setCnum(rs.getInt("cnum"));
						cafe.setId(rs.getString("id"));
						cafe.setCname(rs.getString("cname"));
						cafe.setCaddress(rs.getString("caddress"));
						cafe.setOpen(rs.getInt("open"));
						cafe.setClose(rs.getInt("close"));
						cafe.setPrice(rs.getInt("price"));
						cafe.setRedprice(rs.getInt("redprice"));
						cafe.setType(rs.getString("type"));
						cafe.setImage1(rs.getString("image1"));
						cafe.setImage2(rs.getString("image2"));
						cafe.setImage3(rs.getString("image3"));
						cafe.setContent(rs.getString("content"));
						cafe.setRoomcount(rs.getInt("roomcount"));
						cafe.setCafe_del_yn(rs.getString("cafe_del_yn"));
						cafe.setCurl(rs.getString("curl"));
						cafelist.add(cafe);
					} while (rs.next());
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
			return cafelist;
		}
		
		
		
		// �꽑�깮�븳 諛⑺깉異� 移댄럹�뿉 ���븳 �뀒留� 由ъ뒪�듃 蹂댁뿬二쇨린
		// roomListAction.java �뿉�꽌 �궗�슜
		public List<Theme> r_select_theme(int cnum) throws SQLException{
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs= null;
			String sql= "select * from theme where cnum="+cnum;
			List<Theme> list = new ArrayList<Theme>();

			try{
				conn=getConnection();
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				
				while(rs.next()){
					Theme theme = new Theme();
					theme.setCnum(rs.getInt("cnum"));
					theme.setTnum(rs.getInt("tnum"));
					theme.setTname(rs.getString("tname"));
					theme.setTcontent(rs.getString("tcontent"));
					theme.setTimage(rs.getString("timage"));
					theme.setScore1(rs.getDouble("score1"));
					theme.setScore2(rs.getDouble("score2"));
					theme.setScore3(rs.getDouble("score3"));
					theme.setScore4(rs.getDouble("score4"));
					theme.setHeadcount(rs.getInt("headcount"));
					list.add(theme);
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}
			return list;
		}
		
		
		
		
		
		// �꽑�깮�븳 諛⑺깉異� 移댄럹�뿉 ���븳 �젙蹂�(移댄럹�씠由�,�냼媛�,�룊�젏 �벑) 蹂댁뿬二쇨린
		// roomListAction.java �뿉�꽌 �궗�슜
		// roomThemeAction.java �뿉�꽌 �궗�슜
		public Cafe r_list3(int cnum) throws SQLException{
			Cafe cafe = new Cafe();
			/*List<Cafe> list = new ArrayList<Cafe>();*/
			Connection conn = null;
			PreparedStatement pstmt= null;
			ResultSet rs = null;
			String sql = "select * from cafe where cnum="+cnum;
			
			try{
				conn=getConnection();
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					/*Cafe cafe = new Cafe();*/
					cafe.setCnum(rs.getInt("cnum"));
					cafe.setCname(rs.getString("cname"));
					cafe.setCaddress(rs.getString("caddress"));
					cafe.setOpen(rs.getInt("open"));
					cafe.setClose(rs.getInt("close"));
					cafe.setPrice(rs.getInt("price"));
					cafe.setRedprice(rs.getInt("redprice"));
					cafe.setType(rs.getString("type"));
					cafe.setImage1(rs.getString("image1"));
					cafe.setImage2(rs.getString("image2"));
					cafe.setContent(rs.getString("content"));
					cafe.setRoomcount(rs.getInt("roomcount"));
					cafe.setCafe_del_yn(rs.getString("cafe_del_yn"));
					cafe.setCurl(rs.getString("curl"));
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}
			return cafe;
		}


		
		
		
		// 諛⑺깉異� 移댄럹�� �뀒留덇퉴吏� �꽑�깮�뻽�떎硫�, �꽑�깮�븳 �뀒留덉뿉 ���븳 媛꾨왂�븳 �젙蹂� 蹂댁뿬二쇨린
		// roomThemeAction.java �뿉�꽌 �궗�슜
		public Theme r_theme(int cnum, int tnum) throws SQLException{
			Theme theme = new Theme();
			/*List<Cafe> list = new ArrayList<Cafe>();*/
			Connection conn = null;
			PreparedStatement pstmt= null;
			ResultSet rs = null;
			String sql = "select * from theme where cnum="+cnum +" and tnum="+tnum;
			
			try{
				conn=getConnection();
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					theme.setCnum(rs.getInt("cnum"));
					theme.setTnum(rs.getInt("tnum"));
					theme.setTname(rs.getString("tname"));
					System.out.println("CafeDao  tname->"+rs.getString("tname"));
					System.out.println("CafeDaot image->"+rs.getString("timage"));
					theme.setTcontent(rs.getString("tcontent"));
					theme.setTimage(rs.getString("timage"));
					theme.setScore1(rs.getDouble("score1"));
					theme.setScore2(rs.getDouble("score2"));
					theme.setScore3(rs.getDouble("score3"));
					theme.setScore4(rs.getDouble("score4"));
					theme.setHeadcount(rs.getInt("headcount"));
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}
			return theme;
		}
	
		//예약을 위한 멤버 테스트용
		public Member member_into(String id) throws SQLException{
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs= null;
			String sql="select id,name,email,tel,point from member";
			Member member= new Member();
			try{
				conn=getConnection();
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					member.setId(rs.getString("id"));
					member.setName(rs.getString("name"));
					member.setEmail(rs.getString("email"));
					member.setTel(rs.getString("tel"));
					member.setPoint(rs.getInt("point"));
				}
				
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}
			return member;
		}
		
		public int reservation(int cnum, int tnum) throws SQLException{
			int result=0;
			Connection conn = null;
			PreparedStatement pstmt=null;
			String sql = "insert into reservation values(?,?,?,?,'',?,?,?,?,?)";
			Reservation res = new Reservation();
			try{
				conn=getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, res.getResdate());
				pstmt.setInt(2, res.getStarttime());
				pstmt.setString(3, res.getId());
				pstmt.setInt(4, res.getEndtime());
				pstmt.setInt(5, res.getCnum());
				pstmt.setInt(6, res.getTnum());
				pstmt.setString(7, res.getResno());
				pstmt.setInt(8, res.getCount());
				pstmt.setInt(9, res.getPoint());
				result=pstmt.executeUpdate();
				
			}catch(Exception e){
				System.out.println(e.getMessage());
			}finally{
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}
			return result;
		}
}
