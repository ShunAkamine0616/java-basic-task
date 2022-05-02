<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    // セッションからプレイヤー名を取得する
    String player = (String) session.getAttribute("player");
	int num_player = (int) session.getAttribute("num_player");
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
    <%
    if(num_player == 2) {
    	if (player == "A") {
    		player = "B";
    	} else {
    		player = "A";
    	}
    	out.println("勝者：プレイヤー" + player + "！！");
    } else {
    	out.println("敗者：プレイヤー" + player + "！！");
    }
    %>
      
    </h2>
    <form action="index_dev.jsp">
      <button class="btn" type="submit">先頭に戻る</button>
    </form>
  </div>
</body>
</html>