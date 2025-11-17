<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - MyVideo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-img-top { height: 200px; object-fit: cover; }
        .card:hover { transform: translateY(-5px); box-shadow: 0 8px 20px rgba(0,0,0,0.15) !important; transition: 0.3s; }
    </style>
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-primary" href="/ASSJ4/videos">MyVideo</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="nav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link active" href="/ASSJ4/videos">Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="favorites.jsp">My Favorites</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">My Account</a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="login.jsp">Login</a></li>
                        <li><a class="dropdown-item" href="register.jsp">Registration</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="logoff" 
                               onclick="return confirm('Đăng xuất?')">Logoff</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h2 class="text-center mb-4 fw-bold text-primary">Danh sách Tiểu phẩm</h2>

    <c:if test="${empty videos}">
        <p class="text-center text-muted">Chưa có video nào.</p>
    </c:if>

    <div class="row">
        <c:forEach var="v" items="${videos}">
            <div class="col-md-4 col-sm-6 mb-4">
                <div class="card shadow-sm h-100">
                    <img src="${v.poster}" class="card-img-top" alt="${v.title}"
                         onerror="this.src='https://via.placeholder.com/480x360/e9ecef/6c757d?text=No+Image'"
                         style="cursor:pointer" onclick="window.open('${v.link}', '_blank')">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">${v.title}</h5>
                        <p class="card-text text-muted"><small>Lượt xem: <strong>${v.views}</strong></small></p>
                        <div class="mt-auto d-flex gap-1">
                            <a href="like?id=${v.id}" class="btn btn-outline-danger btn-sm flex-fill">Like</a>
                            <a href="share?id=${v.id}" class="btn btn-outline-primary btn-sm flex-fill">Share</a>
                        </div>
                        <button onclick="window.open('${v.link}', '_blank')"
                                class="btn btn-primary w-100 mt-2">Xem chi tiết</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- PHÂN TRANG -->
    <div class="text-center mt-4">
        <a class="btn btn-outline-primary ${page <= 1 ? 'disabled' : ''}" href="?page=1">First</a>
        <a class="btn btn-outline-primary ${page <= 1 ? 'disabled' : ''}" href="?page=${page-1}">Previous</a>
        <span class="mx-3 fw-bold">Trang ${page} / ${total}</span>
        <a class="btn btn-outline-primary ${page >= total ? 'disabled' : ''}" href="?page=${page+1}">Next</a>
        <a class="btn btn-outline-primary ${page >= total ? 'disabled' : ''}" href="?page=${total}">Last</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>s