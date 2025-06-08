package model;

import java.util.List;

/**
 * 店舗情報を表すクラス
 * @author M.Takahashi
 */
public class Store {
	/******** フィールド ******************************************/
	/**
	 * 店舗名
	 */
	private String name;

	/**
	 * 商品リスト
	 */
	private List<Product> listProd;

	/******** コンストラクタ **************************************/
	/**
	 * フィールド初期化コンストラクタ
	 * @param name
	 * @param listProd
	 */
	public Store(String name, List<Product> listProd) {
		this.name = name;
		this.listProd = listProd;
	}

	/******** メソッド ******************************************/
	/*--------------------getter/setter--------------------*/
	/**
	 * @return listProd
	 */
	public List<Product> getListProd() {
		return listProd;
	}

	/**
	 * @return name
	 */
	public String getName() {
		return name;
	}

	/*--------------------通常メソッド--------------------*/
	/**
	 * 商品を追加する
	 * @param prod 追加する商品
	 */
	public void add(Product prod) {
		listProd.add(prod);
	}

	/**
	 * 特定の商品を除去する
	 * @param index 削除する商品のリスト内のインデックス
	 */
	public void remove(int index) {
		listProd.remove(index);
	}
	
	/**
	 * 全ての商品を除去する
	 */
	public void clear() {
		listProd.clear();
	}

}
