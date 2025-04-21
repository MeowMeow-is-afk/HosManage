<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CureWell | Patient Comment</title>
<link rel="icon" type="image/png" href="../img/favicon.ico" />
<%@include file="../component/allcss.jsp"%>
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

    .main-wrapper {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 60px 20px;
        margin-top:20px;
    }

    .glass-card {
        background: rgba(255, 255, 255, 0.25);
        backdrop-filter: blur(14px);
        -webkit-backdrop-filter: blur(14px);
        border-radius: 20px;
        padding: 40px 50px;
        width: 100%;
        max-width: 700px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.25);
        color: #2c3e50;
    }

    .form-title {
        font-size: 2rem;
        font-weight: 600;
        text-align: center;
        margin-bottom: 30px;
    }

    .form-label {
        font-weight: 500;
        margin-bottom: 6px;
        color: #2c3e50;
    }

    .form-control {
        border-radius: 12px;
        padding: 10px 12px;
        font-size: 1rem;
        background-color: rgba(255,255,255,0.8);
        border: 1px solid #ccc;
    }

    .form-control[readonly] {
        background-color: rgba(255,255,255,0.6);
    }

    .btn-primary {
        padding: 12px 30px;
        border-radius: 25px;
        font-weight: 600;
        font-size: 1rem;
        margin-top: 20px;
    }

    .form-group {
        margin-bottom: 18px;
    }
</style>
</head>
<body>

<c:if test="${empty doctObj}">
    <c:redirect url="../doctor_login.jsp"/>
</c:if>

<%@include file="navbar.jsp"%>

<div class="main-wrapper">
    <div class="glass-card">
        <p class="form-title">Patient Comment</p>
        
        <%
        
        int id = Integer.parseInt(request.getParameter("id"));
        AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
        Appointment ap = dao.getAppointmentById(id);
        
        %>

        <form action="../updateStatus" method="post" class="row">
            <div class="col-md-6 form-group">
                <label class="form-label">Patient Name</label>
                <input type="text" readonly value="<%=ap.getFullName() %>" class="form-control">
            </div>

            <div class="col-md-6 form-group">
                <label class="form-label">Age</label>
                <input type="text" readonly value="<%=ap.getAge() %>" class="form-control">
            </div>

            <div class="col-md-6 form-group">
                <label class="form-label">Mobile</label>
                <input type="text" readonly value="<%=ap.getPhNo() %>" class="form-control">
            </div>

            <div class="col-md-6 form-group">
                <label class="form-label">Disease</label>
                <input type="text" readonly value="<%=ap.getDiseases() %>" class="form-control">
            </div>

            <div class="col-md-12 form-group">
                <label class="form-label">Comment</label>
                <textarea name="comm" class="form-control" rows="3"></textarea>
            </div>

            <input type="hidden" name="id" value="<%=ap.getId() %>">
            <input type="hidden" name="did" value="<%=ap.getDoctorId() %>">

            <div class="col-md-12 text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
