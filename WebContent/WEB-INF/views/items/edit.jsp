<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
<c:param name="head">
        <link rel="stylesheet" href="<c:url value='/css/edit.css' />">
    </c:param>
    <c:param name="content">
        <div class="all">
            <h2 class="target">(id:${item.id}) 【${item.task}】</h2>
            <form method="POST" action="<c:url value='/items/update' />">
                <c:import url="_form.jsp" />
                <input type="hidden" name="id" value="${item.id}" />
                <div class="edit_btn">
                <button class="fl edit" type="submit">編集</button>
                </div>
            </form>

            <p>
                <a class="btn fl del" href="#" onclick="confirmDestroy();">タスク 削除</a>
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
            <p>
                <a class="btn index" href="<c:url value='/items/index' />">一覧に戻る</a>
            </p>
        </div>
    </c:param>
</c:import>
