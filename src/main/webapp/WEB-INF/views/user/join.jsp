<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="join">
		<h1>회원가입</h1>

		<form method="post" id="joinForm"> <!-- join Get -> join Post -->
			<ul>
				<li><label for="userName">ID</label><input type="text"
					id="username" name="username"></li>
				<li><label for="realName">이름</label><input type="text"
					id="realname" name="realname"></li>
				<li><label for="password">비밀번호</label><input type="password"
					id="password" name="password"></li>
				<li><label for="email">이메일</label><input type="text" id="email"
					name="email"></li>
				<li><label for="nickName">닉네임</label><input type="text"
					id="nickName" name="nickName"></li>
			</ul>
				<button class="sbmbt" type="submit">가입</button>
		</form>

	</div>
</body>
</html>