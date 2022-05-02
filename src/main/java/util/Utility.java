package util;

public class Utility {

    /**
     * 引数に指定した文字列がnull、または空文字かを判定します。
     * @param str
     * @return
     */
    public static boolean isNullOrEmpty(String str) {
        if(str == null || str.isEmpty()) {
            return true;
        }else {
            return false;
        }
    }

    /**
     * 石の残数に応じて表示する"●"用のhtmlソースを生成します
     * @return
     */
    // todo:ここにgetStoneDisplayHtmlメソッドを定義
    public static String getStoneDisplayHtml(int totalNum) {
    	String result = "";
    	for (int i = 1; i <= totalNum; i++) {
  			result += "●";
  			if(i % 10 == 0) {
  				result += "<br>";
  			}
  		}
    	return result;
    }
    
    public static String getStoneDisplayHtml(int totalNum, String char_stone) {
    	String result = "";
    	for (int i = 1; i <= totalNum; i++) {
  			result += char_stone;
  			if(i % 10 == 0) {
  				result += "<br>";
  			}
  		}
    	return result;
    }
}
