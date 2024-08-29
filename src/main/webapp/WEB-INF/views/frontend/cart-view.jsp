<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title}</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="https://i.pinimg.com/236x/56/d9/0d/56d90d66b6ed70bcd57cf711012338ec.jpg" />
<!-- Favicon -->
<link href="${resource}/frontend/new/frontend/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="${resource}/frontend/new/frontend/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="${resource}/backend/dist/css/simplePagination.css"
	rel="stylesheet" />
<!-- Customized Bootstrap Stylesheet -->
<link href="${resource}/frontend/new/frontend/css/style.css" rel="stylesheet">
</head>

<body>
	<div class="container">

	<!-- Cart Start -->
	<c:choose>
		<c:when test="${totalCartFoods > 0}">
			<form method="get">
				<div class="container-fluid pt-5">
					<h3 align="center"
						class="page-title text-truncate text-dark font-weight-medium mb-1">
						<span id="placeOrderSuccess"> Chi tiết hóa đơn bàn <span>${tableNumber}</span></span>
					</h3>
					<div class="row">
						<div class="col-lg-8 table-responsive mb-5" style="margin: auto;">
							<table class="table table-bordered text-center mb-0">
								<thead class="bg-secondary text-dark">
									<tr>
										<th scope="col" class="text-center">No.</th>
										<th scope="col" class="text-center">Image</th>
										<th scope="col" class="text-center">Food</th>
										<th scope="col" class="text-center">Quantity</th>
										<th scope="col" class="text-center">Price</th>
										<th scope="col" class="text-center">Total</th>
									</tr>
								</thead>
								<tbody class="align-middle">
									<c:forEach var="cartFood" items="${cart.cartFoods }"
										varStatus="loop">
										<tr>
											<th scope="row">${loop.index + 1 }</th>
											<td class="align-middle"><img
												src="${resource}/UploadFiles/${cartFood.image}" alt=""
												style="width: 50px;"></td>
											<td>${cartFood.name }</td>
											<td align="center">
												<button type="button"
													onclick="updateProductQuantity(${cartFood.id }, -1)"
													value="-">-</button> <strong><span
													id="productQuantity_${cartFood.id }">${cartFood.quantity }</span></strong>
												<button type="button"
													onclick="updateProductQuantity(${cartFood.id }, 1)"
													value="+">+</button>
											</td>
											<td class="align-middle">
											<fmt:formatNumber value="${cartFood.price}"
													minFractionDigits="0" /><span>vnđ</span></td>
											<td class="align-middle"> <span
												id="totalPrice_${cartFood.id }"> <fmt:formatNumber
														value="${cartFood.price * cartFood.quantity }"
														minFractionDigits="0" />
											</span><span>vnđ</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4">
							<div class="card border-secondary mb-5">
								<div class="card-footer border-secondary bg-transparent">
									<div class="d-flex justify-content-between mt-2">
										<h5 class="font-weight-bold">Tổng hóa đơn:</h5>
										<h5 class="font-weight-bold">
											 <strong><span id="totalCartPriceId">
													<fmt:formatNumber value="${totalCartPrice}"
														minFractionDigits="0"></fmt:formatNumber>
											</span></strong><span>vnđ</span>
										</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="page-breadcrumb" style="margin: auto;">
				<div class="row"></div>
				<div class="row">
					<div class="main__products-title">
						<h1 style="margin-left: 200px">Thông tin khách hàng</h1>
					</div>
				</div>
				<form action="${resource }/cart-view" method="get">
					<div class="row">

						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="form-body">
										<div class="row">

											<div class="col-md-12">
												<div class="form-group mb-4">
													<label for="name">Customer name (*)</label> <input
														type="text" class="form-control" id="txtName"
														name="txtName" placeholder="Tên của bạn" />
												</div>
											</div>
										</div>

										<div class="row">

											<div class="col-md-12">
												<div class="form-group mb-4">
													<label for="mobile">Customer mobile (*)</label> <input
														type="text" class="form-control" id="txtMobile"
														name="txtMobile" placeholder="Số điện thoại"/>
												</div>
											</div>
										</div>
										<div class="row">

											<div class="col-md-12">
												<div class="form-group mb-4">
													<label for="mobile">Bàn số:</label> <input
														type="text" class="form-control" id="txtTableNumber"
														name="txtTableNumber" value="${tableNumber}"/>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group mb-4">
													<a href="${resource }/order/${tableNumber}"
														class="btn btn-primary active" role="button"
														aria-pressed="true">Quay lại</a>
													<button class="btn btn-primary text-white" onclick="_placeOrder()">
														Đặt món</button>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</form>
			</div>
		</c:when>
	</c:choose>
	<!-- Cart End -->
	</div>
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="${resource}/frontend/new/frontend/lib/easing/easing.min.js"></script>
	<script src="${resource}/frontend/new/frontend/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="${resource}/frontend/new/frontend/mail/jqBootstrapValidation.min.js"></script>
	<script src="${resource}/frontend/new/frontend/mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="${resource}/frontend/new/frontend/js/main.js"></script>
	<script type="text/javascript">
		updateProductQuantity = function(_productId, _quantity) {
			let data = {
				id : _productId, //lay theo id
				quantity : _quantity
			};

			//$ === jQuery
			jQuery.ajax({
				url : "/update-product-quantity",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json

				success : function(jsonResult) {
					let totalProducts = jsonResult.totalCartProducts; 
					//Viet lai so luong sau khi bam nut -, +
					$("#productQuantity_" + jsonResult.productId).html(jsonResult.newQuantity); 
					$("#totalCartPriceId").html(jsonResult.totalCartPrice); 
					$("#totalPrice_" + jsonResult.productId).html(jsonResult.totalPrice);
					$("#totalCartProducts").html(jsonResult.totalCartProducts);
				},

				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>

	<script type="text/javascript">
		function _placeOrder() {
			//javascript object
			let data = {				
				name : jQuery("#txtName").val(),
				email : jQuery("#txtEmail").val(), //Get by Id
				mobile : jQuery("#txtMobile").val(),
				address : jQuery("#txtAddress").val(),
			};
			
			//$ === jQuery
			jQuery.ajax({
				url : "/place-order",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					//$("#placeOrderSuccess").html(jsonResult.message);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>
</body>

</html>