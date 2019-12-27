package admin;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.NoticeBean;
import member.DBConnectionMgr;

public class AdminMgr {

	private DBConnectionMgr pool;

	public static final String SAVEFOLDER = "C:/Jsp/myapp/WebContent/board/fileupload/";
	public static final String ENCTYPE = "EUC-KR";
	public static int MAXSIZE = 10*1024*1024;

	public AdminMgr() {
		pool = DBConnectionMgr.getInstance(); 
	
	}
	//notice
	
	//Board Insert
		public void insertBoard(HttpServletRequest req) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			try {
				///////���Ͼ��ε�//////////////////////////
				File dir = new File(SAVEFOLDER);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				MultipartRequest multi = 
						new MultipartRequest(req, SAVEFOLDER, MAXSIZE, 
								ENCTYPE, new DefaultFileRenamePolicy());
				String n_file_name = null;
				int n_file_size = 0;
				//����ڰ� ������ ���ε带 �� ���
				if(multi.getFilesystemName("n_file_name")!=null) {
					n_file_name = multi.getFilesystemName("n_file_name");
					n_file_size = (int)multi.getFile("n_file_name").length();
				}
				////�Խù� contentType : text, html//////////
				String n_content = multi.getParameter("n_content");//�Խù� ����
				if(multi.getParameter("contentType").equals("TEXT")) {
					n_content = UtilMgr.replace(n_content, "<", "&lt;");
				}
				///////////////////////////////////////
				con = pool.getConnection();
				/////ref��//////////////////////////////
				sql = "select max(n_index) from notice_tb";//���� ���� num��
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int ref = 0;
				if(rs.next())
					ref = rs.getInt(1) + 1;//������ ���� num���� 1�� ����.
				pstmt.close();
				//////////////////////////////////////////////
				sql = "insert notice_tb(n_id,n_content,n _title,";
				sql += "n_date,n_file_name,n_file_size)";
				sql += "values(?, ?, ?, now(), ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("n_id"));
				pstmt.setString(2, n_content);
				pstmt.setString(3, multi.getParameter("n_title"));
				pstmt.setInt(4, n_file_size);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
		
		//Board Total Count(�� �Խù� ����)
		public int getTotalCount(String keyField, String keyWord) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int totalCount = 0;
			try {
				con = pool.getConnection();
				if(keyWord.trim().equals("")||keyWord==null) {
					//�˻��� �ƴѰ��
					sql = "select count(*) from notice_tb";
					pstmt = con.prepareStatement(sql);
				}else{
					//�˻��� ���
					sql = "select count(*) from notice_tb where " + keyField +" like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyWord+"%");
				}
				rs = pstmt.executeQuery();
				if(rs.next())
					totalCount = rs.getInt(1);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return totalCount;
		}
		
		//Board List(����Ʈ) : �˻� ����
		public Vector<NoticeBean> getBoardList(String keyField, String keyWord, int start, int cnt){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<NoticeBean> vlist = new Vector<NoticeBean>();
			try {
				con = pool.getConnection();
				if(keyWord.trim().equals("")||keyWord==null) {
					//�˻��� �ƴ� ���
					sql = "select * from notice_tb order by ref desc, pos"
							+ " limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);//�Խù� ���۹�ȣ
					pstmt.setInt(2, cnt);//������ �Խù� ����
				}else{
					//�˻��� ���
					sql = "select * from notice_tb where "+ keyField 
							+" like  ? order by ref desc, pos limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyWord+"%");
					pstmt.setInt(2, start);//�Խù� ���۹�ȣ
					pstmt.setInt(3, cnt);//������ �Խù� ����
				}
				rs = pstmt.executeQuery();
				while(rs.next()) {
					NoticeBean bean = new NoticeBean();
					bean.setN_index(rs.getInt("n_index"));
					bean.setN_id(rs.getString("n_id"));
					bean.setN_category(rs.getString("n_category"));
					bean.setN_title(rs.getString("n_title"));
					bean.setN_content(rs.getString("n_content"));
					bean.setN_date(rs.getString("n_date"));
					bean.setN_file_name(rs.getString("n_file_name"));
					bean.setN_file_size(rs.getInt("n_file_size"));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
		//Board Get(�Ѱ��� �Խù�)
		public NoticeBean getBoard(int n_index) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			NoticeBean bean = new NoticeBean();
			try {
				con = pool.getConnection();
				sql = "select * from notice_tb where n_index = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, n_index);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setN_index(rs.getInt("n_index"));
					bean.setN_id(rs.getString("n_id"));
					bean.setN_category(rs.getString("n_category"));
					bean.setN_title(rs.getString("n_title"));
					bean.setN_content(rs.getString("n_content"));
					bean.setN_date(rs.getString("n_date"));
					bean.setN_file_name(rs.getString("n_file_name"));
					bean.setN_file_size(rs.getInt("n_file_size"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
		
		//Count Up(��ȸ�� ����)
		public void upCount(int n_index) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "update notice_tb set count = count +1 where n_index = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, n_index);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//Board Delete : ���ε� ���� ����
		public void deleteBoard(int n_index) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "select n_file_name from notice where n_index=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, n_index);
				rs = pstmt.executeQuery();
				if(rs.next()&&rs.getString(1)!=null) {
					if(!rs.getString(1).equals("")) {
						File f = new File(SAVEFOLDER+rs.getString(1));
						if(f.exists()) {
							//���ϻ������
							UtilMgr.delete(SAVEFOLDER+rs.getString(1));
						}
					}
				}
				pstmt.close();
				sql = "delete from notice_tb where n_index=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, n_index);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
		
		//Board Update(n_id, n_title, n_content 3���� ����)
		public void updateBoard(NoticeBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "update notice_tb set n_id=?, n_title=?, n_content=? "
						+ "where n_index = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getN_id());
				pstmt.setString(2, bean.getN_title());
				pstmt.setString(3, bean.getN_content());
				pstmt.setInt(4, bean.getN_index());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
}
