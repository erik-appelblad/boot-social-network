<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="row">
	<div class="col-md-8 col-md-offset-2">

		<div class="panel panel-default">

			<div class="panel-heading">

				<div class="panel-title">
					<h1>Edit status update</h1>
				</div>
			</div>
			<div class="panel-body">
				<form:form modelAttribute="statusUpdate">

					<form:input path="id" type="hidden" />
					<form:input path="added" type="hidden" />

					<c:if test="${not empty errorTextVisible }">
						<div class="alert alert-danger">
							<form:errors path="text" />

						</div>
					</c:if>

					<div class="form-group">
						<form:textarea path="text" name="text" rows="10" cols="50"
							class="form-control"></form:textarea>
					</div>

					<button type="submit" class="btn btn-default">Save</button>
				</form:form>
			</div>

		</div>

	</div>


</div>
<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
<script>
	tinymce.init({
		selector : 'textarea'
	});
</script>