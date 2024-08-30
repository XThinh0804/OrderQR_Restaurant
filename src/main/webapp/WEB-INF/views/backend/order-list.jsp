<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16"
	href="https://cdn.iconscout.com/icon/free/png-256/free-restaurant-icon-download-in-svg-png-gif-file-formats--hotel-food-cafe-canteen-building-pack-buildings-icons-1267764.png?f=webp">
	<title>${title}</title>
	
	<!-- variables -->
	<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
	
	<!-- Custome css resource file -->
	<jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>

</head>

<body>


	<!-- End test -->
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">

		<!-- Topbar header - style you can find in pages.scss -->
		<jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>
		<!-- End Topbar header -->

		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<jsp:include page="/WEB-INF/views/backend/layout/left-slide-bar.jsp"></jsp:include>
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->

		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 align-self-center">
						<h2
							class="page-title text-truncate text-dark font-weight-medium mb-1">Danh sách đơn hàng</h2>
					</div>
				</div>
			</div>
			
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- basic table -->
				<form action="${resource}/admin/order/list" method="get">
					
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<div class="table-responsive">
											
											<!-- Tìm kiếm -->
											<div class="row" style="display: none;">
												<div class="col-md-1">
													<button type="submit" id="btnSearch" name="btnSearch" class="btn btn-primary">Search</button>
												</div>
												<div class="col-md-1">
													<input id="page" name="page" type="hidden"
																		class="form-control" value="${orderSearch.currentPage}" />
												</div>
											</div>
											<!-- Hết tìm kiếm -->
		
											<table id="zero_config"
												class="table table-striped table-bordered no-wrap">
												<thead>
													<tr align="center">
														<th scope="col">No.</th>
														<th scope="col">Thời gian đặt</th>
														<th scope="col">Bàn</th>
														<th scope="col">Người đặt</th>
														<th scope="col">Số điện thoại</th>
														<th scope="col">Tổng tiền</th>
														<th scope="col">Trạng thái</th>
														<th scope="col">Xem chi tiết</th>
														<th scope="col"></th>
	
													</tr>
												</thead>
												<tbody>
													<c:forEach var="order" items="${orders}"
														varStatus="loop">
														<tr>
															<th scope="row">${loop.index + 1 }</th>
															<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy"
																	value="${order.createDate}" /></td>
															<td class="text-center">${order.diningTable}</td>
															<td class="text-center">${order.customer_name }</td>
															<td align="center" class="text-center">${order.customer_mobile }</td>
															<td align="right" class="text-center"><fmt:formatNumber
																	value="${order.total }" minFractionDigits="0"></fmt:formatNumber>
																	<span>vnđ</span>
															</td>
	
															<td class="text-center">${order.order_status.name }</td>
	
															<td class="text-center"><a
																href="${resource}/admin/order/detail/${order.id }"
																role="button" class="btn btn-primary">Chi tiết</a>
															<td class="text-center">
															<a
																href="${resource}/admin/order/edit/${order.id }"
																role="button" class="btn btn-primary">Sửa</a>
															<a
																href="${resource}/admin/order/delete/${order.id }"
																role="button" class="btn btn-danger">Xóa</a>
															</td>
																
														</tr>
													</c:forEach>
												</tbody>
											</table>

											<div class="row">
												<div class="col-md-6" >
													<!-- Phan trang -->
													<div class="pagination float-right">
														<div id="paging"></div>
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
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<jsp:include page="/WEB-INF/views/backend/layout/footer.jsp"></jsp:include>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->

	<!-- Slider js: All Jquery-->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
	
	<script type="text/javascript">
		$( document ).ready(function() {
			$("#paging").pagination({
				currentPage: ${saleOrderSearch.currentPage}, //Trang hien tai
				items: ${saleOrderSearch.totalItems}, //Tong so don hang (total sale orders)
				itemsOnPage: ${saleOrderSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
	
</body>

</html>