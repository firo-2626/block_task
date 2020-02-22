<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
    <meta charset="UTF-8">
    <title>Task List</title>
    <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    ${param.head}
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <a class="task_title" href="<c:url value='/home.html'/>">BLOCK TASK</a>
                </br>
            </div>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
                by Seiki Hosono.
            </div>
        </div>
    </body>
</html>