<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="icon" type="image/png" sizes="16x16"
	href="${contextPath}/resources/assets/images/favicon.png">
<title>Adminmart Template - The Ultimate Multipurpose admin
	template</title>
<!-- Custom CSS -->
<link href="${contextPath}/resources/assets/extra-libs/c3/c3.min.css"
	rel="stylesheet">
<link
	href="${contextPath}/resources/assets/libs/chartist/dist/chartist.min.css"
	rel="stylesheet">
<link
	href="${contextPath}/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css"
	rel="stylesheet" />
<!-- Custom CSS -->
<link href="${contextPath}/resources/dist/css/style.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>


<style type="text/css">
.no-btn {
	background-color: #ffffff;
	border-color: #ea0000;
	color: #ea0000;
	font-size: 0.9rem;
}

.no-btn:hover {
	background-color: #f50000;
	color: #ffffff;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

				//출력상태 안함 클릭 시 state값 1로 변경
				//새로운 엘리먼트 생성 후(동적으로 생성된 태그 이벤트 처리를 위해서 $(document).on("click","#btn",function(){});) 사용
				$(document).on("click", ".yes-btn", function() {
					if (confirm("출력 취소 하시겠습니까?") == true) {
						var state = $(".yes-btn").val();
						var num = $(this).data("num");
						$.ajax({
							url : "yes.poi",
							type : "post",
							data : {
								"state" : state,
								"num" : num
							},
							dataType : "json",
							success : function(data) {
								$(".yes-btn" + num).hide();
								$(".no-btn" + num).show();
							},
							error : function(data) {
								alert("통신 실패");
							}
						});
					} else {
						return;
					}
				});
				//출력상태 안함 클릭 시 state값 0으로 변경
				//새로운 엘리먼트 생성 후(동적으로 생성된 태그 이벤트 처리를 위해서 $(document).on("click","#btn",function(){});) 사용
				$(document).on("click", ".no-btn", function() {
					if (confirm("출력 하시겠습니까?") == true) {
						var state = $(".no-btn").val();
						var num = $(this).data("num");
						$.ajax({
							url : "yes.poi",
							type : "post",
							data : {
								"state" : state,
								"num" : num
							},
							dataType : "json",
							success : function(data) {
								$(".yes-btn" + num).show();
								$(".no-btn" + num).hide();
							},
							error : function(data) {
								alert("통신 실패");
							}
						});
					} else {
						return;
					}
				});
				//지점 등록하기 버튼 클릭 시 이벤트
				$(".MB").click(
						function() {
							var Sname = $(".Sname").val();
							if (Sname != "") {
								$("#mbody").empty();
								$("#mbody").append("등록한 지점명을 확인해주세요 !</br>");
								$("#mbody").append(
										"지점명 :<b><mark>" + Sname
												+ "</mark></b></br>");
								$("#mbody").append("등록 하시겠습니까?");
								$(".btn-chiso").show();
								$(".btn-insert").show();
								$(".btn-check").hide();
							} else if (Sname == "") {
								$("#mbody").empty();
								$("#mbody").append("지점명을 입력해주세요!");
								$(".btn-chiso").hide();
								$(".btn-insert").hide();
								$(".btn-check").show();
							}
						});
				//최종 등록하기 버튼 클릭 시 지점 등록 이벤트
				$(".btn-insertok").click(function() {
					$("#pointF").attr("action", "${contextPath}/test.poi");
					$("#pointF").submit();
				});
				
				//삭제 버튼 클릭
// 				$(".btn-del").click(function() {
				//새로운 엘리먼트 생성 후(동적으로 생성된 태그 이벤트 처리를 위해서 $(document).on("click","#btn",function(){});) 사용
				$(document).on("click", ".btn-del", function() {
					if (confirm("삭제 하시겠습니까?") == true) {
					$(".btn-delete").remove();
					var num = $(this).data("num");
					$.ajax({
						url : "delete.poi",
						type : "post",
						data : {
							"num" : num
						},
						dataType : "json",
						success : function(data) {
							var str = "";
							//테이블 출력 부분 자식태그 제거
							$("#Ltbody").empty();
							$.each(data, function(i) {
								var num = data[i].num;
								var pointname = data[i].pointname;
								var state = data[i].state;
								str += "<tr align='center' style='text-align: center;'>";
								str += "<th scope='row' width='100'>"+num+"</th>";
								str += "<td width='700'>"+pointname+"</td>";
								str += "<td width='300' class='a-btn' id='"+num+"'>";
								if(state == 1) {
									str += "<button type='button' class='btn waves-effect waves-light btn-outline-info yes-btn yes-btn"+num+"' style='font-size: 0.9rem;' value='0' data-num='"+num+"'>출력</button>";
									str += "<button type='button' class='btn waves-effect waves-light btn-danger no-btn no-btn"+num+"' data-num='"+num+"' value='1' style='display: none;'>안함</button>";
								} else if(state == 0) {
									str += "<button type='button' class='btn waves-effect waves-light btn-danger no-btn no-btn"+num+"' data-num='"+num+"' value='1'>안함</button>"; 
									str += "<button type='button' class='btn waves-effect waves-light btn-outline-info yes-btn yes-btn"+num+"' style='font-size: 0.9rem; display: none;' value='0' data-num='"+num+"'>출력</button>";
								}
									str += "</td>";
									str += "<td width='300'>";
									str += "<button type='button' class='btn waves-effect waves-light btn-warning' style='font-size: 0.9rem;'>수정</button> \r";
									str += "<button type='button' class='btn waves-effect waves-light btn-danger btn-del' style='font-size: 0.9rem;' data-num='"+num+"'>삭제</button>";
									str += "</td>";
									str += "</tr>";
							});
									$("#Ltbody").append(str);
						},
						error : function(data) {
							alert("통신 실패");
						}
					 });
					} else{ 
						return;
					}
				});
			
			}); //도큐먼트 레디 펑션 끝
			
			
			
			
	
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
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<header class="topbar" data-navbarbg="skin6">
			<nav class="navbar top-navbar navbar-expand-md">
				<div class="navbar-header" data-logobg="skin6">
					<!-- This is for the sidebar toggle which is visible on mobile only -->
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
					<!-- ============================================================== -->
					<!-- Logo -->
					<!-- ============================================================== -->
					<div class="navbar-brand">
						<!-- Logo icon -->
						<a href="index.html"> <b class="logo-icon"> <!-- Dark Logo icon -->
								<img src="${contextPath}/resources/assets/images/logo-icon.png"
								alt="homepage" class="dark-logo" /> <!-- Light Logo icon --> <img
								src="${contextPath}/resources/assets/images/logo-icon.png"
								alt="homepage" class="light-logo" />
						</b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
								<!-- dark Logo text --> <img
								src="${contextPath}/resources/assets/images/logo-text.png"
								alt="homepage" class="dark-logo" /> <!-- Light Logo text --> <img
								src="${contextPath}/resources/assets/images/logo-light-text.png"
								class="light-logo" alt="homepage" />
						</span>
						</a>
					</div>
					<!-- ============================================================== -->
					<!-- End Logo -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- Toggle which is visible on mobile only -->
					<!-- ============================================================== -->
					<a class="topbartoggler d-block d-md-none waves-effect waves-light"
						href="javascript:void(0)" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation"><i class="ti-more"></i></a>
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
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle pl-md-3 position-relative"
							href="javascript:void(0)" id="bell" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span><i data-feather="bell" class="svg-icon"></i></span> <span
								class="badge badge-primary notify-no rounded-circle">5</span>
						</a>
							<div
								class="dropdown-menu dropdown-menu-left mailbox animated bounceInDown">
								<ul class="list-style-none">
									<li>
										<div class="message-center notifications position-relative">
											<!-- Message -->
											<a href="javascript:void(0)"
												class="message-item d-flex align-items-center border-bottom px-3 py-2">
												<div class="btn btn-danger rounded-circle btn-circle">
													<i data-feather="airplay" class="text-white"></i>
												</div>
												<div class="w-75 d-inline-block v-middle pl-2">
													<h6 class="message-title mb-0 mt-1">Luanch Admin</h6>
													<span class="font-12 text-nowrap d-block text-muted">Just
														see the my new admin!</span> <span
														class="font-12 text-nowrap d-block text-muted">9:30
														AM</span>
												</div>
											</a>
											<!-- Message -->
											<a href="javascript:void(0)"
												class="message-item d-flex align-items-center border-bottom px-3 py-2">
												<span
												class="btn btn-success text-white rounded-circle btn-circle"><i
													data-feather="calendar" class="text-white"></i></span>
												<div class="w-75 d-inline-block v-middle pl-2">
													<h6 class="message-title mb-0 mt-1">Event today</h6>
													<span
														class="font-12 text-nowrap d-block text-muted text-truncate">Just
														a reminder that you have event</span> <span
														class="font-12 text-nowrap d-block text-muted">9:10
														AM</span>
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
														can customize this template as you want</span> <span
														class="font-12 text-nowrap d-block text-muted">9:08
														AM</span>
												</div>
											</a>
											<!-- Message -->
											<a href="javascript:void(0)"
												class="message-item d-flex align-items-center border-bottom px-3 py-2">
												<span class="btn btn-primary rounded-circle btn-circle"><i
													data-feather="box" class="text-white"></i></span>
												<div class="w-75 d-inline-block v-middle pl-2">
													<h6 class="message-title mb-0 mt-1">Pavan kumar</h6>
													<span class="font-12 text-nowrap d-block text-muted">Just
														see the my admin!</span> <span
														class="font-12 text-nowrap d-block text-muted">9:02
														AM</span>
												</div>
											</a>
										</div>
									</li>
									<li><a class="nav-link pt-3 text-center text-dark"
										href="javascript:void(0);"> <strong>Check all
												notifications</strong> <i class="fa fa-angle-right"></i>
									</a></li>
								</ul>
							</div></li>
						<!-- End Notification -->
						<!-- ============================================================== -->
						<!-- create new -->
						<!-- ============================================================== -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i data-feather="settings"
								class="svg-icon"></i>
						</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div></li>
						<li class="nav-item d-none d-md-block"><a class="nav-link"
							href="javascript:void(0)">
								<div class="customize-input">
									<select
										class="custom-select form-control bg-white custom-radius custom-shadow border-0">
										<option selected>EN</option>
										<option value="1">AB</option>
										<option value="2">AK</option>
										<option value="3">BE</option>
									</select>
								</div>
						</a></li>
					</ul>
					<!-- ============================================================== -->
					<!-- Right side toggle and nav items -->
					<!-- ============================================================== -->
					<ul class="navbar-nav float-right">
						<!-- ============================================================== -->
						<!-- Search -->
						<!-- ============================================================== -->
						<li class="nav-item d-none d-md-block"><a class="nav-link"
							href="javascript:void(0)">
								<form>
									<div class="customize-input">
										<input
											class="form-control custom-shadow custom-radius border-0 bg-white"
											type="search" placeholder="Search" aria-label="Search">
										<i class="form-control-icon" data-feather="search"></i>
									</div>
								</form>
						</a></li>
						<!-- ============================================================== -->
						<!-- User profile and search -->
						<!-- ============================================================== -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="javascript:void(0)"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<img
								src="${contextPath}/resources/assets/images/users/profile-pic.jpg"
								alt="user" class="rounded-circle" width="40"> <span
								class="ml-2 d-none d-lg-inline-block"><span>Hello,</span>
									<span class="text-dark">Jason Doe</span> <i
									data-feather="chevron-down" class="svg-icon"></i></span>
						</a>
							<div
								class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
								<a class="dropdown-item" href="javascript:void(0)"><i
									data-feather="user" class="svg-icon mr-2 ml-1"></i> My Profile</a>
								<a class="dropdown-item" href="javascript:void(0)"><i
									data-feather="credit-card" class="svg-icon mr-2 ml-1"></i> My
									Balance</a> <a class="dropdown-item" href="javascript:void(0)"><i
									data-feather="mail" class="svg-icon mr-2 ml-1"></i> Inbox</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="javascript:void(0)"><i
									data-feather="settings" class="svg-icon mr-2 ml-1"></i> Account
									Setting</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="javascript:void(0)"><i
									data-feather="power" class="svg-icon mr-2 ml-1"></i> Logout</a>
								<div class="dropdown-divider"></div>
								<div class="pl-4 p-3">
									<a href="javascript:void(0)" class="btn btn-sm btn-info">View
										Profile</a>
								</div>
							</div></li>
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

			<div class="container-fluid">
				<!-- *************************************************************** -->
				<!-- Start First Cards -->
				<!-- *************************************************************** -->
				<div class="card-group">

					<!-- 테이블 -->
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">지점 관리</h4>


								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr align="center" style="text-align: center;">
												<th scope="col" width="100">번호</th>
												<th scope="col" width="700">지점</th>
												<th scope="col" width="300">출력 상태</th>
												<th scope="col" width="300">관리</th>
											</tr>
										</thead>
										<tbody id="Ltbody">
											<c:forEach var="list" items="${pointList}">
												<tr align="center" style="text-align: center;">
													<th scope="row" width="100">${list.num}</th>
													<td width="700">${list.pointName}</td>

													<td width="300" class="a-btn" id="${list.num}">
													<c:if test="${list.state == 1}">
															<button type="button"
																class="btn waves-effect waves-light btn-outline-info yes-btn yes-btn${list.num}"
																style="font-size: 0.9rem;" value="0"
																data-num="${list.num}">출력</button>
															<button type="button"
																class="btn waves-effect waves-light btn-danger no-btn no-btn${list.num}"
																data-num="${list.num}" value="1" style="display: none;">안함</button>
														</c:if> 
													<c:if test="${list.state == 0}">
															<button type="button"
																class="btn waves-effect waves-light btn-danger no-btn no-btn${list.num}"
																data-num="${list.num}" value="1">안함</button>
															<button type="button"
																class="btn waves-effect waves-light btn-outline-info yes-btn yes-btn${list.num}"
																style="font-size: 0.9rem; display: none;" value="0"
																data-num="${list.num}">출력</button>
														</c:if></td>


													<td width="300">
														<button type="button"
															class="btn waves-effect waves-light btn-warning"
															style="font-size: 0.9rem;">수정</button>
														<button type="button"
															class="btn waves-effect waves-light btn-danger btn-del"
															style="font-size: 0.9rem;" data-num="${list.num}">삭제</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- 지점등록 -->
								<div class="col-sm-12 col-md-6 col-lg-4" align="center"
									style="margin: auto;">
									<form method="post" id="pointF" action="">
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<label class="input-group-text" for="inputGroupSelect01">지점명</label>
											</div>
											<input hidden="hidden" />
											<input type="text" class="form-control Sname Ncl"
												id="helpInput11" placeholder="지점명을 입력하세요ㅋ" name="pointname">
											<!-- Success header modal -->
											<button type="button" class="btn btn-success MB"
												data-toggle="modal" data-target="#success-header-modal">등록</button>
											<!-- Info header modal -->
										</div>
									</form>
								</div>
							</div>
							<!-- 지점등록 -->
							<!-- 모달창 Start -->
							<div id="success-header-modal" class="modal fade MS"
								tabindex="-1" role="dialog"
								aria-labelledby="success-header-modalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header modal-colored-header bg-success">
											<h4 class="modal-title" id="success-header-modalLabel">지점
												등록</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>
										</div>
										<div class="modal-body" id="mbody">
											<p>지점 등록을 하시겠습니까?</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-light btn-chiso"
												data-dismiss="modal">취소</button>
											<button type="button"
												class="btn btn-success btn-insert btn-insertok">등록
												하기</button>
											<button type="button" class="btn btn-light btn-check"
												data-dismiss="modal" style="display: none;">확인</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- 모달창 end -->
						</div>
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
	<script
		src="${contextPath}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="${contextPath}/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="${contextPath}/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- apps -->
	<!-- apps -->
	<script src="${contextPath}/resources/dist/js/app-style-switcher.js"></script>
	<script src="${contextPath}/resources/dist/js/feather.min.js"></script>
	<script
		src="${contextPath}/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="${contextPath}/resources/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="${contextPath}/resources/dist/js/custom.min.js"></script>
	<!--This page JavaScript -->
	<script src="${contextPath}/resources/assets/extra-libs/c3/d3.min.js"></script>
	<script src="${contextPath}/resources/assets/extra-libs/c3/c3.min.js"></script>
	<script
		src="${contextPath}/resources/assets/libs/chartist/dist/chartist.min.js"></script>
	<script
		src="${contextPath}/resources/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script
		src="${contextPath}/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
	<script
		src="${contextPath}/resources/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${contextPath}/resources/dist/js/pages/dashboards/dashboard1.min.js"></script>
</body>

</html>