<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        
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
                        <h2 class="page-title text-truncate text-dark font-weight-medium mb-1">Danh sách tài khoản</h2>
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
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                	
                               	<div class="row">
                       		 		<div class="col-md-6">
										<div class="form-group mb-4">
	                                        <a href="${resource }/admin/user/add" role="button" class="btn btn-primary">Thêm tài khoản</a>
                                      	</div>
                                   	</div>
                                </div>
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                            	<th scope="col">No.</th>
                                                <th scope="col">Username</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Mobile</th>
                                                <th scope="col">Create date</th>
                                                <th scope="col">Update date</th>
                                                <th scope="col">Action</th>                                           
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="user" items="${users}" varStatus="loop">
                                        		<tr>
		                                        	<td>${loop.index + 1 }</td>
		                                        	<td>${user.username }</td>
		                                        	<td>${user.name }</td>
		                                        	<td>${user.mobile }</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${user.createDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${user.updateDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
	                                        		<td>
	                                        			<a href="${resource }/admin/user/edit/${user.id}" role="button" 
	                                                							class="btn btn-primary">Edit</a>
	                                                	<a href="${resource }/admin/user/delete/${user.id}" role="button" 
	                                                							class="btn btn-secondary">Delete</a>
	                                        		</td>
                                        		</tr>
                                        	</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            
                                        </tfoot>
                                    </table>
                                    
                                    <div class="row">
	                                  </div>
	                            </div>
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
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    
	<!-- Slider js: All Jquery-->
    <jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
</body>

</html>