<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
    <c:param name="head">
        <link rel="stylesheet" href="<c:url value='/css/new.css' />">
    </c:param>
    <c:param name="content">
        <div class="all">
            <h2>Task 登録ページ</h2>

            <form class="form" method="POST" action="<c:url value='/items/create' />">
                <c:import url="_form.jsp" />
                <input class="btn" type="submit" value="Task 登録">
            </form>

            <p>
                <a class="link" href="<c:url value='/items/index' />">BLOCK TASK 一覧</a>
            </p>
        </div>
    </c:param>
</c:import>