<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!-- Custom Dropdown Styles -->
<style>
  .dropdown-menu {
    background-color: #f8f9fa;
    min-width: 100px;
  }

  .dropdown-menu .dropdown-item {
    color: #212529;
  }

  .dropdown-menu .dropdown-item:hover {
    background-color: #e9ecef;
    color: #000;
  }

  .navbar .nav-link {
    font-weight: 500;
    padding-right: 15px;
  }

  .dropdown-toggle {
    padding: 6px 12px;
    font-size: 0.9rem;
    font-weight: 500;
    border-radius: 5px;
  }
</style>

<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success shadow-sm">
  <div class="container-fluid">
    <a class="navbar-brand d-flex align-items-center" href="index.jsp">
      <i class="fas fa-clinic-medical fa-lg me-1"></i> CureWell
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" href="index.jsp">HOME</a></li>
        <li class="nav-item"><a class="nav-link active" href="doctor.jsp">ADD DOCTOR</a></li>
        <li class="nav-item"><a class="nav-link active" href="view_doctor.jsp">VIEW DOCTOR</a></li>
        <li class="nav-item"><a class="nav-link active" href="patient.jsp">PATIENT</a></li>
      </ul>

      <div class="dropdown">
        <button class="btn btn-light dropdown-toggle" type="button"
          id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
          Admin
        </button>
        <ul class="dropdown-menu dropdown-menu-end mt-2" aria-labelledby="dropdownMenuButton1">
          <li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
        </ul>
      </div>
    </div>
  </div>
</nav>
<!-- Navbar End -->
