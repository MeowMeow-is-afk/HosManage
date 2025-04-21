<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Specialist"%>
<%@ page import="com.dao.SpecialistDao"%>
<%@ page import="com.db.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CureWell | Edit Profile</title>
<link rel="icon" type="image/png" href="../img/favicon.ico"/>
<%@ include file="../component/allcss.jsp"%>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
* {
	font-family: 'Poppins', sans-serif;
}

body {
	margin: 0;
	padding: 0;
	background: url('../img/bg3.jpg') no-repeat center center fixed;
	background-size: cover;
}

.wrapper {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 40px 20px;
	min-height: 100vh;
}

.super-heading {
	margin-top: 15px;
	font-size: 2.2rem;
	font-weight: 600;
	color: #fff;
	margin-bottom: 50px;
	text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.4);
}

.cards-container {
	display: flex;
	gap: 30px;
	width: 90%;
	max-width: 1200px;
	justify-content: center;
}

.glass-card {
	background: rgba(255, 255, 255, 0.2);
	backdrop-filter: blur(14px);
	-webkit-backdrop-filter: blur(14px);
	border-radius: 20px;
	padding: 30px;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
	color: #222;
	flex: 1;
	min-width: 300px;
	display: flex;
	flex-direction: column;
	justify-content: flex-start; 
}

.change-form-wrapper {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	height: auto;
}

.change-form-wrapper .mb-3 {
	margin-bottom: 20px; 
}

.glass-card .form-label {
	margin-bottom: 10px; 
}

.glass-card button {
	margin-top: 20px; 
}

.form-heading {
	font-size: 1.7rem;
	font-weight: 600;
	color: #2c3e50;
	margin-bottom: 20px;
	text-align: center;
	margin-top: 0; 
}

.form-label {
	font-weight: 500;
}

.form-control {
	border-radius: 10px;
	padding: 10px;
	background-color: rgba(255, 255, 255, 0.2);
	border: 1px solid rgba(255, 255, 255, 0.4);
	color: #000;
}

.form-control::placeholder {
	color: #555;
}

.btn-custom {
	padding: 10px;
	border-radius: 30px;
	font-weight: bold;
	font-size: 16px;
	transition: 0.3s ease-in-out;
}

.btn-custom:hover {
	transform: scale(1.03);
	box-shadow: 0 0 12px rgba(0, 0, 0, 0.2);
}

.text-success, .text-danger {
	text-align: center;
	font-weight: 500;
	font-size: 20px;
}

.edit-form-grid {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

.edit-form-grid .full-width {
	grid-column: span 2;
}

@media (max-width: 768px) {
	.cards-container {
		flex-direction: column;
		align-items: center;
	}
	.edit-form-grid {
		grid-template-columns: 1fr;
	}
	.edit-form-grid .full-width {
		grid-column: span 1;
	}
	.glass-card {
		width: 100%;
		height: auto;
	}
	.super-heading {
		font-size: 1.8rem;
		text-align: center;
	}
}
</style>
</head>
<body>

	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp" />
	</c:if>

	<%@ include file="navbar.jsp"%>

	<div class="wrapper">
		<div class="super-heading">Manage Your Profile</div>

		<div class="cards-container">

			<!-- Change Password Card -->
			<div class="glass-card">
				<div class="change-form-wrapper">
					<p class="form-heading">Change Password</p>

					<c:if test="${not empty errorMsg}">
						<p class="text-danger">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<c:if test="${not empty succMsg}">
						<p class="text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<form action="../doctChangePassword" method="post">
						<div class="mb-3">
							<label class="form-label">New Password</label>
							<input type="password" required name="newPassword" class="form-control" placeholder="Enter new password">
						</div>

						<div class="mb-3">
							<label class="form-label">Old Password</label>
							<input type="password" required name="oldPassword" class="form-control" placeholder="Enter old password">
						</div>

						<input type="hidden" value="${doctObj.id}" name="uid">
						<div class="full-width">
							<button type="submit" class="btn btn-success btn-custom col-12 mt-3">Change Password</button>
						</div>
					</form>
				</div>
			</div>

			<!-- Edit Profile Card -->
			<div class="glass-card">
				<p class="form-heading">Edit Profile</p>

				<c:if test="${not empty errordMsg}">
					<p class="text-danger">${errordMsg}</p>
					<c:remove var="errordMsg" scope="session" />
				</c:if>

				<c:if test="${not empty succdMsg}">
					<p class="text-success">${succdMsg}</p>
					<c:remove var="succdMsg" scope="session" />
				</c:if>

				<form action="../doctUpdateProfile" method="post" class="edit-form-grid">
					<div>
						<label class="form-label">Full Name</label>
						<input type="text" required name="fullname" class="form-control" value="${doctObj.fullName}">
					</div>

					<div>
						<label class="form-label">DOB</label>
						<input type="date" required name="dob" class="form-control" value="${doctObj.dob}">
					</div>

					<div>
						<label class="form-label">Qualification</label>
						<input type="text" required name="qualification" class="form-control" value="${doctObj.qualification}">
					</div>
					
					<input type="hidden" name="email" value="${doctObj.email }">
					
					<div>
						<label class="form-label">Specialization</label>
						<select required name="spec" class="form-control">
							<option selected>${doctObj.specialist}</option>
							<%
							SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
							List<Specialist> list = dao.getAllSpecialist();
							for (Specialist s : list) {
							%>
							<option><%=s.getSpecialistName()%></option>
							<%
							}
							%>
						</select>
					</div>

					<div class="full-width">
						<label class="form-label">Mobile</label>
						<input type="tel" required name="mobile" class="form-control" value="${doctObj.mobile}">
					</div>

					<input type="hidden" name="id" value="${doctObj.id}">
					<div class="full-width mt-3">
						<button type="submit" class="btn btn-primary btn-custom col-12">Update</button>
					</div>
				</form>
			</div>

		</div>
	</div>

</body>
</html>