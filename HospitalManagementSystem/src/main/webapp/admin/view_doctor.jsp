<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CureWell | Doctor Log</title>
<link rel="icon" type="image/png" href="../img/favicon.ico"/>
<%@include file="../component/allcss.jsp"%>
<style>
body {
    background-image: url('../img/bg8.jpg'); /* Use your own image path */
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    font-family: 'Poppins', sans-serif;
    color: #333;
}

.overlay {
    background: rgba(255, 255, 255, 0.2); /* Transparent glass effect *//* Glassmorphism effect */
    min-height: 100vh;
    padding-top: 30px;
    padding-bottom: 30px;
}

.paint-card {
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    border-radius: 20px;
    background-color: rgba(255, 255, 255, 0.7); /* Slightly transparent card background */
    padding: 25px;
    margin-top: 30px;
    transition: transform 0.3s ease-in-out;
}


.fs-4 {
    font-size: 1.8rem;
    font-weight: 600;
    color: #2d3436;
}

/* Table Styling */
.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
    overflow: hidden;
    border-radius: 12px;
    background-color: rgba(255, 255, 255, 0.8); /* Transparent table background */
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.table thead {
    background-color: #007bff;
    color: white;
}

.table th, .table td {
    padding: 14px 16px;
    text-align: center;
    font-size: 15px;
    vertical-align: middle;
    border: 1px solid #dee2e6;
}

.table thead th:first-child {
    border-top-left-radius: 12px;
}

.table thead th:last-child {
    border-top-right-radius: 12px;
}

.table tbody tr:last-child td:first-child {
    border-bottom-left-radius: 12px;
}

.table tbody tr:last-child td:last-child {
    border-bottom-right-radius: 12px;
}

.table tbody tr:hover {
    background-color: #f0f8ff;
    transition: background 0.3s;
}

.appointments-heading {
    font-size: 1.5rem;
    font-weight: 600;
    color: #333;
    text-align: center;
    text-transform: uppercase;
    margin-bottom: 20px;
    font-family: 'Poppins', sans-serif;
    line-height: 1.2;
}

/* Buttons */
.btn {
    font-size: 14px;
    padding: 6px 12px;
    border-radius: 6px;
    transition: 0.3s;
}

.btn-primary {
    background-color: #007bff;
    border: none;
    color: white;
}

.btn-danger {
    background-color: #dc3545;
    border: none;
    color: white;
}

.btn:hover {
    opacity: 0.85;
    transform: scale(1.05);
}

@media (max-width: 768px) {
    .table th, .table td {
        font-size: 13px;
        padding: 10px;
    }

    .fs-4 {
        font-size: 1.5rem;
    }
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="overlay">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-11">
					<div class="card paint-card">
						<div class="card-body">
							<p class="appointments-heading">Doctor Details</p>

							<!-- Error Message -->
							<c:if test="${not empty errorMsg}">
								<p class="fs-4 text-center text-danger">${errorMsg}</p>
								<c:remove var="errorMsg" scope="session" />
							</c:if>

							<!-- Success Message -->
							<c:if test="${not empty succMsg}">
								<p class="fs-4 text-center text-success">${succMsg}</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<!-- Table with Doctor Data -->
							<table class="table">
								<thead>
									<tr>
										<th>Full Name</th>
										<th>DOB</th>
										<th>Qualification</th>
										<th>Specialist</th>
										<th>Email</th>
										<th>Mob No</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<%
									DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
									List<Doctor> list2 = dao2.getAllDoctor();
									for (Doctor d : list2) {
									%>
									<tr>
										<td><%=d.getFullName()%></td>
										<td><%=d.getDob()%></td>
										<td><%=d.getQualification()%></td>
										<td><%=d.getSpecialist()%></td>
										<td><%=d.getEmail()%></td>
										<td><%=d.getMobile()%></td>
										<td>
											<a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary">Edit</a> 
											<a href="../deleteDoctor?id=<%=d.getId()%>" class="btn btn-sm btn-danger">Delete</a>
										</td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div> <!-- card-body -->
					</div> <!-- paint-card -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>
