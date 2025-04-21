<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page isELIgnored="false"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CureWell | Signup</title>
<link rel="icon" type="image/png" href="img/favicon.ico" />
<%@include file="component/allcss.jsp" %>
<style>
	.paint-card {
		box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
		border-radius: 15px;
	}
</style>
</head>
<body style="margin:0; padding:0;">
	<%@include file="component/navbar.jsp" %>

	<!-- Blurred Background -->
	<div style="
		position: fixed;
		top: 0;
		left: 0;
		width: 100vw;
		height: 100vh;
		background: url('img/9.jpg') no-repeat center center/cover;
		filter: blur(4px);
		z-index: -1;
	"></div>

	<!-- Centered Glassmorphic Sign-Up Form -->
	<div class="d-flex align-items-center justify-content-center" style="min-height: 90vh; position: relative; z-index: 1;">
	    <div class="card paint-card" style="
	    	background: rgba(255, 255, 255, 0.5);
	    	backdrop-filter: blur(16px);
	    	border: 1px solid rgba(255,255,255,0.3);
	    	border-radius: 15px;
	    	box-shadow: 0 8px 32px 0 rgba(0,0,0,0.37);
	    	width: 100%;
	    	max-width: 450px;
	    	color: #000;
	    ">
	        <div class="card-body">
	            <p class="fs-4 text-center fw-bold text-dark">Sign Up</p>

	            <c:if test="${not empty sucMsg}">
	            	<p class="text-center text-success fs-5">${sucMsg}</p>
	            	<p class="text-center mt-3">
				        <a href="user_login.jsp" class="btn btn-outline-primary">Proceed to Login</a>
				    </p>
	            	<c:remove var="sucMsg" scope="session" />
	      		</c:if>

	      		<c:if test="${not empty errorMsg}">
	            	<p class="text-center text-danger fs-5">${errorMsg}</p>
	            	<c:remove var="errorMsg" scope="session" />
	      		</c:if>

	            <form action="user_register" method="post">
	                <div class="mb-3">
	                    <label class="form-label fw-semibold text-dark">Full Name</label>
	                    <input required name="fullname" type="text" class="form-control rounded-pill px-3 py-2" style="border: 1px solid #ccc;">
	                </div>
	                <div class="mb-3">
	                    <label class="form-label fw-semibold text-dark">Email address</label>
	                    <input required name="email" type="email" class="form-control rounded-pill px-3 py-2" style="border: 1px solid #ccc;">
	                </div>
	                <div class="mb-3">
	                    <label class="form-label fw-semibold text-dark">Password</label>
	                    <input required name="password" type="password" class="form-control rounded-pill px-3 py-2" style="border: 1px solid #ccc;">
	                </div>
	                <br>
	                <button type="submit" class="btn bg-success text-white col-md-12 rounded-pill fw-bold py-2">Register</button>
	            </form>
	        </div>
	    </div>
	</div>
</body>
</html>
