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


		<!-- Menu Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<form action="${resource}/order/${tableNumber}" method="get">

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
					<c:if test="${tableNumber != null}">
						<h1 class="mb-5">Bàn <span>${tableNumber}</span> đặt món</h1>
					</c:if>
						<h5
							class="section-title ff-secondary text-center text-primary fw-normal mb-5">Food Menu</h5>
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
													<span class="symbol">
													<a href="#"><i class='bx bx-heart'></i></a>
	                                            <button type="button" class="btn btn-success" onclick="addToCart(${food.id }, 1, '${food.name }')">Thêm món
	                                            </button>
	                                        </span>
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
					<div class="row">
					<a href="${resource}/cart-view/${tableNumber}" class="btn btn-warning border col-3 mx-auto mt-3">Thanh toán
				</a>
					</div>
				</form>
			</div>
		</div>
		<!-- Menu End -->
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
		addToCart = function(_foodId, _quantity, _foodName) {		
			alert("Thêm "  + _quantity + " món '" + _foodName + "' thành công ");
			let data = {
				id: _foodId, //lay theo id
				quantity: _quantity,
				name: _foodName,
			};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json",
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					let totalFoods = jsonResult.totalCartFoods;
					$("#totalCartFoods").html(totalFoods);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert(jsonResult.code + ': Đã có lỗi xay ra...!')
				},
			});
		}
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#paging").pagination({
				currentPage: ${foodPagination.currentPage},
				items: ${foodPagination.totalItems},
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