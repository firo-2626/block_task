<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Block Task</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/home.css' />">
    </head>
    <body>

    <div class="title_image">
        <div class="container">
            <h1 class="title">BLOCK&ensp;TASK</h1>

            <!-- リンク先ボタン横並び -->
            <div class="btn">
                <a class="t1" href="<c:url value='/items/index' />">TASK 一覧</a>
                <a class="t2" href="<c:url value='/items/new' />">TASK 登録</a>
                <a class="t3" href="<c:url value='/items/show' />">TASK LIST</a>
            </div>
        </div>
    </div>

    </body>
</html>