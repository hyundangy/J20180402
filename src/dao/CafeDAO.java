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
	
	// vr 카페 리스트 불러오기 (vrMainView)
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
	
	public List<Theme> v_select_theme(int cnum) throws SQLException{	// 해당 카페에 맞는 게임 리스트 불러오기(vrList1View)
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
	
	// 카페 번호에 맞는 카페 정보 얻기(vrReserveView)
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
	
	public Theme v_theme(int cnum,int tnum) throws SQLException{	//예약하기 눌렀을 때, 게임 정보 불러오기(vrReserveView)
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
	
	// 메인화면에서 방탈출이미지 클릭시, 방탈출 카페 리스트 보여주기
		// roomMainAction.java 에서 사용
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
		
		//카페 전체 리스트 받아오기
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
		//지역 keyword가 들어가는 카페 리스트 받아오기
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
		
		
		
		// 선택한 방탈출 카페에 대한 테마 리스트 보여주기
		// roomListAction.java 에서 사용
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
		
		
		
		
		
		// 선택한 방탈출 카페에 대한 정보(카페이름,소개,평점 등) 보여주기
		// roomListAction.java 에서 사용
		// roomThemeAction.java 에서 사용
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


		
		
		
		// 방탈출 카페와 테마까지 선택했다면, 선택한 테마에 대한 간략한 정보 보여주기
		// roomThemeAction.java 에서 사용
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
	
}
