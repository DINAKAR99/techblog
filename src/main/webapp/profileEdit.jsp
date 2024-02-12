<%@ page errorPage="error.jsp"%> <%@page import="techblog.entites.User" %>
<%User user=(User) session.getAttribute("user");%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script
      src="https://kit.fontawesome.com/ae336e36f1.js"
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    <%@include file="Navbar1.jsp" %>
    <!-- -----------profile edit----------- -->
    <div id="profile-details">
      <table class="table">
        <tbody>
          <tr>
            <th scope="row">ID:</th>
            <td><%=user.getId()%></td>
          </tr>
          <tr>
            <th scope="row">Email:</th>
            <td><%=user.getEmail()%></td>
          </tr>
          <tr>
            <th scope="row">Gender:</th>
            <td><%=user.getGender()%></td>
          </tr>
          <tr>
            <th scope="row">Status:</th>
            <td><%=user.getAbout()%></td>
          </tr>
          <tr>
            <th scope="row">Registered on:</th>
            <td><%=user.getRdate().toString()%></td>
          </tr>
        </tbody>
      </table>
    </div>
    <!--profile edit-->

    <div id="profile-edit">
      <h3 class="mt-2">Please Edit Carefully</h3>
      <form action="Edit" method="post" enctype="multipart/form-data">
        <table class="table">
          <tr>
            <td>ID:</td>
            <td><%=user.getId()%></td>
          </tr>
          <tr>
            <td>Email:</td>
            <td>
              <input
                type="email"
                class="form-control"
                name="user_email"
                placeholder="<%=user.getEmail()%>"
                value="<%=user.getEmail()%>"
              />
            </td>
          </tr>
          <tr>
            <td>Name:</td>
            <td>
              <input
                type="text"
                class="form-control"
                name="user_name"
                placeholder="<%=user.getName()%>"
                value="<%=user.getName()%>"
              />
            </td>
          </tr>
          <tr>
            <td>Password:</td>
            <td>
              <input
                type="password"
                class="form-control"
                name="user_password"
                placeholder="<%=user.getPassword()%>"
                value="<%=user.getPassword()%>"
              />
            </td>
          </tr>
          <tr>
            <td>Gender:</td>
            <td>
              <input type="radio" id="male" name="gender" value="male" />male
              <input
                type="radio"
                id="female"
                name="gender"
                value="female"
              />female
            </td>
          </tr>
          <tr>
            <td>About:</td>
            <td>
              <textarea
                rows="3"
                class="form-control"
                name="user_about"
                placeholder="<%=user.getAbout()%>"
                value="<%=user.getAbout()%>"
              ></textarea>
            </td>
          </tr>
          <tr>
            <td>New Profile:</td>
            <td>
              <input type="file" name="image" class="form-control" />
            </td>
          </tr>
        </table>
        <div class="container">
          <button type="submit" class="btn btn-outline-primary">Save</button>
        </div>
      </form>
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-seconadary" data-dismiss="modal">
        Close
      </button>
      <button id="edit-profile-button" type="button" class="btn btn-primary">
        EDIT
      </button>
    </div>
    <!-- buttonscript -->

    <!-- buttonscript -->
    <!--javascript-->

    <script>
      $(document).ready(function () {
        var user = "<%=user.getGender()%>";
        user = user.trim();
        console.log(user);
        console.log(user === "male");

        if (user === "male") {
          console.log("true");
          $("#male").prop("checked", true);
        } else $("#female").prop("checked", true);
        let editStatus = false;

        $("#edit-profile-button").click(function () {
          if (editStatus == false) {
            console.log("in editstatus false block");
            $("#profile-details").hide();

            $("#profile-edit").show();

            editStatus = true;
            $(this).text("Back");
          } else {
            console.log("in editstatus true block");
            $("#profile-details").show();

            $("#profile-edit").hide();
            editStatus = false;
            $(this).text("Edit");
          }
        });
      });
    </script>
  </body>
</html>
