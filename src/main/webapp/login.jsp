<%@ page import ="techblog.entites.Message" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>login page</title>

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="css/style.css" />

    <script
      src="https://kit.fontawesome.com/ae336e36f1.js"
      crossorigin="anonymous"
    ></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <%@include file="Navbar1.jsp" %>
    <% response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setHeader("Pragma", "no-cache"); response.setDateHeader("Expires", 0);  %>

    <main
      class="primary-background banner-background d-flex align-items-center"
      style="height: 97vh"
    >
      <div class="container">
        <div class="row">
          <div class="col-md-4 offset-md-4">
            <div class="card c1 bg-transparent text-white shadow border-3">
              <div class="card-header text-center">
                <div class="card-body">
                  <span class="fa fa-user-plus fa-3x"></span>
                  <p>login here</p>

                  <% Message m1 = (Message)session.getAttribute("msg"); if (m1
                  != null) { %>
                  <div class="alert <%= m1.getCssClass() %>" role="alert">
                    <%= m1.getContent()%>
                  </div>
                  <% } session.removeAttribute("msg"); %>
                  <form action="login" method="post">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Email address</label>
                      <input
                        type="text"
                        name="email"
                        class="form-control mb-2"
                        id="exampleInputEmail1"
                        aria-describedby="emailHelp"
                        placeholder="Enter email"
                      />
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input
                        type="password"
                        name="password"
                        class="form-control mb-2"
                        id="exampleInputPassword1"
                        placeholder="Password"
                      />
                    </div>
                    <div class="form-group">
                      <button
                        type="submit"
                        class="btn btn-primary btn-hov mt-2"
                        style="background-color: black; border-color: black"
                      >
                        Submit
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
