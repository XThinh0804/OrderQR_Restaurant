<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
<title>${title }</title>
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
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<jsp:include page="/WEB-INF/views/backend/layout/left-slide-bar.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <h2 class="page-title text-truncate text-dark font-weight-medium mb-1">Edit Product</h2>
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
				
                <div class="row">
                	<div class="col-12">
	                    <div class="card">
	                        <div class="card-body">
	                        	<sf:form class="form" action="${resource }/admin/order/edit-save" method="post" modelAttribute="order" enctype="multipart/form-data">
	                        		 
	                        		 <div class="form-body">

										<sf:hidden path="id" />
										<!-- id > 0 -> Edit -->
	                        		 	
	                        			<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="order_status">Trạng thái đơn hàng</label>
			                                        <sf:select path="order_status.id" class="form-control" id="order_status">
			                                            <sf:options items="${ordersStatus}" itemValue="id" itemLabel="name"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
										
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="name">Tên người đặt hàng</label>
			                                        <sf:input path="customer_name" type="text" class="form-control" id="customer_name" name="customer_name"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="customer_mobile">Số điện thoại</label>
			                                        <sf:input path="customer_mobile" type="text" class="form-control" id="customer_mobile" name="customer_mobile"></sf:input>
                                        		</div>
	                                    	</div>
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="total">Tổng tiền</label>
			                                        <sf:input path="total" type="number" autocomplete="off" id="total" name="total" class="form-control"></sf:input>
                                        		</div>
	                                    	</div>
										
										</div>
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="createdate">Thời gian đặt hàng</label>
			                                        
			                                        <sf:input path="createDate" class="form-control" type="date" 
			                                        			id="createDate" name="createDate"></sf:input>
                                        		</div>
	                                    	</div>
	                                    	<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="diningTable">Bàn số</label>
			                                        <sf:input path="diningTable" type="text" class="form-control" id="diningTable"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <a href="${resource }/admin/order/list" class="btn btn-secondary active" role="button" aria-pressed="true">
			                                        	Quay lại
			                                        </a>
                                    				<button type="submit" class="btn btn-primary">Lưu</button>
                                        		</div>
	                                    	</div>
										</div>
										
	                        		</div>
	                        	</sf:form>
	                        </div>
	                    </div>    
                  </div> 
				
				</div>

				<!-- End PAge Content -->
				<!-- ============================================================== -->
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
	<!-- End Wrapper -->
	<div class="chat-windows "></div>
	<!-- ============================================================== -->
	<!-- Slider js: All Jquery-->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
</body>

</html>