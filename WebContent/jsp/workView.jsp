<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="thisWork" class="com.darakeru.seichi.model.Work" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作品表示テスト</title>
</head>
<body>
<jsp:getProperty name="thisWork" property="name" />
</body>
</html>