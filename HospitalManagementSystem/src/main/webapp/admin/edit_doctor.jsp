<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CureWell | Edit Details</title>
<link rel="icon" type="image/png" href="../img/favicon.ico"/>
<%@include file="../component/allcss.jsp"%>

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

    .main-content-wrapper {
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 60px 15px 30px;
    }

    .paint-card {
        background: rgba(255, 255, 255, 0.5);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        border-radius: 20px;
        padding: 30px 40px;
        width: 100%;
        max-width: 600px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.4);
        color: #333;
    }

    .form-label {
        font-weight: 500;
    }

    .form-control {
        border-radius: 10px;
        padding: 8px 10px;
    }

    .btn-primary {
        padding: 10px;
        border-radius: 30px;
        font-weight: bold;
        font-size: 16px;
    }

    .fs-3 {
        font-size: 1.8rem;
        font-weight: bold;
        color: #2c3e50;
    }
</style>
</head>
<body>

<%@include file="navbar.jsp"%>

<div class="main-content-wrapper">
    <div class="paint-card">
        <div class="card-body">
            <p class="fs-3 text-center">Edit Doctor</p>

            <c:if test="${not empty errorMsg}">
                <p class="fs-5 text-center text-danger">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session" />
            </c:if>

            <c:if test="${not empty succMsg}">
                <div class="fs-5 text-center text-success" role="alert">${succMsg}</div>
                <c:remove var="succMsg" scope="session" />
            </c:if>

            <%
                int id = Integer.parseInt(request.getParameter("id"));
                DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                Doctor d = dao2.getDoctorById(id);
            %>

            <form action="../updateDoctor" method="post">
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" required name="fullname" class="form-control" value="<%=d.getFullName()%>">
                </div>

                <div class="mb-3">
                    <label class="form-label">DOB</label>
                    <input type="date" required name="dob" class="form-control" value="<%=d.getDob()%>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Qualification</label>
                    <input required name="qualification" type="text" class="form-control" value="<%=d.getQualification()%>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Specialization</label>
                    <select required name="spec" class="form-control">
                        <option selected><%=d.getSpecialist()%></option>
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

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input required name="email" type="email" class="form-control" value="<%=d.getEmail()%>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Mobile</label>
                    <input required name="mobile" type="tel" class="form-control" value="<%=d.getMobile()%>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input required name="password" type="text" class="form-control" value="<%=d.getPassword()%>">
                </div>

                <input type="hidden" name="id" value="<%=d.getId()%>">
                <br>
                <button type="submit" class="btn btn-primary col-md-12">Update</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
