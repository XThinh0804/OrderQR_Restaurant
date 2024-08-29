<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<link rel="icon" type="image/png" sizes="16x16"
	href="https://cdn.iconscout.com/icon/free/png-256/free-restaurant-icon-download-in-svg-png-gif-file-formats--hotel-food-cafe-canteen-building-pack-buildings-icons-1267764.png?f=webp">
<title>${title}</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<!-- Favicon -->
<link href="${resource}/frontend/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="${resource}/frontend/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${resource}/frontend/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${resource}/frontend/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="${resource}/frontend/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${resource}/frontend/css/style.css" rel="stylesheet">
<link href="${resource}/backend/dist/css/simplePagination.css"
	rel="stylesheet">
</head>

<body>
	<div class="container-xxl bg-white p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<!-- Navbar & Hero Start -->
		<div class="container-xxl position-relative p-0">
			<nav
				class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
				<a href="" class="navbar-brand p-0">
					<h1 class="text-primary m-0">
						<i class="fa fa-utensils me-3"></i>Restaurant
					</h1> <!-- <img src="${resource}/frontend/img/logo.png" alt="Logo"> -->
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse"
					style="position: absolute; right: 20px;">
					<c:if test="${loginedUser.name == null}">
					<a href="${resource}/signup" class="btn btn-primary py-2 px-4"
						style="margin-right: 20px">Đăng ký</a> <a href="${resource}/login"
						class="btn btn-primary py-2 px-4">Đăng nhập</a>
						</c:if>
						<c:if test="${loginedUser.name != null}">
							<div class="navbar-nav ml-auto py-0">
							<img src="https://i.pinimg.com/564x/57/00/c0/5700c04197ee9a4372a35ef16eb78f4e.jpg" alt="user" class="rounded-circle"
                            width="40">
                        <span class="ml-2 d-none d-lg-inline-block"> <span
                                class="text-white">${loginedUser.name}</span>
								 <a href="${resource}/logout" class="btn btn-primary py-2 px-4"
						style="margin-right: 20px">Đăng xuất</a>
							</div>
						</c:if>
				</div>
			</nav>

			<div class="container-xxl py-5 bg-dark hero-header mb-5">
				<div class="container my-5 py-5">
					<div class="row align-items-center g-5">
						<div class="col-lg-6 text-center text-lg-start">
							<h1 class="display-3 text-white animated slideInLeft">
								Enjoy Our<br>Delicious Meal
							</h1>
							<p class="text-white animated slideInLeft mb-4 pb-2">Tempor
								erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam
								amet diam et eos. Clita erat ipsum et lorem et sit, sed stet
								lorem sit clita duo justo magna dolore erat amet</p>
							<a href=""
								class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">Book
								A Table</a>
						</div>
						<div class="col-lg-6 text-center text-lg-end overflow-hidden">
							<img class="img-fluid" src="${resource}/frontend/img/hero.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Navbar & Hero End -->


		<!-- About Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="row g-5 align-items-center">
					<div class="col-lg-6">
						<div class="row g-3">
							<div class="col-6 text-start">
								<img class="img-fluid rounded w-100 wow zoomIn"
									data-wow-delay="0.1s"
									src="${resource}/frontend/img/about-1.jpg">
							</div>
							<div class="col-6 text-start">
								<img class="img-fluid rounded w-75 wow zoomIn"
									data-wow-delay="0.3s"
									src="${resource}/frontend/img/about-2.jpg"
									style="margin-top: 25%;">
							</div>
							<div class="col-6 text-end">
								<img class="img-fluid rounded w-75 wow zoomIn"
									data-wow-delay="0.5s"
									src="${resource}/frontend/img/about-3.jpg">
							</div>
							<div class="col-6 text-end">
								<img class="img-fluid rounded w-100 wow zoomIn"
									data-wow-delay="0.7s"
									src="${resource}/frontend/img/about-4.jpg">
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<h5
							class="section-title ff-secondary text-start text-primary fw-normal">About
							Us</h5>
						<h1 class="mb-4">
							Welcome to <i class="fa fa-utensils text-primary me-2"></i>Restaurant
						</h1>
						<p class="mb-4">Đến với nhà hàng, khách hàng sẽ thấy được không gian thoáng đãng, có những phòng riêng biệt dành cho hội họp hay sinh nhật với màu trầm và xanh lá chủ đạo.</p>
						<p class="mb-4">Sẽ gợi nhớ cho những người con xa quê cảm nhận được như mình đang trở về nhà</p>
						
					</div>
				</div>
			</div>
		</div>
		<!-- About End -->


		<!-- Menu Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<form action="${resource}" method="get">

					<div class="col-md-6" style="display: none;">
						<div class="form-group mb-4">
							<label>Current page</label> <input id="currentPage"
								name="currentPage" class="form-control"
								value="${foodPagination.currentPage }">
						</div>
					</div>
					<div class="col-md-1" style="display: none;">
						<button type="submit" id="btnSearch" name="btnSearch"
							class="btn btn-primary">Search</button>
					</div>
					<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
						<h5
							class="section-title ff-secondary text-center text-primary fw-normal"
							style="padding-bottom: 20px;">Food Menu</h5>
					</div>
					<div class="tab-class text-center wow fadeInUp"
						data-wow-delay="0.1s">
						<div class="tab-content">
							<div id="tab-1" class="tab-pane fade show p-0 active">
								<div class="row g-4">
									<c:forEach var="food" items="${foods}">
										<div class="col-lg-6">
											<div class="d-flex align-items-center">
												<img class="flex-shrink-0 img-fluid rounded"
													src="${resource}/UploadFiles/${food.image}" alt=""
													style="width: 80px;">
												<div class="w-100 d-flex flex-column text-start ps-4">
													<h5
														class="d-flex justify-content-between border-bottom pb-2">
														<span>${food.name}</span>
														<div>
															<fmt:formatNumber value="${food.price }"
																minFractionDigits="0"></fmt:formatNumber>
															<small>vnđ</small>
														</div>
													</h5>
													<small class="fst-italic">${food.description}</small>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="margin-left: 550px;margin-top: 30px;">

						<%-- Phan trang --%>
						<div class="col-md-6">
							<div class="pagination float-right" style="width: 200px;">
								<div id="paging"></div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- Menu End -->


		<!-- Reservation Start -->
		<div class="container-xxl py-5 px-0 wow fadeInUp"
			data-wow-delay="0.1s">
			<div class="row g-0">
				<div class="col-md-6">
					<div class="video">
						<button type="button" class="btn-play" data-bs-toggle="modal"
							data-src="https://www.youtube.com/embed/DWRcNpR6Kdc"
							data-bs-target="#videoModal">
							<span></span>
						</button>
					</div>
				</div>
				<div class="col-md-6 bg-dark d-flex align-items-center">
					<div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
						<h5
							class="section-title ff-secondary text-start text-primary fw-normal">Reservation</h5>
						<h1 class="text-white mb-4">Book A Table Online</h1>
						<form>
							<div class="row g-3">
								<div class="col-md-6">
									<div class="form-floating">
										<input type="text" class="form-control" id="name"
											placeholder="Your Name"> <label for="name">Your
											Name</label>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-floating">
										<input type="email" class="form-control" id="email"
											placeholder="Your Email"> <label for="email">Your
											Email</label>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-floating date" id="date3"
										data-target-input="nearest">
										<input type="text" class="form-control datetimepicker-input"
											id="datetime" placeholder="Date & Time" data-target="#date3"
											data-toggle="datetimepicker" /> <label for="datetime">Date
											& Time</label>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-floating">
										<select class="form-select" id="select1">
											<option value="1">People 1</option>
											<option value="2">People 2</option>
											<option value="3">People 3</option>
										</select> <label for="select1">No Of People</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<textarea class="form-control" placeholder="Special Request"
											id="message" style="height: 100px"></textarea>
										<label for="message">Special Request</label>
									</div>
								</div>
								<div class="col-12">
									<button class="btn btn-primary w-100 py-3" type="submit">Book
										Now</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="videoModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content rounded-0">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- 16:9 aspect ratio -->
						<div class="ratio ratio-16x9">
							<iframe class="embed-responsive-item" src="" id="video"
								allowfullscreen allowscriptaccess="always" allow="autoplay"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Reservation Start -->


		<!-- Team Start -->
		<div class="container-xxl pt-5 pb-3">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h5
						class="section-title ff-secondary text-center text-primary fw-normal">Team
						Members</h5>
					<h1 class="mb-5">Our Master Chefs</h1>
				</div>
				<div class="row g-4">
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item text-center rounded overflow-hidden">
							<div class="rounded-circle overflow-hidden m-4">
								<img class="img-fluid" src="${resource}/frontend/img/team-1.jpg"
									alt="">
							</div>
							<h5 class="mb-0">Full Name</h5>
							<small>Designation</small>
							<div class="d-flex justify-content-center mt-3">
								<a class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-facebook-f"></i></a> <a
									class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-twitter"></i></a> <a
									class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-instagram"></i></a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
						<div class="team-item text-center rounded overflow-hidden">
							<div class="rounded-circle overflow-hidden m-4">
								<img class="img-fluid" src="${resource}/frontend/img/team-2.jpg"
									alt="">
							</div>
							<h5 class="mb-0">Full Name</h5>
							<small>Designation</small>
							<div class="d-flex justify-content-center mt-3">
								<a class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-facebook-f"></i></a> <a
									class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-twitter"></i></a> <a
									class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-instagram"></i></a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
						<div class="team-item text-center rounded overflow-hidden">
							<div class="rounded-circle overflow-hidden m-4">
								<img class="img-fluid" src="${resource}/frontend/img/team-3.jpg"
									alt="">
							</div>
							<h5 class="mb-0">Full Name</h5>
							<small>Designation</small>
							<div class="d-flex justify-content-center mt-3">
								<a class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-facebook-f"></i></a> <a
									class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-twitter"></i></a> <a
									class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-instagram"></i></a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
						<div class="team-item text-center rounded overflow-hidden">
							<div class="rounded-circle overflow-hidden m-4">
								<img class="img-fluid" src="${resource}/frontend/img/team-4.jpg"
									alt="">
							</div>
							<h5 class="mb-0">Full Name</h5>
							<small>Designation</small>
							<div class="d-flex justify-content-center mt-3">
								<a class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-facebook-f"></i></a> <a
									class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-twitter"></i></a> <a
									class="btn btn-square btn-primary mx-1" href=""><i
									class="fab fa-instagram"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Team End -->


		<!-- Testimonial Start -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
				<div class="text-center">
					<h5
						class="section-title ff-secondary text-center text-primary fw-normal">Testimonial</h5>
					<h1 class="mb-5">Our Clients Say!!!</h1>
				</div>
				<div class="owl-carousel testimonial-carousel">
					<div class="testimonial-item bg-transparent border rounded p-4">
						<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
						<p>Thái độ phục vụ niềm nở, đồ ăn ngon, không gian đẹp và sang
							trọng</p>
						<div class="d-flex align-items-center">
							<img class="img-fluid flex-shrink-0 rounded-circle"
								src="${resource}/frontend/img/testimonial-1.jpg"
								style="width: 50px; height: 50px;">
							<div class="ps-3">
								<h5 class="mb-1">Khánh Huyền</h5>
							</div>
						</div>
					</div>
					<div class="testimonial-item bg-transparent border rounded p-4">
						<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
						<p>Nhà hàng phục vụ nhiệt tình, chu đáo.Thực phẩm đảm bảo vệ
							sinh, thức ăn ngon miệng</p>
						<div class="d-flex align-items-center">
							<img class="img-fluid flex-shrink-0 rounded-circle"
								src="${resource}/frontend/img/testimonial-2.jpg"
								style="width: 50px; height: 50px;">
							<div class="ps-3">
								<h5 class="mb-1">Mạnh Hùng</h5>
							</div>
						</div>
					</div>
					<div class="testimonial-item bg-transparent border rounded p-4">
						<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
						<p>Rất hài lòng về cách phục vụ và đồ ăn của nhà hàng.</p>
						<div class="d-flex align-items-center">
							<img class="img-fluid flex-shrink-0 rounded-circle"
								src="${resource}/frontend/img/testimonial-3.jpg"
								style="width: 50px; height: 50px;">
							<div class="ps-3">
								<h5 class="mb-1">Đức Triệu</h5>
							</div>
						</div>
					</div>
					<div class="testimonial-item bg-transparent border rounded p-4">
						<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
						<p>Tôi thường đưa gia đình đến ăn tại đây và rất hài lòng về
							nhà hàng này.</p>
						<div class="d-flex align-items-center">
							<img class="img-fluid flex-shrink-0 rounded-circle"
								src="${resource}/frontend/img/testimonial-4.jpg"
								style="width: 50px; height: 50px;">
							<div class="ps-3">
								<h5 class="mb-1">Phương Nga</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Testimonial End -->


		<!-- Footer Start -->
		<div
			class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn"
			data-wow-delay="0.1s">
			<div class="container py-5">
				<div class="row g-5">
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Company</h4>
						<a class="btn btn-link" href="">About Us</a> <a
							class="btn btn-link" href="">Contact Us</a> <a
							class="btn btn-link" href="">Reservation</a> <a
							class="btn btn-link" href="">Privacy Policy</a> <a
							class="btn btn-link" href="">Terms & Condition</a>
					</div>
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
						<p class="mb-2">
							<i class="fa fa-map-marker-alt me-3"></i>Lang Street, Ha Noi,
							Viet Nam
						</p>
						<p class="mb-2">
							<i class="fa fa-phone-alt me-3"></i>+84 984 955 623
						</p>
						<p class="mb-2">
							<i class="fa fa-envelope me-3"></i>thinha4k54cma@gmail.com
						</p>
						<div class="d-flex pt-2">
							<a class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-youtube"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
						<h5 class="text-light fw-normal">Monday - Saturday</h5>
						<p>09AM - 09PM</p>
						<h5 class="text-light fw-normal">Sunday</h5>
						<p>10AM - 08PM</p>
					</div>
					<div class="col-lg-3 col-md-6">
						<h4
							class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
						<p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
						<div class="position-relative mx-auto" style="max-width: 400px;">
							<input class="form-control border-primary w-100 py-3 ps-4 pe-5"
								type="text" placeholder="Your email">
							<button type="button"
								class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End -->


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${resource}/frontend/lib/wow/wow.min.js"></script>
	<script src="${resource}/frontend/lib/easing/easing.min.js"></script>
	<script src="${resource}/frontend/lib/waypoints/waypoints.min.js"></script>
	<script src="${resource}/frontend/lib/counterup/counterup.min.js"></script>
	<script src="${resource}/frontend/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${resource}/frontend/lib/tempusdominus/js/moment.min.js"></script>
	<script src="${resource}/backend/dist/js/jquery.simplePagination.js"></script>
	<script
		src="${resource}/frontend/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="${resource}/frontend/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="${resource}/frontend/js/main.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#paging").pagination({
				currentPage: ${foodPagination.currentPage}, //Trang hien tai
				items: ${foodPagination.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${foodPagination.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#currentPage').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
</body>

</html>