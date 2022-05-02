<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
    //セッションクリア
    session.invalidate();
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
    <h2>条件</h2>
    <form action="play_dev.jsp">
    <p>
     石の総数:
        <input type="number" name="num_stone" min="1" value="25"><br> 
    </p>
    <p>
      1度に取れる石の数：<input type="number" name="num_take" min="1"><br> 
    </p>
	<p>
      プレイヤーの数：<input type="number" name="num_player" min="2" max="26" value="2"><br> 
    </p>
    <p>
    	石の記号：<input type="text" name="char_stone" value="●"><br> 
    </p>
      <button class="btn" type="submit">始める</button>
    </form>
  </div>
</body>
</html>