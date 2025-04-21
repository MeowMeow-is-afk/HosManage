<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!-- Custom Dropdown Styles -->
<style>
  .dropdown-menu {
    background-color: #f8f9fa;
  }

  .dropdown-menu .dropdown-item {
    color: #212529;
  }

  .dropdown-menu .dropdown-item:hover {
    background-color: #e9ecef;
    color: #000;
  }

  .navbar-brand i {
    margin-right: 5px;
  }

  .dropdown-toggle {
    padding: 6px 12px;
    font-size: 0.95rem;
    border-radius: 5px;
  }

  .navbar .nav-link {
    font-weight: 500;
    padding-right: 15px;
  }
</style>

<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success shadow-sm">
  <div class="container-fluid">
    <a class="navbar-brand d-flex align-items-center" href="index.jsp">
      <i class="fa-solid fa-house-medical fa-lg me-1"></i> CureWell
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

        <!-- If Not Logged-in -->
        <c:if test="${empty userObj}">
          <li class="nav-item">
            <a class="nav-link active" href="admin_login.jsp">
              <i class="fa-solid fa-right-to-bracket"></i> ADMIN
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="doctor_login.jsp">DOCTOR</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="user_appointment.jsp">APPOINTMENT</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="user_login.jsp">USER</a>
          </li>
        </c:if>

        <!-- If Logged-in -->
        <c:if test="${not empty userObj}">
          <li class="nav-item">
            <a class="nav-link active" href="user_appointment.jsp">APPOINTMENT</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="view_appointment.jsp">VIEW APPOINTMENTS</a>
          </li>

          <!-- Dropdown -->
          <li class="nav-item dropdown">
            <button class="btn btn-light dropdown-toggle d-flex align-items-center" type="button"
              id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fa-solid fa-circle-user me-1"></i> ${userObj.fullName}
            </button>
            <ul class="dropdown-menu dropdown-menu-end mt-2" aria-labelledby="dropdownMenuButton1">
              <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
              <li><a class="dropdown-item" href="userLogout">Logout</a></li>
            </ul>
          </li>
        </c:if>

      </ul>
    </div>
  </div>
</nav>
<!-- Navbar End -->
