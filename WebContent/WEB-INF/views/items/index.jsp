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
            <p><a href="<c:url value='/items/new' />">TASK 登録</a></p>
        </div>
        <div class="contents">
            <!-- block 1 -->
            <div class="block">
                <c:forEach var="item" items="${items}" varStatus="status">
                    <label>期限</label>
                    <c:out value="${item.period}" />
                    <label>重要度</label>
                    <c:out value="${item.importance}" />
                    <br />
                    <p>タスク</p>
                    <c:out value="${item.task}" />
                    <p>行動</p>
                    <c:out value="${item.action}" />
                    <p>必要</p>
                    <c:out value="${item.item}" />
                    <p>備考・メモ</p>
                    <c:out value="${item.content}" />
                    <div class="t-btn mt10">
                        <input class="l" type="submit" value="Task完了">
                        </bk>
                        <input class="te" type="submit" value="Task編集">
                    </div>
                </c:forEach>
            </div>

            <!-- block 2 -->
            <div class="block l">
                <div class="card">
                    <h4 class="l">期限</h4>
                    <input class="l" type="text">
                    <h4>重要度</h4>
                    <h4 class="ct">Title</h4>
                    </bk>
                    <ul>
                        <li>行動</li>
                        <li>必要</li>
                        <li>備考・メモ</li>
                    </ul>
                </div>

                <div class="t-btn mt10">
                    <input class="l" type="submit" value="Task完了">
                    </bk>
                    <a href="<c:url value='/items/show?id=${item.id}' />">Task編集</a>
                </div>
            </div>
        </div>
        </div>

        <div id="pagination">
            （全 ${items_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((items_count - 1) / 15) + 1}" step="1">
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
    </c:param>
</c:import>