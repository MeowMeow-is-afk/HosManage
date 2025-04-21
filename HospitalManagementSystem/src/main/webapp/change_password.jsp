<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CureWell | Change Password</title>
    <link rel="icon" type="image/png" href="img/favicon.ico" />
    <%@ include file="component/allcss.jsp" %>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        * {
            font-family: 'Poppins', sans-serif;
        }

        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            background: url('img/bg3.jpg') no-repeat center center fixed;
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
            max-width: 500px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.4);
            color: #333;
        }

        .form-label {
            font-weight: 500;
        }

        .form-control {
            border-radius: 10px;
            padding: 10px;
            background-color: rgba(255,255,255,0.2);
            border: 1px solid rgba(255,255,255,0.3);
            color: #000;
        }

        .form-control::placeholder {
            color: #555;
        }

        .btn-change {
            padding: 10px;
            border-radius: 30px;
            font-weight: bold;
            font-size: 16px;
            transition: all 0.3s ease-in-out;
        }

        .btn-change:hover {
            transform: scale(1.02);
            box-shadow: 0 0 12px rgba(0,0,0,0.2);
        }

        .fs-3 {
            font-size: 1.8rem;
            font-weight: bold;
            color: #2c3e50;
        }

        .text-success, .text-danger {
            text-align: center;
            font-weight: 500;
        }
    </style>
</head>
<body>

<%@ include file="component/navbar.jsp" %>

<c:if test="${empty userObj}">
    <c:redirect url="user_login.jsp" />
</c:if>

<div class="main-content-wrapper">
    <div class="paint-card">
        <div class="card-body">
            <p class="fs-3 text-center">Change Password</p>

            <c:if test="${not empty errorMsg}">
                <p class="fs-5 text-danger">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session" />
            </c:if>

            <c:if test="${not empty succMsg}">
                <p class="fs-5 text-success">${succMsg}</p>
                <c:remove var="succMsg" scope="session" />
            </c:if>

            <form action="userChangePassword" method="post">
                <div class="mb-3">
                    <label class="form-label">New Password</label>
                    <input type="password" required name="newPassword" class="form-control">
                </div>

                <div class="mb-3">
                    <label class="form-label">Old Password</label>
                    <input type="password" required name="oldPassword" class="form-control">
                </div>

                <input type="hidden" value="${userObj.id}" name="uid">

                <br>
                <button type="submit" class="btn btn-success btn-change col-md-12">Change Password</button>
            </form>
        </div>
    </div>
</div>

</body>
</html>
