<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta charset="utf-8">
<meta name="author" content="Muhamad Nauval Azhar">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description"
	content="This is a login page template based on Bootstrap 5">
<title>${title}</title>
<link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="https://i.pinimg.com/236x/56/d9/0d/56d90d66b6ed70bcd57cf711012338ec.jpg"
    />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>

<body>
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="text-center my-5">
						<img
							src="https://logowik.com/content/uploads/images/restaurant9491.logowik.com.webp"
							alt="logo" width="200">
					</div>
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4" style="text-align: center;">LOGIN</h1>
							<form method="POST" action="${resource}/login_processing_url"
								class="needs-validation form-sigin">
								<c:if test="${not empty param.login_error }">
									<div class="alert alert-danger" role="alert">Login
										attempt was not successful, try again!!!</div>
								</c:if>
								<div class="mb-3">
									<label class="form-label mb-2 text-muted" for="username">Username</label>
									<input type="text" id="username" name="username"
										class="form-control" />
								</div>

								<div class="form-outline mb-3">
									<label class="form-label" for="password">Password</label> <input
										type="password" id="password" name="password"
										class="form-control" />
								</div>

								<div class="row mb-4">
									<div class="col d-flex justify-content-center">
										<!-- Checkbox -->
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												id="remember-me" name="remember-me" /> <label
												class="form-check-label" for="remember-me"> Remember
												me </label>
										</div>
									</div>

									<div class="col">
										<!-- Simple link -->
										<a href="#!">Forgot password?</a>
									</div>
								</div>
								<div class="row mb-4">
										<div class="col md-5"></div>
										<div class="col md-2" align="right">
											<button type="submit" class="btn btn-primary">Login</button>
										</div>
										<div class="col md-2">
											<a href="${resource}/signup" class="btn btn-primary"
													role="button" aria-pressed="true" style="width: 100px;"> Sign-up </a>
										</div>
										<div class="col md-5"></div>
									</div>
							</form>
						</div>
					</div>
					<div class="text-center mt-5 text-muted">Copyright &copy;
						2017-2021 &mdash; Your Company</div>
				</div>
			</div>
		</div>
	</section>

	<script src="${pageContext.servletContext.contextPath}/login/js/login.js"></script>
</body>
</html>
