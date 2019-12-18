package Member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/MemberUpdateServlet")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession key = request.getSession();
		String id = (String) key.getAttribute("id");
		try {
            // 3.1 drvier ����
            Class.forName("com.mysql.jdbc.Driver");
 
            // 3.2 DB ���� (localhost ������ , ds20170412 �����ͺ��̽���, root ���̵�, class604
            // ��ȣ)
            //Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.01", "root",
              //      "1234");
 
            // 3.3 SQL �ۼ�.
            String sql = "SELECT * FROM `member1` WHERE mem_id=? ";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
 
            // 3.4 DB�� SQL ����
            ResultSet rs = pstmt.executeQuery();
 
            // 3.5 rs�� ���� �ִ���?
            if (rs.next()) { // ���� �ִ�.
                request.setAttribute("a", rs.getString("mem_id"));
                request.setAttribute("b", rs.getString("mem_name"));
                request.setAttribute("c", rs.getInt("mem_age"));
                request.setAttribute("d", rs.getString("mem_phone"));
            }
 
            request.setAttribute("title", "ȸ����������");
 
            request.getRequestDispatcher("/WEB-INF/memberedit1.jsp").forward(request, response);
 
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
 
	}