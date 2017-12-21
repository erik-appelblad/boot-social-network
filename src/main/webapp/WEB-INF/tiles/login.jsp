<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:url var="loginUrl" value="/login" />

<div class="row">
	<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">

		<div class="panel panel-default">

			<div class="panel-heading">

				<div class="panel-title">
					<h1>Login</h1>
				</div>



			</div>

			<div class="panel-body">
				<form method="post" action="${loginUrl}">

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<div class="form-group">
						<input type="text" name="username" placeholder="Username"
							class="form-control" />
					</div>
					<div class="form-group">
						<input type="password" name="password" placeholder="Password"
							class="form-control" />
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-default pull-right">Sign
							in</button>
					</div>

				</form>


			</div>
		</div>
	</div>
</div>