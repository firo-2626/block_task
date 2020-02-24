<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="head">
        <link rel="stylesheet" href="<c:url value='/css/show.css' />">
    </c:param>
    <c:param name="content">
        <div class="all">
            <div class="title">
                <h2>BLOCK TASK LIST</h2>
            </div>
            <a  class="btn" href="<c:url value='/items/index' />">TASK 一覧</a>
            <table id="item_list">
                <tbody>
                    <tr>
                        <th>ID</th>
                        <th>期限</th>
                        <th>重要度</th>
                        <th>タスク</th>
                        <th>行動</th>
                        <th>必要</th>
                        <th>備考・メモ</th>
                        <th>作成日</th>
                        <th>更新日</th>
                        <th>編集</th>
                    </tr>
                    <c:forEach var="item" items="${items}" varStatus="status">
                        <tr class="row${status.count % 2}">
                            <td><c:out value="${item.id}" /></td>
                            <td><fmt:formatDate value="${item.period}"
                                    pattern="yyyy/MM/dd" /></td>
                            <td><c:out value="${item.importance}" /></td>
                            <td><c:out value="${item.task}" /></td>
                            <td><c:out value="${item.action}" /></td>
                            <td><c:out value="${item.item}" /></td>
                            <td><c:out value="${item.content}" /></td>
                            <td><fmt:formatDate value="${item.created_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td><fmt:formatDate value="${item.updated_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td><a href="<c:url value='/items/edit?id=${item.id}' />">編集</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="cb"></div>
            <div id="pagination">
                （全 ${items_count} 件）<br />
                <c:forEach var="i" begin="1" end="${((items_count - 1) / 15) + 1}"
                    step="1">
                    <c:choose>
                        <c:when test="${i == page}">
                            <c:out value="${i}" />&nbsp;
                    </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/items/index?page=${i}' />"><c:out
                                    value="${i}" /></a>&nbsp;
                    </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
    </c:param>
</c:import>