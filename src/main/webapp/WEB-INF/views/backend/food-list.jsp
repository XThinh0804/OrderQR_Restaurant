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
					<div class="col-7 align-self-center">
						<h2
							class="page-title text-truncate text-dark font-weight-medium mb-1">Danh
							sách món ăn</h2>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- basic table -->
				<div class="row">
					<div class="col-12">
						<div class="card">

							<div class="card-body">
								<form action="${resource}/admin/food/list" method="get">
									<div class="table-responsive">

										<div class="row">
											<div class="col-md-2">
												<div class="form-group mb-4">
													<a href="${resource }/admin/food/add" role="button"
														class="btn btn-primary">Thêm món ăn</a>
												</div>
											</div>
											<div class="col-md-6" style="display: none;">
												<div class="form-group mb-4">
													<label>Current page</label> <input id="currentPage"
														name="currentPage" class="form-control"
														value="${foodPagination.currentPage }">
												</div>
											</div>
											<div class="col-md-4" style="display: none;">
												<div class="form-group mb-4">
													<h3>Total foods: &nbsp; ${foodPagination.totalItems }</h3>
												</div>
											</div>
										<div class="col-md-1" style="display: none;">
												<button type="submit" id="btnSearch" name="btnSearch" class="btn btn-primary">Search</button>
											</div>
										</div>
										<table id="zero_config"
											class="table table-striped table-bordered no-wrap">
											<thead>
												<tr align="center">
													<th scope="col">No</th>
													<th scope="col">Name</th>
													<th scope="col">Price</th>
													<th scope="col">Image</th>
													<th scope="col">Description</th>
													<th scope="col">Create date</th>
													<th scope="col">Update date</th>
													<th scope="col">Actions</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="food" items="${foods}" varStatus="loop">
													<tr>
														<th scope="row">${loop.index + 1}</th>
														<td>${food.name }</td>
														<td align="right"><fmt:formatNumber
																value="${food.price }" minFractionDigits="0"></fmt:formatNumber>
															<span>vnđ</span></td>

														<td><img width="90px" height="80px"
															src="${resource}/UploadFiles/${food.image}"
															class="light-logo"></td>

														<td>${food.description }</td>

														<td><fmt:formatDate value="${food.createDate }"
																pattern="dd-MM-yyyy" /></td>
														<td><fmt:formatDate value="${food.updateDate }"
																pattern="dd-MM-yyyy" /></td>
														<td><a href="${resource }/admin/food/edit/${food.id}"
															role="button" class="btn btn-primary">Sửa</a> <a
															href="${resource }/admin/food/delete/${food.id}"
															role="button" class="btn btn-secondary">Xóa</a></td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>

											</tfoot>
										</table>

										<div class="row">

											<%-- Phan trang --%>
											<div class="col-md-6">
												<div class="pagination float-right">
													<div id="paging"></div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
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

	<!-- End Wrapper -->
	<!-- ============================================================== -->

	<!-- Slider js: All Jquery-->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>

	<!-- pagination -->
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