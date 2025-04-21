<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CureWell | Patient Log</title>
<link rel="icon" type="image/png" href="../img/favicon.ico"/>
<%@include file="../component/allcss.jsp"%>

<style>
body {
    background: url('../img/bg8.jpg') no-repeat center center fixed;
    background-size: cover;
    font-family: 'Poppins', sans-serif;
}

.overlay {
    background: rgba(255, 255, 255, 0.2);
    min-height: 100vh;
    padding: 30px 0;
}

.container {
    max-width: 100%;
    padding: 0 20px;
}

.paint-card {
    background: rgba(255, 255, 255, 0.8);
    padding: 25px;
    border-radius: 20px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    overflow-x: auto;
}

.appointments-heading {
    font-size: 24px;
    font-weight: bold;
    text-transform: uppercase;
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

.table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    border-radius: 15px;
    overflow: hidden;
    font-size: 14px;
}

.table thead {
    background-color: #007bff;
    color: #fff;
}

.table th,
.table td {
    padding: 12px 16px;
    text-align: center;
    white-space: nowrap;
}

.table td {
    color: #333;
}

.table tbody tr:hover {
    background-color: #f8f9fa;
    transition: 0.3s;
}

@media (max-width: 768px) {
    .appointments-heading {
        font-size: 18px;
    }
    .table th,
    .table td {
        font-size: 13px;
        padding: 8px;
    }
}
</style>

</head>
<body>
<%@include file="navbar.jsp"%>

<div class="overlay">
    <div class="container">
        <div class="paint-card">
            <p class="appointments-heading">Patient Details</p>

            <c:if test="${not empty errorMsg}">
                <p class="fs-4 text-center text-danger">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session" />
            </c:if>

            <c:if test="${not empty succMsg}">
                <p class="fs-4 text-center text-success">${succMsg}</p>
                <c:remove var="succMsg" scope="session" />
            </c:if>

            <table class="table">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Gender</th>
                        <th>Age</th>
                        <th>Appointment Date</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Disease</th>
                        <th>Doctor Name</th>
                        <th>Address</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
                    DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                    List<Appointment> list = dao.getAllAppointment();
                    for (Appointment ap : list) {
                        Doctor d = dao2.getDoctorById(ap.getDoctorId());
                    %>
                    <tr>
                        <td style="white-space: nowrap;"><%= ap.getFullName() %></td>
                        <td><%= ap.getGender() %></td>
                        <td><%= ap.getAge() %></td>
                        <td><%= ap.getAppointDate() %></td>
                        <td style="white-space: nowrap;"><%= ap.getEmail() %></td>
                        <td><%= ap.getPhNo() %></td>
                        <td><%= ap.getDiseases() %></td>
                        <td style="white-space: nowrap;"><%= d != null ? d.getFullName() : "N/A" %></td>
                        <td><%= ap.getAddress() %></td>
                        <td><%= ap.getStatus() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
