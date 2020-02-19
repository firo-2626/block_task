<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
                <h2> ${item.task} の編集</h2>
                <form method="POST" action="<c:url value='/items/update' />">
                    <c:import url="_form.jsp" />
                </form>

                <p><a href="#" onclick="confirmDestroy();">タスク　削除</a></p>
                <form method="POST" action="<c:url value='/items/destroy' />">
                </form>
                <script>
                    function confirmDestroy() {
                        if(confirm("本当に削除してよろしいですか？")) {
                            document.forms[1].submit();
                        }
                    }
                </script>
        <p><a href="<c:url value='/items/index' />">一覧に戻る</a></p>
    </c:param>
</c:import>
