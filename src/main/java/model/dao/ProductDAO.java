package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Product;

/**
 * 商品情報DAO
 * @author M.Takahashi
 */
public class ProductDAO {

	/**
	 * 商品情報の全件検索
	 * @return 結果の商品情報リスト
	 * @throws Exception
	 */
	public List<Product> selectAll() throws Exception {

		// 結果格納用
		List<Product> productList = new ArrayList<Product>();

		String sql = "SELECT * FROM m_product ORDER BY product_id ";

		try (Connection con = MyConnection.getConnection();
				Statement stmt = con.createStatement()) {

			try (ResultSet res = stmt.executeQuery(sql)) {
				while (res.next()) {
					String productId = res.getString("product_id");
					String productName = res.getString("product_name");
					int price = res.getInt("price");
					
					// １件分のオブジェクトを生成してリストに追加
					Product product 
						= new Product(productId, productName, price);
					productList.add(product);
				}
			}
		}

		return productList;
	}

}
