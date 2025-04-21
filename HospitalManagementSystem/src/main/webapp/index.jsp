<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CureWell</title>
<%@include file="component/allcss.jsp" %>
<link rel="icon" type="image/png" href="img/favicon.ico" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }
    .navbar {
        background-color: #0d6efd;
    }
    .navbar a {
        color: white;
    }
    .paint-card {
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        border-radius: 20px;
        border: none;
        transition: transform 0.3s, box-shadow 0.3s;
        background-color: #ffffff; /* Light background for cards */
    }
    .paint-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }
    .carousel-inner img {
        object-fit: cover;
        width: 100%;
        height: 700px;
        border-radius: 0 !important; /* Ensures it's a sharp rectangle */
    }
    .section-title {
        font-weight: 700;
        color: #0d6efd;
        margin-bottom: 20px;
    }
    .card-body img {
        width: 100%;
        height: 280px;
        object-fit: cover;
        border-radius: 20px;
    }
    #img17 {
        width: 80%;
        border-radius: 20px;
    }
    .card-body p.fs-7 {
        font-size: 0.85rem;
        color: #6c757d;
    }
    .carousel-caption {
        background-color: rgba(0, 0, 0, 0.5);
        padding: 1rem;
        border-radius: 10px;
    }
    #txt {
        text-align: left !important;
        color: #6c757d; /* Slightly darker text for better readability */
    }
    .hover-effect {
        transition: transform 0.3s, box-shadow 0.3s;
    }
    .hover-effect:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }
</style>
</head>
<body>

<%@include file="component/navbar.jsp" %>

<!-- Carousel Section -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img/2.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="img/3.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="img/4.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="img/6.jpg" class="d-block w-100" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- Features Section -->
<div class="container py-5">
    <p class="text-center section-title fs-2">Key Features of Our Hospital</p>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card paint-card p-4 text-center shadow-sm hover-effect">
                        <div class="card-body">
                            <i class="fas fa-shield-alt fa-3x mb-3" style="color: #0d6efd;"></i>
                            <p class="fs-5 fw-semibold">100% Patient Safety</p>
                            <p id="txt">Strict adherence to global safety standards ensures optimal patient care throughout.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card paint-card p-4 text-center shadow-sm hover-effect">
                        <div class="card-body">
                            <i class="fas fa-broom fa-3x mb-3" style="color: #0d6efd;"></i>
                            <p class="fs-5 fw-semibold">Clean & Hygienic Environment</p>
                            <p id="txt">Spotless environment, infection-free zones for complete healing support.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card paint-card p-4 text-center shadow-sm hover-effect">
                        <div class="card-body">
                            <i class="fas fa-user-md fa-3x mb-3" style="color: #0d6efd;"></i>
                            <p class="fs-5 fw-semibold">Experienced & Friendly Doctors</p>
                            <p class="fs-7" id="txt">Meet our compassionate specialists who guide you like family.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card paint-card p-4 text-center shadow-sm hover-effect">
                        <div class="card-body">
                            <i class="fas fa-flask fa-3x mb-3" style="color: #0d6efd;"></i>
                            <p class="fs-5 fw-semibold">Advanced Medical Research</p>
                            <p class="fs-7" id="txt">Constant innovation and R&D to enhance your treatment experience.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<hr class="my-4">

<!-- Team Section -->
<div class="container py-4">
    <p class="text-center section-title fs-2">Meet Our Expert Team</p>
    <div class="row g-4">
        <div class="col-md-3">
            <div class="card paint-card text-center">
                <div class="card-body">
                    <img src="img/doct6.jpg" alt="Team Member" class="doct-image">
                    <p class="fw-bold fs-5 mt-2">Samuani Simi</p>
                    <p class="fs-7">(CEO & Chairman)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card text-center">
                <div class="card-body">
                    <img src="img/doct5.jpg" alt="Team Member" class="doct-image">
                    <p class="fw-bold fs-5 mt-2">Dr. Siva Kumar</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card text-center">
                <div class="card-body">
                    <img src="img/doct2.jpg" alt="Team Member" class="doct-image">
                    <p class="fw-bold fs-5 mt-2">Dr. Niuise Paule</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card text-center">
               <div class="card-body">
                    <img id="img17" src="img/doct4.jpg" alt="Team Member" class="doct-image">
                    <p class="fw-bold fs-5 mt-2">Dr. Mathue Samuel</p>
                    <p class="fs-7">(Chief Doctor)</p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="component/footer.jsp" %>

</body>
</html>