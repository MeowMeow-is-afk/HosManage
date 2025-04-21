<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CureWell | Admin Home</title>
    <link rel="icon" type="image/png" href="../img/favicon.ico"/>
    <%@include file="../component/allcss.jsp"%>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        * {
            font-family: 'Poppins', sans-serif;
        }

        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            background: url('../img/bg3.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .container {
            margin-top: 50px;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
        }

        .paint-card {
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(10px);
            box-shadow: 0 6px 24px rgba(0,0,0,0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .paint-card:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 36px rgba(0,0,0,0.3);
        }

        .card-body i {
            color: #2980b9;
            margin-bottom: 10px;
        }

        .fs-4 {
            font-weight: 600;
            color: #34495e;
        }

        .fs-5 {
            font-weight: 500;
        }

        .text-success {
            color: #27ae60 !important;
        }

        .modal-content {
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.9);
        }

        .btn-primary {
            border-radius: 30px;
            padding: 8px 20px;
            font-weight: 600;
            background-color: #2980b9;
            border: none;
        }

        .btn-primary:hover {
            background-color: #3498db;
        }

        .btn-secondary {
            border-radius: 20px;
            background-color: #7f8c8d;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #95a5a6;
        }
    </style>
</head>
<body>

<%@include file="navbar.jsp"%>

<c:if test="${empty adminObj}">
    <c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>

<div class="container">
    <p class="text-center fs-4">Admin Dashboard</p>

    <c:if test="${not empty errorMsg}">
        <p class="fs-5 text-center text-danger">${errorMsg}</p>
        <c:remove var="errorMsg" scope="session" />
    </c:if>

    <c:if test="${not empty succMsg}">
        <p class="fs-5 text-center text-success">${succMsg}</p>
        <c:remove var="succMsg" scope="session" />
    </c:if>
    
    <% DoctorDao dao = new DoctorDao(DBConnect.getConn()); %>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-md fa-3x"></i><br>
                    <p class="fs-4">Doctors <br><%=dao.countDoctor() %></p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="fas fa-user-circle fa-3x"></i><br>
                    <p class="fs-4">Users <br><%=dao.countUser() %></p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card">
                <div class="card-body text-center text-success">
                    <i class="far fa-calendar-check fa-3x"></i><br>
                                       <p class="fs-4">Total Appointments <br><%=dao.countAppointment() %></p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                <div class="card-body text-center text-success">
                    <i class="fas fa-stethoscope fa-3x"></i><br>
                    <p class="fs-4">Category <br><%=dao.countSpecialist() %></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content glass-bg">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../addSpecialist" method="post">
                    <div class="form-group">
                        <label>Enter Specialization Category</label> 
                        <input type="text" name="specName" class="form-control" required>
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS (if not already included in allcss.jsp) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>

</body>
</html>