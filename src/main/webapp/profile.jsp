<%@ page errorPage="error.jsp" %>
  <%@ page import="techblog.entites.User" %>
    <%@ page import="java.io.File" %>
      <%@page import="techblog.entites.Message" %>
        <%@page import="techblog.entites.helper.*" %>
          <%@page import="techblog.entites.*" %>
            <%@page import="java.util.List" %>
              <%@ page import="java.util.ArrayList" %>
                <%@page import="techblog.entites.dao.*" %>
                  <% User u1=(User)session.getAttribute("user"); %>
                    <% Message mess=(Message)session.getAttribute("msg") ; %>
                      <% Message messi=(Message)session.getAttribute("msg1") ; %>



                        <!DOCTYPE html>
                        <html lang="en">

                        <head>
                          <meta charset="UTF-8" />
                          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                          <title>profile</title>

                          <link rel="stylesheet"
                            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
                          <link rel="stylesheet" href="css/style.css" />

                          <script src="https://kit.fontawesome.com/ae336e36f1.js" crossorigin="anonymous"></script>
                          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                            crossorigin="anonymous" />
                          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                        </head>
<% response.setHeader("Cache-Control", "no-cache"); response.setHeader("Cache-Control", "no-store"); response.setHeader("Pragma", "no-cache"); response.setDateHeader("Expires", 0);  %>

                        <body>
                          <nav class="navbar secondary-background navbar-expand-lg bg-body-tertiary">
                            <div class="container-fluid c2">
                              <a class="navbar-brand text-white btn-hov1" href="index.jsp">
                                <span class="fa-brands fa-canadian-maple-leaf"></span>TECHBLOG</a>
                              <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                              </button>
                              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                  <li class="nav-item">
                                    <a class="nav-link active text-white btn-hov1" aria-current="page"
                                      href="index.jsp"><span class="fa-solid fa-house"></span> HOME</a>
                                  </li>

                                  <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle text-white btn-hov1" href="#" role="button"
                                      data-bs-toggle="dropdown" aria-expanded="false">
                                      <span class="fa fa-check-square-o"></span>
                                      CATEGORIES
                                    </a>
                                    <ul class="dropdown-menu">
                                      <li><a class="dropdown-item text-black" href="#">Action</a></li>
                                      <li>
                                        <a class="dropdown-item text-black" href="#">Another action</a>
                                      </li>
                                      <li>
                                        <hr class="dropdown-divider" />
                                      </li>
                                      <li>
                                        <a class="dropdown-item text-black" href="#">Something else here</a>
                                      </li>
                                    </ul>
                                  </li>

                                  <li class="nav-item">
                                    <a class="nav-link text-white btn-hov1" href="#" data-bs-toggle="modal"
                                      data-bs-target="#add-post-modal"><span class="fa fa-address-card"></span>
                                      DO-POST</a>
                                  </li>

                                  <li class="nav-item">
                                    <a class="nav-link text-white btn-hov1" href="#"><span
                                        class="fa fa-address-card"></span> CONTACT</a>
                                  </li>

                                  <li class="nav-item">
                                    <a class="nav-link text-white btn-hov1" href="signup.jsp">
                                      <span class="fa fa-user-plus"></span> SIGNUP</a>
                                  </li>
                                </ul>

                                <ul class="navbar-nav ms-auto">
                                  <li class="nav-item">
                                    <a class="nav-link text-white btn-hov1" data-bs-toggle="modal"
                                      data-bs-target="#profileEdit-modal"><span
                                        class="fa-solid fa-circle-user  "></span>
                                      <%= u1.getName()%>
                                    </a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link text-white btn-hov1" href="logoutservlet"><span
                                        class="fa-solid fa-arrow-right-from-bracket  "></span>logout</a>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </nav>
                          <!-- display-box -->

                          <% if (mess!=null){ %>

                            <div class="alert <%= mess.getCssClass() %>" role="alert">
                              <%=mess.getContent()%>
                            </div>
                            <% } %>


                              <% if (messi!=null){ %>

                                <div class="alert <%= messi.getCssClass() %>" role="alert">
                                  <%=messi.getContent()%>
                                </div>
                                <% } %>

                                  <main>
                                    <div class="container-fluid">
                                      <div class="row mt-2 ">
                                        <!-- CATEGORIES -->
                                        <div class="col-md-4 col-lg-4">
                                          <form id="categoryForm" method="post" action="postfecthbyid">

                                            <ul class="list-group">
                                              <li class="list-group-item active bg-dark text-white  "
                                                aria-current="true">CATEGORIES</li>
                                              <% PostDao p1=new PostDao(ConnectionProvider.getConnection()) ;
                                                List<Category> c1 =p1.getAllCategories();

                                                for(Category c:c1){

                                                %>
                                                <li class="list-group-item sub-item btn-hov "
                                                  onclick="postfetcher('<%= c.getCid()%>')">
                                                  <%= c.getName()%>
                                                </li>

                                                <% }%>
                                                  <input type="hidden" id="catid2" name="catid" value="">
                                            </ul>
                                          </form>
                                        </div>
                                        <!-- CATEGORIES -->
                                        <!-- posts -->
                                        <div class="col-lg-8 col-md-8">

                                          <div id="loader"
                                            class="container align-content-center   justify-content-center ">
                                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                                            <h2 class="mt-2 ">loading...</h2>
                                          </div>


                                          <div id="allposts" class="container-fluid  row ">

                                            <% ArrayList<Post> fecthPosts = (ArrayList<Post>
                                                )session.getAttribute("fetchedposts");

                                                if (fecthPosts != null) {

                                                for (Post post : fecthPosts) {

                                                %>

                                                <div class="col-lg-4  col-md-6">
                                                  <div class="card mb-3 " style="width: 250px ; height: 400px; ">
                                                    <img style="height: 200px"
                                                      src="<%=request.getContextPath()%>/post_pics/<%= post.getpPic()%>"
                                                      class="card-img-top" alt="post" />
                                                    <div class="card-body">
                                                      <h5 class="card-title">
                                                        <%= post.getpTitle()%>
                                                      </h5>
                                                      <p class="card-text">
                                                        <%= post.getpContent()%>
                                                      </p>
                                                      <a href="show_code.jsp?post_id=<%= post.getPid()%>"
                                                        class="btn btn-primary">READ MORE</a>

                                                    </div>
                                                    <div class="card-footer d-flex justify-content-between   ">
                                                      <a class="text-decoration-none comment  ">
                                                        <i class="fa-regular fa-comment"></i>
                                                        <span class="comment-count">
                                                    <%= p1.getAllcommentsCountForPost(post.getPid()) %>
                                                        </span></a>


                                                      <a class="text-decoration-none share  ">
                                                        <i class="fa-solid fa-share-nodes"></i>





                                                         <% if(p1.getlikeCountForPostbyUid(post.getPid(),u1.getId())>0 ) {
                                                    %>
                                                    <a class="text-decoration-none like liked "   postid="<%= post.getPid()%>">
                                                       <i class="fa-regular fa-thumbs-up "></i>

                                                   <span class="like-count " id="like-count">
                                                     <%= p1.getlikeCountForPost(post.getPid())%>
                                                    </span>


                                                     </a>

                                                    <% }
                                                    else{ 
                                                    %>
                                                    <a class="text-decoration-none like unliked"   postid="<%= post.getPid()%>">
                                                       <i class="fa-regular fa-thumbs-up " ></i>

                                                      <span class="like-count " id="like-count">
                                                     <%= p1.getlikeCountForPost(post.getPid())%>
                                                    </span>

                                                     </a>
                                                    <% }%>





                                                    </div>
                                                  </div>
                                                </div>

                                                <% } } else{ %>
                                                  <div class="display-3 ">NO POSTS TO DISPLAY</div>
                                                  <% }%>


                                          </div>
                                        </div>

                                        <!-- posts -->
                                      </div>
                                    </div>
                                    </div>
                                  </main>

                                  <!-- display-box -->

                                  <!-- editmodal -->
                                  <div class="modal fade" id="profileEdit-modal" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                      <div class="modal-content">
                                        <div class="modal-header primary-background text-white text-center">
                                          <h5 class="modal-title">Tech Blog</h5>
                                          <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                          </button>
                                        </div>
                                        <div class="modal-body">
                                          <div class="container text-center" id="profile-details">
                                            <img src="<%=request.getContextPath()%>/pics/<%= u1.getProfile()%>" alt=" "
                                              class="img-fluid" style="border-radius: 50%; max-width: 150px" />
                                            <br />
                                            <h5 class="modal-title mt-3" id="exampleModalLabel">
                                              <%=u1.getName()%>
                                            </h5>
                                            <!--//details-->
                                            <table class="table">
                                              <tbody>
                                                <tr>
                                                  <th scope="row">ID:</th>
                                                  <td>
                                                    <%=u1.getId()%>
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <th scope="row">Email:</th>
                                                  <td>
                                                    <%=u1.getEmail()%>
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <th scope="row">Gender:</th>
                                                  <td>
                                                    <%=u1.getGender()%>
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <th scope="row">Status:</th>
                                                  <td>
                                                    <%=u1.getAbout()%>
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <th scope="row">Registered on:</th>
                                                  <td>
                                                    <%=u1.getRdate().toString()%>
                                                  </td>
                                                </tr>
                                              </tbody>
                                            </table>
                                          </div>

                                          <div id="profile-edit">
                                            <h3 class="mt-2">Please Edit Carefully</h3>
                                            <form action="Edit" method="post" enctype="multipart/form-data">
                                              <table class="table">
                                                <tr>
                                                  <td>ID:</td>
                                                  <td>
                                                    <%=u1.getId()%>
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <td>Email:</td>
                                                  <td>
                                                    <input type="email" class="form-control" name="user_email"
                                                      placeholder="<%=u1.getEmail()%>" value="<%=u1.getEmail()%>" />
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <td>Name:</td>
                                                  <td>
                                                    <input type="text" class="form-control" name="user_name"
                                                      placeholder="<%=u1.getName()%>" value="<%=u1.getName()%>" />
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <td>Password:</td>
                                                  <td>
                                                    <input type="password" class="form-control" name="user_password"
                                                      placeholder="<%=u1.getPassword()%>"
                                                      value="<%=u1.getPassword()%>" />
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <td>Gender:</td>
                                                  <td>
                                                    <input type="radio" id="male" name="gender" value="male" />male
                                                    <input type="radio" id="female" name="gender"
                                                      value="female" />female
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <td>About:</td>
                                                  <td>
                                                    <textarea rows="3" class="form-control" name="user_about"
                                                      placeholder="<%=u1.getAbout()%>"
                                                      value="<%=u1.getAbout()%>"></textarea>
                                                  </td>
                                                </tr>

                                                <tr>
                                                  <td>Old Profile:</td>
                                                  <td>
                                                    <input type="text" class="form-control" name="old_pic"
                                                      placeholder="<%=u1.getProfile()%>" value="<%=u1.getProfile()%>" />
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <td>New Profile:</td>
                                                  <td>
                                                    <input type="file" name="image" class="form-control" />
                                                  </td>
                                                </tr>

                                                <tr>
                                                  <td>Delete Profile Picture</td>
                                                  <td>
                                                    <input type="checkbox" name="delpic" id="delpic" value="del" />
                                                  </td>
                                                </tr>
                                              </table>
                                              <div class="container">
                                                <button type="submit" class="btn btn-outline-dark btn-dark text-white">
                                                  Save
                                                </button>
                                              </div>
                                            </form>
                                          </div>
                                        </div>

                                        <div class="modal-footer">
                                          <button type="button" id="edit-profile-button" class="btn btn-primary"
                                            style="background-color: black; border-color: black">
                                            EDIT
                                          </button>
                                          <button type="button" data-bs-dismiss="modal" class="btn text-white"
                                            style="background-color: black; border-color: black">
                                            Close
                                          </button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- editmodal -->

                                  <!-- postmodal -->

                                  <div class="modal fade" id="add-post-modal" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h1 class="modal-title fs-5" id="exampleModalLabel">
                                            PROVIDE POST DETAIL
                                          </h1>
                                          <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                          <form method="post" id="postform" enctype="multipart/form-data">
                                            <div class="form-group">
                                              <input type="text" name="ptitle" class="form-control mb-2  "
                                                placeholder="enter title" />
                                            </div>
                                            <div class="form-group">
                                              <textarea class="form-control mb-2  " name="pcontent"
                                                placeholder="enter post content"></textarea>
                                            </div>

                                            <div class="form-group">
                                              <textarea class="form-control mb-2  " name="pcode"
                                                placeholder="enter your program (if any)"></textarea>
                                            </div>

                                            <div class="form-group">
                                              <select name="catid" class="form-control mb-2  ">
                                                <option selected>---select-category--</option>
                                                <% for(Category c:c1){ %>
                                                  <option value="<%= c.getCid()%>">
                                                    <%= c.getName()%>
                                                  </option>



                                                  <% }%>
                                              </select>
                                            </div>
                                            <div class="form-group">
                                              <label>select picture</label>
                                              <input type="file" name="image1" class="form-control" />
                                            </div>

                                            <div class="container">
                                              <button type="submit"
                                                class="btn btn-outline-dark btn-dark text-white mt-2 ">
                                                Save
                                              </button>
                                            </div>
                                          </form>
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button"
                                            class="btn btn-outline-dark btn-dark text-white btn-secondary "
                                            data-bs-dismiss="modal">
                                            Close
                                          </button>

                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- postmodal -->

                                  <script
                                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                                    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                                    crossorigin="anonymous"></script>
                                  <script
                                    src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
                                    integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
                                    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                                  <script>
                                    $(document).ready(function () {
                                      $("#loader").hide();





                                      $(".sub-item").on("click", function () {
                                        $(".sub-item").removeClass("active");
                                        $("#loader").show();

                                        $(this).addClass("active");

                                        $("#allposts").hide();


                                      })

                                      $("#postform").on("submit", function (e) {
                                        e.preventDefault();
                                        let f = new FormData(this);

                                        $.ajax({


                                          url: "postservlet",
                                          type: "POST",
                                          data: f,
                                          success: function (data, textstatus, jqXHR) {
                                            console.log("in successs");
                                            if (data.trim() == "done") {
                                              console.log(data);

                                              swal("GOOD JOB", "POST SAVED SUCCESSFULLY", "success")
                                            }
                                            else {
                                              console.log(data);

                                              swal("error", "POST NOT SAVED ", "error")
                                            }


                                          },
                                          error: function (jqXHR, textstatus, errorThrown) {
                                            console.log("in error");
                                          },
                                          processData: false,
                                          contentType: false

                                        })

                                      })


                                      $("#categoryForm").on("submit", function (e) {
                                        $("#loader").hide();
                                        $("#allposts").show();


                                        e.preventDefault();

                                        $.ajax({
                                          url: "postfecthbyid",
                                          type: "POST",
                                          data: f,
                                          success: function () {



                                            console.log("posted the fetcher by id ");

                                          },
                                          error: function () {
                                            console.log("errro in posting  the fetcher by id ");
                                          },
                                          processData: false,
                                          contentType: false

                                        })






                                      })



                                    });



                                  </script>

                                  <script>
                                    $(document).ready(function () {
                                      let editStatus = false;
                                      $("#profile-edit").hide();
                                      var user = "<%=u1.getGender()%>";
                                      user = user.trim();
                                      console.log(user);
                                      console.log(user === "male");

                                      if (user === "male") {
                                        console.log("true");
                                        $("#male").prop("checked", true);
                                      } else $("#female").prop("checked", true);

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

                                  <script>
                                    var shareslist = document.getElementsByClassName("share")
                                    for (let i = 0; i < shareslist.length; i++) {
                                      shareslist[i].addEventListener("click", function () {
                                        console.log("shared");
                                        var phno = 9014556315;

                                        var message = encodeURIComponent("Check out the blog post: below ")

                                        var whatsappURL = 'https://wa.me/' + phno + "?text=" + message;
                                        var twitterURL = 'https://twitter.com/intent/tweet?text=' + message;
                                        var windowWidth = 500;
                                        var windowHeight = 500;

                                        // Calculate the center position for the new window
                                        var windowLeft = (window.innerWidth - windowWidth) / 2;
                                        var windowTop = (window.innerHeight - windowHeight) / 2;

                                        // Open a small window with the specified dimensions
                                        window.open(twitterURL, '_blank', 'width=' + windowWidth + ', height=' + windowHeight + ', left=' + windowLeft + ', top=' + windowTop);


                                      })


                                    }
                                    var likePosts = document.getElementsByClassName("like")

                                    for (let index = 0; index < likePosts.length; index++) {

                                      likePosts[index].addEventListener('click', function () {

                                        var postid = this.getAttribute("postid");
                                        var id = this.getAttribute("class");
                                        console.log("id of post is" + postid);
                                        console.log("id of post is" + id);

                                        if (this.classList.contains("liked")) {
                                          this.classList.remove("liked");
                                          this.classList.add("unliked");
                                          likePost(postid, "unliked", function (data) {

                                            console.log("Data from AJAX call:", data);


                                            $(`#like-count`).text(data);

                                          })



                                        }
                                        else {
                                            likePost(postid, "liked", function (data) {

                                            console.log("Data from AJAX call:", data);

                                            $(`#like-count}`).text(data);
                                         

                                          })


                                          this.classList.remove("unliked");
                                          this.classList.add("liked");
                                          console.log("liked");

                                        }

                                      })

                                    }

                                      




                                    function postfetcher(itemid) {

                                      $("#catid2").val(itemid);
                                      document.getElementById("categoryForm").submit();

                                    }

                                  </script>



                                  <script>
                                    function likePost(postId, action, callback) {

                                      var nooflikes;


                                      $.ajax({

                                        type: 'POST',
                                        url: `postliked?postId=${postId}&action=${action}`,


                                        success: function (data) {
                                          console.log("post liked");
                                          console.log(data);
                                          callback(data);

                                           




                                        },
                                        error: function () {
                                          console.log("post liking failed");

                                        },





                                      })
                                      return nooflikes;
                                    }

                                    

                                  </script>



                        </body>

                        </html>