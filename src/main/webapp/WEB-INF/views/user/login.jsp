<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="login">
		<h1>Login</h1>
		<p>
			<c:out value="${error}" />
		
			<c:out value="${logout}" />
		</p>

		<form method='post' action="/login">
			<div>
				<input type='text' name='username' value='admin90'>
			</div>
			<div>
				<input type='password' name='password' value='pw90'>
			</div>
			<div>
				<div>
					<input type='checkbox' name='remember-me'> Remember Me
				</div>

				<div>
					<input type='submit'>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</div>
		</form>
	</div>

</body>
</html>