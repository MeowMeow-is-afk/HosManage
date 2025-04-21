<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CureWell | Add Doctor</title>
<link rel="icon" type="image/png" href="../img/favicon.ico"/>
<%@include file="../component/allcss.jsp"%>
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
        background: url('../img/bg3.jpg') no-repeat center center fixed;
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
        margin-bottom: 15px;
    }

    .text-success {
        color: #27ae60;
        text-align: center;
        margin-bottom: 15px;
    }
    
    .btn-success {
        padding: 10px;
        border-radius: 30px;
        font-weight: bold;
        font-size: 16px;
        transition: 0.3s ease-in-out;
    }

    .btn-success:hover {
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

<%@include file="navbar.jsp"%>

<div class="main-wrapper">
    <div class="glass-form">
        <div class="form-title">Add Doctor</div>

        <c:if test="${not empty errorMsg}">
            <div class="fs-4 text-danger">${errorMsg}</div>
            <c:remove var="errorMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty succMsg}">
            <div class="fs-4 text-success">${succMsg}</div>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <form action="../addDoctor" method="post">
            <div class="form-group">
                <label class="form-label">Full Name</label>
                <input type="text" name="fullname" required class="form-control">
            </div>

            <div class="form-group">
                <label class="form-label">DOB</label>
                <input type="date" name="dob" required class="form-control">
            </div>

            <div class="form-group">
                <label class="form-label">Qualification</label>
                <input type="text" name="qualification" required class="form-control">
            </div>

            <div class="form-group">
                <label class="form-label">Specialization</label>
                <select name="spec" required class="form-control">
                    <option value="">-- Select --</option>
                    <%
                        SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                        List<Specialist> list = dao.getAllSpecialist();
                        for (Specialist s : list) {
                    %>
                        <option value="<%=s.getSpecialistName()%>"><%=s.getSpecialistName()%></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label">Email</label>
                <input type="email" name="email" required class="form-control">
            </div>

            <div class="form-group">
                <label class="form-label">Mobile</label>
                <input type="tel" name="mobile" required class="form-control">
            </div>

            <div class="form-group">
                <label class="form-label">Password</label>
                <input type="password" name="password" required class="form-control">
            </div>

            <div class="form-group text-center">
            	<br>
                <button type="submit" class="btn btn-success col-md-12">Submit</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
