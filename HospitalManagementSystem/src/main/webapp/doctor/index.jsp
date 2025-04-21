<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CureWell | Doctor Home</title>
<link rel="icon" type="image/png" href="../img/favicon.ico"/>
<%@include file="../component/allcss.jsp"%>
<style>
* {
	font-family: 'Poppins', sans-serif;
}

body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	background: url('../img/bg8.jpg') no-repeat center center fixed;
	background-size: cover;
	padding-top: 70px;
}

.dashboard-wrapper {
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: flex-start;
	padding: 60px 15px;
}

.dashboard-container {
	background: rgba(255, 255, 255, 0.4);
	backdrop-filter: blur(12px);
	-webkit-backdrop-filter: blur(12px);
	border-radius: 20px;
	padding: 30px 40px;
	width: 100%;
	max-width: 900px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
}

.card.paint-card {
	background: rgba(255, 255, 255, 0.3);
	backdrop-filter: blur(10px);
	border-radius: 20px;
	padding: 20px;
	margin-top: 20px;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
}

.card.paint-card:hover {
	transform: translateY(-5px);
}

.text-center {
	text-align: center;
}

.fs-3 {
	font-size: 1.75rem;
	font-weight: 600;
	color: #2c3e50;
}

.fs-4 {
	font-size: 1.5rem;
	font-weight: 500;
	color: #34495e;
}

.text-success {
	color: #28a745 !important;
}

.icon-style {
	color: #2c3e50;
	margin-bottom: 10px;
}
</style>
</head>
<body>

	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="dashboard-wrapper">
		<div class="dashboard-container">
			<p class="text-center fs-3">Doctor Dashboard</p>
			<%
			Doctor d = (Doctor) session.getAttribute("doctObj");
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			%>
			<div class="row">
				<div class="col-md-6">
					<div class="card paint-card text-center">
						<div class="card-body text-success">
							<i class="fas fa-user-md fa-3x icon-style"></i>
							<p class="fs-4">
								Doctor<br><%=dao.countDoctor()%></p>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="card paint-card text-center">
						<div class="card-body text-success">
							<i class="fas fa-calendar-check fa-3x icon-style"></i>
							<p class="fs-4">
								Total Appointment<br><%=dao.countAppointmentByDoctorId(d.getId())%></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
