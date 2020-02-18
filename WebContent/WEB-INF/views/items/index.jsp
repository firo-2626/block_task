<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <div class="sort">
                    <label class="sort">ソート : </label>
                </div>
                <div class="t-btn mt10">
                    <input class="fl" type="submit" value="タイトル">
                    </bk>
                    <input class="fl" type="submit" value="期限">
                    </bk>
                    <input class="mal20 fl" type="submit" value="重要度">
                    </bk>
                </div>
                <p>
                    <a href="<c:url value='/items/new' />">TASK 登録</a>
                </p>
            </div>
            <div class="contents">

                    <c:forEach var="item" items="${items}" varStatus="status">
                        <div class="fl">
                            <div class="card">
                            <label>期限:</label>
                            <c:choose>
                                <c:when test="${empty item.period}">
                                    ------
                                </c:when>
                                <c:otherwise>
                                    <div class="red"></div><c:out value="${item.period}" /></div>
                                </c:otherwise>
                            </c:choose>
                            <label>重要度:</label>
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
                            <div class="btn">
                                <input class="l" type="submit" value="Task完了">
                                </bk>
                                <input class="te" type="submit" value="Task編集">
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
                            <a href="<c:url value='/items/index?page=${i}' />"><c:out
                                    value="${i}" /></a>&nbsp;
                    </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
    </c:param>
</c:import>