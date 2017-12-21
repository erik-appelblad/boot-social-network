<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="page" required="true"
	type="org.springframework.data.domain.Page"%>
<%@ attribute name="url" required="true"%>

<c:if test="${page.totalPages > 1}">

	<div class="pagination">
		<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
			<c:choose>
				<c:when test="${pageNumber != page.number+1}">
					<a href="${url}?p=${pageNumber}"><c:out value="${pageNumber}" /></a>

				</c:when>
				<c:otherwise>
					<strong><c:out value="${pageNumber}" /></strong>
				</c:otherwise>

			</c:choose>
			<c:if test="${pageNumber != page.totalPages}">
				<c:out value="|"></c:out>
			</c:if>
		</c:forEach>

	</div>
</c:if>