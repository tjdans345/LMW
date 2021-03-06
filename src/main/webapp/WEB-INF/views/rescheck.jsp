<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />    
    
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
    <link rel="icon" type="image/png" sizes="16x16" href="${contextPath}/resources/assets/images/favicon.png">
    <title>Adminmart Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link href="${contextPath}/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="${contextPath}/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
function stateChage(num) {
	if(confirm("변경 하시겠습니까 ?")){
		$.ajax({
			url:"stateChage.res",
			type:"POST",
			data:{"num":num},
			success:function(){
				alert("변경되었습니다.");
				document.getElementById(num).innerHTML="<font color='blue'>확인</font>"
			},
			error:function(){
				alert("변경 실패");
			}
		})
		
		
	}else{
		alert("취소되었습니다.");
	}
}
function change() {
	var nameSerch = $("#nameSerch").val();
	var pointName = $("#pointchage").val();
	var pagesize = $("#sizecheck").val();
	var statecheck = $("#statecheck").val();
	if($("#statecheck").val()=="대기중"){
		statecheck = 1;
	}
	if($("#statecheck").val()=="확인"){
		statecheck = 2;
	}
	location.href="${contextPath}/rescheck.res?pagesize="+pagesize+"&pointName="+pointName+"&nameSerch="+nameSerch+"&statecheck="+statecheck;
}
</script>
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md">
                <div class="navbar-header" data-logobg="skin6">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                            class="ti-menu ti-close"></i></a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-brand">
                        <!-- Logo icon -->
                        <a href="index.html">
                            <b class="logo-icon">
                                <!-- Dark Logo icon -->
                                <img src="${contextPath}/resources/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo icon -->
                                <img src="${contextPath}/resources/assets/images/logo-icon.png" alt="homepage" class="light-logo" />
                            </b>
                            <!--End Logo icon -->
                            <!-- Logo text -->
                            <span class="logo-text">
                                <!-- dark Logo text -->
                                <img src="${contextPath}/resources/assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo text -->
                                <img src="${contextPath}/resources/assets/images/logo-light-text.png" class="light-logo" alt="homepage" />
                            </span>
                        </a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Toggle which is visible on mobile only -->
                    <!-- ============================================================== -->
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)"
                        data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i
                            class="ti-more"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-left mr-auto ml-3 pl-1">
                        <!-- Notification -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle pl-md-3 position-relative" href="javascript:void(0)"
                                id="bell" role="button" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                <span><i data-feather="bell" class="svg-icon"></i></span>
                                <span class="badge badge-primary notify-no rounded-circle">5</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-left mailbox animated bounceInDown">
                                <ul class="list-style-none">
                                    <li>
                                        <div class="message-center notifications position-relative">
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <div class="btn btn-danger rounded-circle btn-circle"><i
                                                        data-feather="airplay" class="text-white"></i></div>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Luanch Admin</h6>
                                                    <span class="font-12 text-nowrap d-block text-muted">Just see
                                                        the my new
                                                        admin!</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:30 AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-success text-white rounded-circle btn-circle"><i
                                                        data-feather="calendar" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Event today</h6>
                                                    <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                                        a reminder that you have event</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:10 AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-info rounded-circle btn-circle"><i
                                                        data-feather="settings" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Settings</h6>
                                                    <span
                                                        class="font-12 text-nowrap d-block text-muted text-truncate">You
                                                        can customize this template
                                                        as you want</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:08 AM</span>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)"
                                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                <span class="btn btn-primary rounded-circle btn-circle"><i
                                                        data-feather="box" class="text-white"></i></span>
                                                <div class="w-75 d-inline-block v-middle pl-2">
                                                    <h6 class="message-title mb-0 mt-1">Pavan kumar</h6> <span
                                                        class="font-12 text-nowrap d-block text-muted">Just
                                                        see the my admin!</span>
                                                    <span class="font-12 text-nowrap d-block text-muted">9:02 AM</span>
                                                </div>
                                            </a>
                                        </div>
                                    </li>
                                    <li>
                                        <a class="nav-link pt-3 text-center text-dark" href="javascript:void(0);">
                                            <strong>Check all notifications</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- End Notification -->
                        <!-- ============================================================== -->
                        <!-- create new -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i data-feather="settings" class="svg-icon"></i>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>
                        <li class="nav-item d-none d-md-block">
                            <a class="nav-link" href="javascript:void(0)">
                                <div class="customize-input">
                                    <select
                                        class="custom-select form-control bg-white custom-radius custom-shadow border-0">
                                        <option selected>EN</option>
                                        <option value="1">AB</option>
                                        <option value="2">AK</option>
                                        <option value="3">BE</option>
                                    </select>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-right">
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item d-none d-md-block">
                            <a class="nav-link" href="javascript:void(0)">
                                <form>
                                    <div class="customize-input">
                                        <input class="form-control custom-shadow custom-radius border-0 bg-white"
                                            type="search" placeholder="Search" aria-label="Search">
                                        <i class="form-control-icon" data-feather="search"></i>
                                    </div>
                                </form>
                            </a>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <img src="${contextPath}/resources/assets/images/users/profile-pic.jpg" alt="user" class="rounded-circle"
                                    width="40">
                                <span class="ml-2 d-none d-lg-inline-block"><span>Hello,</span> <span
                                        class="text-dark">Jason Doe</span> <i data-feather="chevron-down"
                                        class="svg-icon"></i></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="user"
                                        class="svg-icon mr-2 ml-1"></i>
                                    My Profile</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="credit-card"
                                        class="svg-icon mr-2 ml-1"></i>
                                    My Balance</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="mail"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Inbox</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="settings"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Account Setting</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i data-feather="power"
                                        class="svg-icon mr-2 ml-1"></i>
                                    Logout</a>
                                <div class="dropdown-divider"></div>
                                <div class="pl-4 p-3"><a href="javascript:void(0)" class="btn btn-sm btn-info">View
                                        Profile</a></div>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        
          <!-- 사이드바 -->
        <jsp:include page="./inc/sidebar.jsp" />
         <!-- 사이드바 -->
         
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
                        <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">Good Morning Jason!</h3>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb m-0 p-0">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a>
                                    </li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <select class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
                                <option selected>Aug 19</option>
                                <option value="1">July 19</option>
                                <option value="2">Jun 19</option>
                            </select>
                        </div>
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
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                <div class="card-group">
                  
                  <!-- 테이블 -->
                  <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">예약하기</h4>
                                <h6 class="card-title mt-5"><i
                                        class="mr-1 font-18 mdi mdi-numeric-1-box-multiple-outline"></i> Table With
                                    Outside Padding</h6>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        	<tr>
                                                <th scope="col">
													<label>Show
													<select class="form-control form-control-sm" name="pagesize" id="sizecheck" onchange="change()">
														<c:choose>
															<c:when test="${map.pagesize==3}">
																<option selected="selected">3</option>
															</c:when>
															<c:otherwise>
																<option>3</option>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${map.pagesize==5}">
																<option selected="selected">5</option>
															</c:when>
															<c:otherwise>
																<option>5</option>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when test="${map.pagesize==10}">
																<option selected="selected">10</option>
															</c:when>
															<c:otherwise>
																<option>10</option>
															</c:otherwise>
														</c:choose>
													</select>
													</label>
												</th>
                                                <th scope="col" colspan="2"> 
                                  				<div class="input-group">
                                  				<input type="text" class="form-control" id="nameSerch" placeholder="이름검색" aria-label="이름검색">
                                  				<div class="input-group-append">
                                  				<button class="btn btn-outline-secondary" onclick="change()">검색</button>
                                  				</div>
                                  				</div>
                                                <th scope="col">
													<select class="form-control form-control-sm" name="point" id="pointchage" onchange="change()">
														<option selected="selected" value="%%">지점선택</option>														
														<c:forEach items="${point}" var="i">
															<c:choose>
																<c:when test="${i.pointName==map.pointName}">
																<option selected="selected">${i.pointName}</option>
																</c:when>
																<c:otherwise>
																<option>${i.pointName}</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
                                                </th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col">
                                                	<select class="form-control form-control-sm" name="statecheck" id="statecheck" onchange="change()">
														<option selected="selected" value="0">전체</option>														
														<c:choose>
															<c:when test="${map.statecheck==1}">
																<option selected="selected" value="1">대기중</option>
																<option>확인</option>
															</c:when>
															<c:when test="${map.statecheck==2}">
																<option>대기중</option>
																<option selected="selected" value="2">확인</option>
															</c:when>
															<c:otherwise>
																<option>대기중</option>
																<option>확인</option>
															</c:otherwise>														
															</c:choose>												
													</select>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">이름</th>
                                                <th scope="col">연락처</th>
                                                <th scope="col">지점</th>
                                                <th scope="col">방문날짜</th>
                                                <th scope="col">상담시간</th>
                                                <th scope="col">등록일</th>
                                                <th scope="col">상태</th>
                                            </tr>
                                        </thead>
                                        <tbody id="listbody">
                                            <c:forEach items="${reslist}" var="i">
                                            <tr>
                                            	<th>${i.num}</th>
                                           	<td><a href="${contextPath}/resView.res?num=${i.num}">${i.name}</a></td>
                                            	<td>${i.tel}</td>
                                            	<td>${i.point}</td>
                                            	<td><f:formatDate value="${i.visitDate}" pattern="yyyy-MM-dd"/></td>
                                            	<td>
                                            		<c:choose>
                                            			<c:when test="${i.consTime<12}">
                                            			오전 ${i.consTime} 시
                                            			</c:when>
                                            			<c:when test="${i.consTime==12}">
                                            			오후 ${i.consTime} 시
                                            			</c:when>
                                            			<c:otherwise>
                                            			오후 ${i.consTime-12} 시
                                            			</c:otherwise>
                                            		</c:choose>
                                            	</td>
                                            	<td><f:formatDate value="${i.regiDate}" pattern="yyyy-MM-dd"/></td>
                                            	<td id="${i.num}">
                                            	<c:choose>
                                            		<c:when test="${i.state==1}">
                                            		<button class="btn waves-effect waves-light btn-outline-danger" onclick="stateChage(${i.num})">대기중</button>
                                            		</c:when>
                                            		<c:otherwise>
                                            		<font color='blue'>확인</font>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                             
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4">
                    </div>
                    <div class="col-lg-4 mb-4">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                        <c:if test="${map.nowpage>map.blocksize}">
                                                        <li class="page-item">
                                                    <a class="page-link" href="${contextPath}/rescheck.res?nowpage=${map.blockfirst-1}&pagesize=${map.pagesize}&pointName=${map.pointName}&nameSerch=${map.nameSerch}&statecheck=${map.statecheck}"
                                                        aria-label="Previous">        
                                                        <span aria-hidden="true">&laquo;</span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                </li>
                                                        </c:if>
                                                        
                                                 <c:forEach begin="${map.blockfirst}" end="${map.blocklast}" var="i">
                                                <li class="page-item"><a class="page-link"
                                                        href="${contextPath}/rescheck.res?nowpage=${i}&pagesize=${map.pagesize}&pointName=${map.pointName}&nameSerch=${map.nameSerch}&statecheck=${map.statecheck}">${i}</a></li>
                                                 </c:forEach>       
                                                
                                                <c:if test="${map.totalpage!=map.blocklast}">
	                                                <li class="page-item">
	                                                    <a class="page-link" href="${contextPath}/rescheck.res?nowpage=${map.blocklast+1}&pagesize=${map.pagesize}&pointName=${map.pointName}&nameSerch=${map.nameSerch}&statecheck=${map.statecheck}" aria-label="Next">
	                                                        <span aria-hidden="true">&raquo;</span>
	                                                        <span class="sr-only">Next</span>
	                                                    </a>
	                                                </li>
                                                </c:if>
                                            </ul>
                                        </nav>
                                    </div>
                    
                    
                    
                    
                    <!-- 테이블 -->
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center text-muted">
                All Rights Reserved by Adminmart. Designed and Developed by <a
                    href="https://wrappixel.com">WrapPixel</a>.
            </footer>
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
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${contextPath}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${contextPath}/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${contextPath}/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="${contextPath}/resources/dist/js/app-style-switcher.js"></script>
    <script src="${contextPath}/resources/dist/js/feather.min.js"></script>
    <script src="${contextPath}/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${contextPath}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${contextPath}/resources/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="${contextPath}/resources/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${contextPath}/resources/assets/extra-libs/c3/c3.min.js"></script>
    <script src="${contextPath}/resources/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${contextPath}/resources/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="${contextPath}/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="${contextPath}/resources/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${contextPath}/resources/dist/js/pages/dashboards/dashboard1.min.js"></script>
</body>

</html>