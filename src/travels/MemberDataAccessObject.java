package travels;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import javax.servlet.http.HttpServletRequest;

public class MemberDataAccessObject {
	private static MemberDataAccessObject instance = new MemberDataAccessObject();
	
	private MemberDataAccessObject(){
	}
	
	public static MemberDataAccessObject getInstance(){
		return instance;
	}
	
	private Connection getConnection(){
		Connection conn = null;
		try{
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e){
			System.out.println("DB Connection Error: " + e.getMessage());
		}
		return conn;
	}
	
	public int idChk(String id){
		int result = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where id = ?";
		try{
			conn = getConnection();
			if(conn!=null) System.out.println("DB Connected");
			else System.out.println("DB Connection failed");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}
			else {
				result = 0;
			}
		} catch(Exception e){
			System.out.println("idChk() Error: " + e.getMessage());
		} finally{
			System.out.println("Disconnecting DB");
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				System.out.println("DB Disconnected");
			} catch(Exception e){
				System.out.println("DB Resource Close Error: " + e.getMessage());
			}
		}
		return result;
	}
	
	public int createMember(Member member, HttpServletRequest request){
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member values(?, ?, ?, ?,?, ?, ?, ?, sysdate)";
		try{
			conn = getConnection();
			if(conn!=null) System.out.println("DB Connected");
			pstmt = conn.prepareStatement(sql);
			System.out.println("ID: " + member.getId());
			System.out.println("PW: " + member.getPassword());
			System.out.println("Firstname: " + member.getFirstname());
			System.out.println("Lastname: " + member.getLastname());
			System.out.println("Birth: " + member.getBirth());
			System.out.println("Gender: " + member.getGender());
			System.out.println("Tel: " + member.getTel());
			System.out.println("Address: " + member.getEmail());
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getFirstname());
			pstmt.setString(4, member.getLastname());
			pstmt.setDate(5, member.getBirth());
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getTel());
			pstmt.setString(8, member.getEmail());
			result = pstmt.executeUpdate();
		} catch(Exception e){
			System.out.println("createMember() Error: " + e.getMessage());
		} finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e){
				System.out.println("DB Resource Close Error: " + e.getMessage());
			}
		}
		return result;
	}
	
	public int login(String id, String password){
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select password from member where id = ?";
		try{
			conn = getConnection();
			if(conn!=null) System.out.println("DB Connected");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getString("password").equals(password)){
					result = 1;
				} 
			}else{
				result = -1;
			}
		} catch(Exception e){
			System.out.println("createMember() Error: " + e.getMessage());
		} finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e){
				System.out.println("DB Resource Close Error: " + e.getMessage());
			}
		}
		return result;
	}
}
