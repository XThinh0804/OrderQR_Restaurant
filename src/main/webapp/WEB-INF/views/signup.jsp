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
							<h1 class="fs-4 card-title fw-bold mb-4" style="text-align: center;">Sign up</h1>
							<form class="mx-1 mx-md-4" action="${resource }/register" method="post">
								<div class="d-flex flex-row align-items-center mb-4">
									<i class="fas fa-user fa-lg me-3 fa-fw"></i>
									<div class="form-outline flex-fill mb-0">
										<label class="form-label" for="username">User name</label> <input
											type="text" id="username" name="username"
											class="form-control" />
									</div>
								</div>

								<div class="d-flex flex-row align-items-center mb-4">
													<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="password">Password</label>
														<input type="password" id="password" name = "password"
															class="form-control" /> 
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<i class="fas fa-key fa-lg me-3 fa-fw"></i>
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="retypepassword">Retype password</label>
														<input type="password" id="retypepassword" name = "retypepassword"
															class="form-control" /> 
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<i class="fas fa-user fa-lg me-3 fa-fw"></i>
													<div class="form-outline flex-fill mb-0">
														<label class="form-label"for="mobile">Mobile</label>
														<input type="text" id="mobile" name = "mobile"
															class="form-control" /> 
													</div>
												</div>

												<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
													<button type="submit" class="btn btn-primary btn-lg">Register</button>
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
