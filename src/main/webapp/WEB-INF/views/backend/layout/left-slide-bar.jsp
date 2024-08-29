<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="left-sidebar" data-sidebarbg="skin6">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar" data-sidebarbg="skin6">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${resource }/admin/home/list"
                        aria-expanded="false"><i data-feather="home" class="feather-icon"></i><span
                            class="hide-menu">Admin Home Page</span></a></li>
                <li class="list-divider"></li>
                <li class="nav-small-cap"><span class="hide-menu">Quản lý nhà hàng</span></li>
                
                <li class="sidebar-item">
                	<a class="sidebar-link sidebar-link" href="${resource }/admin/food/list " aria-expanded="false">
                		<i data-feather="calendar" class="feather-icon"></i>
                		<span class="hide-menu">Quản lý Menu</span>
                	</a>
                </li>
                
				<li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${resource }/admin/order/list"
                        aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                            class="hide-menu">Quản lý đơn hàng</span></a></li>
                <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${resource }/admin/user/list"
                        aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                            class="hide-menu">Quản lý tài khoản</span></a></li>
                
				
               
                <li class="list-divider"></li>

                <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${resource}/logout"
                        aria-expanded="false"><i data-feather="log-out" class="feather-icon"></i><span
                            class="hide-menu">Logout</span></a></li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>