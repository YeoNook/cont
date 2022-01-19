
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insert
 */
@WebServlet("/Cafe_sales_Insert")
public class Cafe_sales_Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Cafe_sales_Insert() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		Connection conn = null;
		PreparedStatement pstmt = null;

		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String userid = "ora_user";
		String passcode = "human123";
		String sql = "insert into cafe_sales(code,mobile,menu_code,qty,total,sold_time) values(seq_cafe_sales.nextval,?,?,?,?,sysdate)"; // 주소창에 값을 넣어서 insert하도록 해주는 코드.

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, userid, passcode); // null if connection failed.
			pstmt = conn.prepareStatement(sql);

			System.out.println(request.getParameter("mobile") + "," +request.getParameter("menu_code")+","+
			                   request.getParameter("qty")+","+request.getParameter("total"));
			
			                   
			
		
			
	
			pstmt.setString(1, request.getParameter("mobile"));
			pstmt.setInt(2, Integer.parseInt(request.getParameter("menu_code")));
			pstmt.setInt(3, Integer.parseInt(request.getParameter("qty")));
			pstmt.setInt(4, Integer.parseInt(request.getParameter("total")));
			
			
			pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}