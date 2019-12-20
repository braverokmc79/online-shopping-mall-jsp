package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;


public class ProductMgr {
	
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/online-shopping-mall-jsp/webContent/img/product/";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10*1024*1024;
	
	
	public ProductMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Product Detail
		public ProductBean getProduct(int p_code) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			ProductBean bean = new ProductBean();
			try {
				con = pool.getConnection();
				sql = "select * from product_mst_tb where p_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, p_code);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setP_code(rs.getInt(1));
					bean.setP_name(rs.getString(2));
					bean.setP_price(rs.getInt(3));
					bean.setP_main_pht_name(rs.getString(4));
					bean.setP_main_pht_size(rs.getInt(5));
					bean.setP_detail_pht_name(rs.getString(6));
					bean.setP_detail_pht_size(rs.getInt(7));
					bean.setP_info_pht_name(rs.getString(8));
					bean.setP_info_pht_size(rs.getInt(9));
					bean.setP_date(rs.getString(10));
					bean.setP_on_sale(rs.getInt(11));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
		
	//get alllist
	public Vector<ProductBean> getAllList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> vlist = new Vector<ProductBean>();		
		try {
			con = pool.getConnection();
			sql = "select p_name, p_price, p_main_pht_name from product_mst_tb WHERE p_on_sale like '1' order by p_date";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();				
				bean.setP_name(rs.getString(1));
				bean.setP_price(rs.getInt(2));
				bean.setP_main_pht_name(rs.getString(3));
				vlist.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}		
	//get best product
	public Vector<ProductBean> getBestList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> blist = new Vector<ProductBean>();		
		try {
			con = pool.getConnection();
			sql = "SELECT p_name, p_price, p.p_main_pht_name, p.p_on_sale "
				+ "FROM product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code "
				+ "GROUP BY p.p_code having p.p_on_sale LIKE '1' "
				+ "ORDER BY (SUM(s.st_enter_qty)-SUM(s.st_ava_qty)) DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();				
				bean.setP_name(rs.getString(1));
				bean.setP_price(rs.getInt(2));
				bean.setP_main_pht_name(rs.getString(3));
				blist.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return blist;
	}
	//get new item
	public Vector<ProductBean> getNewList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> nlist = new Vector<ProductBean>();		
		try {
			con = pool.getConnection();
			sql = "SELECT p_name, p_price, p_main_pht_name "
				+ "FROM product_mst_tb WHERE p_on_sale LIKE '1' ORDER BY p_date DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();				
				bean.setP_name(rs.getString(1));
				bean.setP_price(rs.getInt(2));
				bean.setP_main_pht_name(rs.getString(3));
				nlist.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return nlist;
	}	
	
	//get review high list
	public Vector<ProductBean> getReviewList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> rlist = new Vector<ProductBean>();		
		try {
			con = pool.getConnection();
			sql = "SELECT p.p_name, p.p_price, p.p_main_pht_name, p.p_on_sale, O.o_total_amount "
				+ "FROM product_mst_tb p JOIN review_tb r ON p.p_code = r.p_code "
				+ "GROUP BY p.p_code having p_on_sale like '1' ORDER BY COUNT(r.p_code) DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();				
				bean.setP_name(rs.getString(1));
				bean.setP_price(rs.getInt(2));
				bean.setP_main_pht_name(rs.getString(3));
				rlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return rlist;
	}
  
	//price high product
	public Vector<ProductBean> getHighList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> phlist = new Vector<ProductBean>();		
		try {
			con = pool.getConnection();
			sql = "SELECT p_name, p_price, p_main_pht_name "
			    + "FROM product_mst_tb where p_on_sale like '1' ORDER BY p_price DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();				
				bean.setP_name(rs.getString(1));
				bean.setP_price(rs.getInt(2));
				bean.setP_main_pht_name(rs.getString(3));
				phlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return phlist;
	}

	//model name list(for search bar ajax)
	public Vector<String> getProductList(String searchValue) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<String> vlist = new Vector<String>();
		String sql = null;
		System.out.println("searchdata :" +searchValue);
		try {
			con = pool.getConnection();
			sql = "select p_name from PRODUCT_MST_TB where p_name like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchValue+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vlist.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
    
	//pricelowlist
	public Vector<ProductBean> getLowList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;  
		Vector<ProductBean> pllist = new Vector<ProductBean>();		
		try {
			con = pool.getConnection();
			sql =  "SELECT p_name, p_price, p_main_pht_name "
				+ "FROM product_mst_tb where p_on_sale like '1'	ORDER BY p_price";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();				
				bean.setP_name(rs.getString(1));
				bean.setP_price(rs.getInt(2));
				bean.setP_main_pht_name(rs.getString(3));
				pllist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return pllist;
	}
	
}
