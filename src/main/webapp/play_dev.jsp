<%@page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
        
    // 残数の更新処理(残数の取得、更新、保存など)
    // セッション初期化
    // 何回目かのセッション
    if (session.getAttribute("trials") == null) {
        session.setAttribute("trials", 
        		1);
	}
	
	// 石の総数の初期化
    int num_stone_int = 0;
	String num_stone = request.getParameter("num_stone");
    if (session.getAttribute("totalNum") == null) {
    	if(!Utility.isNullOrEmpty(num_stone)) {
    		num_stone_int = Integer.parseInt(num_stone);
    	}
        session.setAttribute("totalNum", 
        		num_stone_int);
	}
	// 1度に取れる数の初期化
	int num_take_int = 0;
    String num_take = request.getParameter("num_take");
    if (session.getAttribute("num_take") == null) {
    	if(!Utility.isNullOrEmpty(num_take)) {
    		num_take_int = Integer.parseInt(num_take);
    	}
        session.setAttribute("num_take", 
        		num_take_int);
	}
    
 // プレイヤーの数の初期化
 	int num_player_int = 0;
     String num_player = request.getParameter("num_player");
     if (session.getAttribute("num_player") == null) {
     	if(!Utility.isNullOrEmpty(num_player)) {
     		num_player_int = Integer.parseInt(num_player);
     	}
         session.setAttribute("num_player", 
         		num_player_int);
 	}
    
  // 石の記号の初期化
     String char_stone = request.getParameter("char_stone");
     if (session.getAttribute("char_stone") == null) {
         session.setAttribute("char_stone", 
         		char_stone);
 	}
     
// 	String num_player = request.getParameter("num_player");
	// セッションの値取得
    int totalNum = (int) session.getAttribute("totalNum");  // 残数用の変数。仮で25をセットしている。必要に応じて変更
//     int player = (int) session.getAttribute("player");
    num_take_int =  (int) session.getAttribute("num_take");
    num_player_int = (int) session.getAttribute("num_player");
    int trials = (int) session.getAttribute("trials");
    char_stone = (String) session.getAttribute("char_stone");
    
    String num = request.getParameter("num");
    int num_int = 0;
    if(!Utility.isNullOrEmpty(num)) {
    	 num_int = Integer.parseInt(num);
    }
    totalNum -= num_int;
//     totalNum = 10;
    // プレイヤーの切替処理(プレイヤーの取得、切替、保存など)
//     String player = (String) session.getAttribute("player");  // プレイヤー用の変数。仮で"A"をセットしている。必要に応じて変更
//     if(Utility.isNullOrEmpty(player)) {
//     	player = "A";
//     } else {
	String[] nameArray = {"", "A", "B", "C", "D", "E", "F", "G", "H", "I",
			"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S",
			"T", "U", "V", "W", "X", "Y", "Z"};
	
   	if(trials == num_player_int + 1) {
   	  trials = 1;
   	}
   	
   	
   	String player = nameArray[trials];
    // 残数が0以下の場合、結果ページへ遷移
    // (responseオブジェクトのsendRedirectメソッドを使用する)
    if(totalNum <= 0) {
    	response.sendRedirect("finish_dev.jsp");
    } else {
    	session.setAttribute("player", player);
        session.setAttribute("totalNum", totalNum);
        session.setAttribute("num_take", num_take_int);
        session.setAttribute("num_player", num_player_int);
        session.setAttribute("num_stone", num_stone_int);
        trials++;
        session.setAttribute("trials", trials);
        session.setAttribute("char_stone", char_stone);
//     	response.sendRedirect("play_dev.jsp");
    }
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java基礎課題</title>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
  <h1>石取りゲーム</h1>

  <div class="info">
    <h2>
      残り：<%=totalNum %>個
    </h2>
    <p class="stone">
      <%
          // todo:このprint分は仮の処理。実装が完了したら削除する。
          // 表示する文字列("●●～")をメソッドを使い取得し、取得した文字列を表示する
//           out.println("●●●●●●●●●●<br>●●●●●●●●●●<br>●●●●●");
      		out.println(Utility.getStoneDisplayHtml(totalNum, char_stone));
      %>
    </p>
  </div>
  <div class="info">
    <h2>
      プレイヤー<%=player %>の番
    </h2>

    <form action="play_dev.jsp">
      <p>
        石を
        <input type="number" name="num" min="1" max="<%=num_take_int %>">
        個取る<br> ※1度に<%=num_take_int %>個取れます。
      </p>
      <button class="btn" type="submit">決定</button>
    </form>
  </div>
</body>
</html>