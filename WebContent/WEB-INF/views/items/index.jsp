<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="head">
        <link rel="stylesheet" href="<c:url value='/css/index.css' />">
    </c:param>
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <div class="all">
            <div class="header2">
                <h2>BLOCK TASK 一覧</h2>
                <div class="register">
                <p>
                    <a href="<c:url value='/items/new' />">TASK 登録</a>
                </p>
                </div>
                <div class="list">
                <p>
                 <a  href="<c:url value='/items/show' />">TASK LIST</a>
                </p>
                </div>
            </div>
            <div class="contents">

                    <c:forEach var="item" items="${items}" varStatus="status">
                        <div class="fl">
                            <div class="btn">
                                <p>
                <a class="l del" href="#" onclick="confirmDestroy();">タスク 完了</a>
            </p>
            <form method="POST" action="<c:url value='/items/destroy' />">
                <input type="hidden" name="id" value="${item.id}" />
            </form>
            <script>
                function confirmDestroy() {
                    if (confirm("本当に削除してよろしいですか？")) {
                        document.forms[1].submit();
                    }
                }
            </script>
                                <div class="edit">
                                <a class="edit2" href="<c:url value='/items/edit?id=${item.id}' />">TASK 編集</a>
                                </div>
                            </div>
                            <div class="card">
                            <label class="l">期限:</label>
                            <div class="l">
                            <c:choose>
                                <c:when test="${empty item.period}">
                                    ------
                                </c:when>
                                <c:otherwise>
                                    <div class="red"><fmt:formatDate value="${item.period}" pattern="yyyy/MM/dd" /></div>
                                </c:otherwise>
                            </c:choose>
                            </div>
                            <label class="importance">重要度:</label>
                            <c:choose>
                                <c:when test="${empty item.importance}">
                                    --
                                </c:when>
                                <c:otherwise>
                                    <label div class="red"><c:out value="${item.importance}" /></label>
                                </c:otherwise>
                            </c:choose>
                            <br />
                            <p>[タスク]</p>
                            <div class="blue"><c:out value="${item.task}" /></div>
                            <p>[行動]</p>
                            <c:choose>
                                <c:when test="${empty item.action}">
                                    <bk />
                                    ------
                                </c:when>
                                <c:otherwise>
                                    <div class="blue"><c:out value="${item.action}" /></div>
                                </c:otherwise>
                            </c:choose>
                            <p>[必要]</p>
                            <c:choose>
                                <c:when test="${empty item.item}">
                                    <bk />
                                    ------
                                </c:when>
                                <c:otherwise>
                                    <div class="blue"><c:out value="${item.item}" /></div>
                                </c:otherwise>
                            </c:choose>
                            <p>[備考・メモ]</p>
                            <c:choose>
                                <c:when test="${empty item.content}">
                                    <bk />
                                    ------
                                </c:when>
                                <c:otherwise>
                                    <div class="blue"><c:out value="${item.content}" /></div>
                                </c:otherwise>
                            </c:choose>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
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
                            <a href="<c:url value='/items/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
    </c:param>
</c:import>