<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CureWell | Book Appointment</title>
<link rel="icon" type="image/png" href="img/favicon.ico" />
<%@include file="component/allcss.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    * {
        font-family: 'Poppins', sans-serif;
        box-sizing: border-box;
    }

    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        background: url('img/bg3.jpg') no-repeat center center fixed;
        background-size: cover;
    }

    .main-wrapper {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 50px 15px;
    }

    .glass-form {
        background: rgba(255, 255, 255, 0.2);
        backdrop-filter: blur(14px);
        -webkit-backdrop-filter: blur(14px);
        padding: 25px;
        border-radius: 20px;
        width: 100%;
        max-width: 600px;
        box-shadow: 0 8px 28px rgba(0, 0, 0, 0.25);
        color: #2c3e50;
    }

    .form-title {
        font-size: 1.7rem;
        font-weight: 600;
        text-align: center;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 16px;
    }

    .form-label {
        font-weight: 500;
        margin-bottom: 6px;
        display: block;
        color: #2c3e50;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        border-radius: 10px;
        border: 1px solid #ccc;
        font-size: 1rem;
        outline: none;
        background-color: rgba(255,255,255,0.4);
    }

    .text-danger {
        color: #e74c3c;
        text-align: center;
        margin-bottom: 10px;
    }

    .text-success {
        color: #27ae60;
        text-align: center;
        margin-bottom: 10px;
    }
    
    .btn-submit {
	padding: 10px;
	border-radius: 30px;
	font-weight: bold;
	font-size: 16px;
	transition: 0.3s ease-in-out;
}

.btn-submit:hover {
	transform: scale(1.03);
	box-shadow: 0 0 12px rgba(0, 0, 0, 0.2);
}

    @media (max-width: 768px) {
        .glass-form {
            padding: 20px;
        }

        .form-title {
            font-size: 1.5rem;
        }
    }
</style>
</head>
<body>

<%@include file="component/navbar.jsp"%>

<div class="main-wrapper">
    <div class="glass-form">
        <div class="form-title">Book Your Appointment</div>

        <c:if test="${not empty errorMsg}">
            <div class="text-danger">${errorMsg}</div>
            <c:remove var="errorMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty succMsg}">
            <div class="text-success">${succMsg}</div>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <form action="add_appoint" method="post">
            <input type="hidden" name="userid" value="${userObj.id}">

            <div class="form-group">
                <label class="form-label">Full Name</label>
                <input type="text" name="fullname" required class="form-control">
            </div>

            <div class="form-group">
                <label class="form-label">Gender</label>
                <select name="gender" required class="form-control">
                    <option value="">-- Select Gender --</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label">Age</label>
                <input type="number" name="age" required class="form-control">
            </div>

            <div class="form-group">
                <label class="form-label">Appointment Date</label>
                <input type="date" name="appoint_date" required class="form-control">
            </div>

            <div class="form-group">
                <label class="form-label">Email</label>
                <input type="email" name="email" required class="form-control">
            </div>

            <div class="form-group">
                <label class="form-label">Phone</label>
                <input type="tel" name="phno" maxlength="10" required class="form-control">
            </div>

            <div class="form-group">
                <label class="form-label">Diseases</label>
                <input type="text" name="diseases" required class="form-control">
            </div>

            <div class="form-group">
                <label class="form-label">Doctor</label>
                <select name="doct" required class="form-control">
                    <option value="">-- Select Doctor --</option>
                    <%
                        DoctorDao dao = new DoctorDao(DBConnect.getConn());
                        List<Doctor> list = dao.getAllDoctor();
                        for (Doctor d : list) {
                    %>
                        <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label">Full Address</label>
                <textarea name="address" rows="3" required class="form-control"></textarea>
            </div>

            <div class="form-group text-center">
                <c:if test="${empty userObj}">
                    <a href="user_login.jsp" class="btn btn-submit btn-success col-md-12">Login to Submit</a>
                </c:if>
                <c:if test="${not empty userObj}">
                	
                    <button type="submit" class="btn btn-submit btn-success col-md-12">Submit</button>
                </c:if>
            </div>
        </form>
    </div>
</div>

</body>
</html>
