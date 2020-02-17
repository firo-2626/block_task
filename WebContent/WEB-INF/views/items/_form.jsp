<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>

<div style="display:inline-flex">
<label for="task">タスク</label><br />
<input type="text" name="task" value="${item.task}" />

<label for="importance">重要度</label><br />
<input type="text" name="importance" value="${item.importance}" />
</div>
<br /><br />

<div style="display:inline-flex">
<label for="action">行動</label><br />
<input type="text" name="action" value="${item.action}" />

<label for="period">期限</label><br />
<input type="date" name="period" value="${item.period}" />
</div>
<br /><br />

<div style="display:inline-flex">
<label for="item">必要</label><br />
<input type="text" name="item" value="${item.item}" />

<label for="content">備考・メモ</label><br />
<input type="text" name="content" value="${item.content}" />
</div>
<br /><br />