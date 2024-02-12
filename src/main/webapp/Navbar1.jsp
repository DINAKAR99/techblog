<%@ page import="techblog.entites.User" %> <% User
u1=(User)session.getAttribute("user"); %> <%@ page errorPage="error.jsp"%>

<nav class="navbar secondary-background navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid c2">
    <a class="navbar-brand text-white" href="index.jsp">
      <span class="fa-brands fa-canadian-maple-leaf"></span>TECHBLOG</a
    >
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="btn-hov nav-item">
          <a
            class="nav-link active text-white"
            aria-current="page"
            href="index.jsp"
            ><span class="fa-solid fa-house"></span> HOME</a
          >
        </li>

        <li class="btn-hov nav-item dropdown">
          <a
            class="nav-link dropdown-toggle text-white"
            href="#"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <span class="fa fa-check-square-o"></span>
            CATEGORIES
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item text-black" href="#">Action</a></li>
            <li>
              <a class="dropdown-item text-black" href="#">Another action</a>
            </li>
            <li><hr class="dropdown-divider" /></li>
            <li>
              <a class="dropdown-item text-black" href="#"
                >Something else here</a
              >
            </li>
          </ul>
        </li>

        <li class="btn-hov nav-item">
          <a class="nav-link text-white" href="#"
            ><span class="fa fa-address-card"></span> CONTACT</a
          >
        </li>
      </ul>

      <!-- <form class="d-flex" role="search">
        <input
          class="form-control me-2"
          type="search"
          placeholder="Search"
          aria-label="Search"
        />
        <button class="btn btn-outline-dark text-white " type="submit">
          Search
        </button>
      </form> -->

      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <% if(u1==null){ %>

        <li class="btn-hov nav-item">
          <a class="nav-link text-white" href="login.jsp"
            ><span class="fa fa-user-circle"></span> LOGIN</a
          >
        </li>
        <li class="btn-hov nav-item">
          <a class="nav-link text-white" href="signup.jsp">
            <span class="fa fa-user-plus"></span> SIGNUP</a
          >
        </li>

        <% } else{ %>

        <li class="btn-hov nav-item">
          <a class="nav-link text-white" href="profile.jsp"
            ><span class="fa-solid fa-circle-user"></span>
            <%= u1.getName()%>
          </a>
        </li>
        <li class="btn-hov nav-item">
          <a class="nav-link text-white" href="logoutservlet"
            ><span class="fa-solid fa-arrow-right-from-bracket"></span>logout</a
          >
        </li>

        <% } %>
      </ul>
    </div>
  </div>
</nav>
