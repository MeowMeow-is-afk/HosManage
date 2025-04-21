<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CureWell | Appointments</title>
<link rel="icon" type="image/png" href="img/favicon.ico" />
<%@include file="component/allcss.jsp"%>
<style>
body {
    background-image: url('img/bg7.jpg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    font-family: 'Poppins', sans-serif;
    color: #333;
}

.overlay {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(0px); /* Apply 1px blur effect */
    min-height: 100vh;
    padding-top: 30px;
    padding-bottom: 30px;
}

.paint-card {
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
    background-color: rgba(255, 255, 255, 0.6); /* Adjust opacity for glass effect */
    padding: 25px;
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

.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
    overflow: hidden;
    border-radius: 12px;
    background-color: #ffffff;
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

.table tbody tr:hover {
    background-color: #f0f8ff;
    transition: background 0.3s;
}

@media (max-width: 768px) {
    .table th, .table td {
        font-size: 13px;
        padding: 10px;
    }

    .appointments-heading {
        font-size: 1.3rem;
    }
}
.btn-1{
    font-size: 15px;  /* Larger button text */
    padding: 8px 16px;  /* Larger padding */
    border-radius: 6px;
    transition: 0.3s;
}

.btn-warning {
    background-color: #ffc107;
    border: none;
    color: #212529;
}


.btn-warning:hover {
    opacity: 0.85;
}

}
</style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>
    
    <c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

    <div class="overlay">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-11">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="appointments-heading">APPOINTMENTS</p>

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Full Name</th>
                                        <th>Gender</th>
                                        <th>Age</th>
                                        <th>Appointment Date</th>
                                        <th>Diseases</th>
                                        <th>Doctor Name</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    User user = (User) session.getAttribute("userObj");
                                    AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
                                    DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                    List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
                                    for (Appointment ap : list) {
                                        Doctor d = dao2.getDoctorById(ap.getDoctorId());
                                    %>
                                    <tr>
                                        <td><%=ap.getFullName()%></td>
                                        <td><%=ap.getGender()%></td>
                                        <td><%=ap.getAge()%></td>
                                        <td><%=ap.getAppointDate()%></td>
                                        <td><%=ap.getDiseases()%></td>
                                        <td><%=d.getFullName()%></td>
                                        <td>
                                            <% if ("Pending".equalsIgnoreCase(ap.getStatus())) { %>
                                                <span class="btn btn-1 btn-warning btn-sm">Pending</span>
                                            <% } else { %>
                                                <span><%=ap.getStatus()%></span>
                                            <% } %>
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
