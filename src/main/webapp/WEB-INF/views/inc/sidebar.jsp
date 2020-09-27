<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />    

<!-- 사이드 바 스타트 -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                         <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${contextPath}/index.con"
                                aria-expanded="false"><i data-feather="home" class="feather-icon"></i><span
                                    class="hide-menu">Home</span></a></li>
                        <li class="list-divider"></li>

                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${contextPath}/com.con"
                                aria-expanded="false"><i data-feather="home" class="feather-icon"></i><span
                                    class="hide-menu">복붙용 페이지</span></a></li>

                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><a href="${contextPath}/com.res"><span class="hide-menu">예약관리</span></a></li>

                        <li class="sidebar-item"> <a class="sidebar-link" href="${contextPath}/rescheck.res"
                                aria-expanded="false"><i data-feather="tag" class="feather-icon"></i><span
                                    class="hide-menu">예약관리
                                </span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${contextPath}/point.poi"
                                aria-expanded="false"><i data-feather="message-square" class="feather-icon"></i><span
                                    class="hide-menu">지점관리</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="${contextPath}/constime.con"
                                aria-expanded="false"><i data-feather="calendar" class="feather-icon"></i><span
                                    class="hide-menu">상담시간관리</span></a></li>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- 사이드 바 엔드 -->
