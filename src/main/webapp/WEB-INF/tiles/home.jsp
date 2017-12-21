<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="page-header">
				<h1>The Social Network (no PHP)</h1>
			</div>

			<div class="panel panel-default">

				<div class="panel-heading">

					<div class="panel-title">
						<fmt:formatDate pattern="EEEE d MMMM y 'at' H:mm:s"
							value="${ latestStatusUpdate.added }" />
					</div>
				</div>
				<div class="panel-body">

					${latestStatusUpdate.text}

				</div>
			</div>
		</div>
	</div>
</div>