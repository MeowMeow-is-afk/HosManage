<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CureWell | View Patients</title>
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
            padding: 80px 0 30px 0;
        }

        .paint-card {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            padding: 25px;
        }

        .heading {
            font-size: 24px;
            font-weight: bold;
            color: #2d3436;
            text-align: center;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 15px;
            overflow: hidden;
            background-color: #fff;
            font-size: 14px;
        }

        .table thead {
            background-color: #007bff;
            color: #fff;
        }

        .table th, .table td {
            padding: 12px 16px;
            text-align: center;
            border: 1px solid #dee2e6;
            white-space: nowrap;
        }

        .table tbody tr:hover {
            background-color: #f1f8ff;
            transition: 0.3s;
        }

        .btn-success {
            font-size: 13px;
            padding: 6px 12px;
            border-radius: 6px;
            text-decoration: none;
            color: white;
        }

        .btn-success {
            background-color: #28a745;
        }

        .btn-success.disabled {
			opacity: 0.7;
            cursor: not-allowed;
            pointer-events: none;
        }

        @media (max-width: 768px) {
            .table th, .table td {
                font-size: 12px;
                padding: 10px;
            }

            .heading {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>

    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <%@include file="navbar.jsp"%>

    <div class="overlay">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-11">
                    <div class="paint-card">
                        <div class="card-body">
                            <p class="heading">Patient Details</p>

                            <c:if test="${not empty succMsg}">
                                <p class="fs-5 text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty errorMsg}">
                                <p class="fs-5 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session"/>
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
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Doctor d = (Doctor) session.getAttribute("doctObj");
                                        AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
                                        List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
                                        for (Appointment ap : list) {
                                    %>
                                    <tr>
                                        <td><%= ap.getFullName() %></td>
                                        <td><%= ap.getGender() %></td>
                                        <td><%= ap.getAge() %></td>
                                        <td><%= ap.getAppointDate() %></td>
                                        <td><%= ap.getEmail() %></td>
                                        <td><%= ap.getPhNo() %></td>
                                        <td><%= ap.getDiseases() %></td>
                                        <td><%= ap.getStatus() %></td>
                                        <td>
                                            <%
                                                if ("Pending".equalsIgnoreCase(ap.getStatus())) {
                                            %>
                                            <a href="comment.jsp?id=<%= ap.getId() %>" class="btn btn-success">Comment</a>
                                            <%
                                                } else {
                                            %>
                                            <a href="#" class="btn btn-success disabled">Comment</a>
                                            <%
                                                }
                                            %>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
