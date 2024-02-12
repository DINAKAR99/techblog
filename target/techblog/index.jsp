 
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "techblog.entites.Post" %>
<%@ page import= "techblog.entites.dao.PostDao" %>
<%@ page import= "techblog.entites.helper.ConnectionProvider" %>

 
<%@ page errorPage="error.jsp"%>


 
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Space+Mono&display=swap"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <script
      src="https://kit.fontawesome.com/ae336e36f1.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="css/style.css" />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />


    <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
  </head>
  <body>
    <%@include file="Navbar1.jsp" %>
    <div class="container-fluid customcolor text-white">
      <div class="container banner-background pb-2 mb-4" >
        <h3 class="display-3 text-center">WELCOME TO TECH-BLOG</h3>
        <p>
          A programming language is a system of notation for writing computer
          programs.[1] The source code for a simple computer program written in
          the C programming language. The gray lines are comments that help
          explain the program to humans in a natural language. When compiled and
          run, it will give the output "Hello, world!". A programming language
          is usually described in terms of its syntax (form) and semantics
          (meaning). These are usually defined by a formal language.[citation
          needed] A language usually has at least one implementation in the form
          of a compiler or interpreter, allowing programs written in the
          language to be executed. Programming language theory is the subfield
          of computer science that studies the design, implementation, analysis,
          characterization, and classification of programming languages.
        </p>

         <% if(u1==null){ %>
        <div style="text-align: center; margin-bottom: 20px">
          <button class="btn btn-lg index-button btn-hov mb-3">
            <span class="fa fa-external-link"></span>Start! Its Free
          </button>
          <a href="login.jsp" class="btn btn-lg index-button btn-hov mb-3"
            ><span class="fa fa-user-circle-o fa-spin"></span>Login</a
          >
        </div>

        <% }%>
      </div>
    </div>


    <!-- posts div -->
    <div class="container">
      <div class="row mb-2">

        
        <%  PostDao p1 = new PostDao(ConnectionProvider.getConnection());
        ArrayList<Post> fecthPosts = p1.fecthPosts();

          for (Post post : fecthPosts) {
            
            %>
            
            <div class="col-md-4 ">
              <div class="card mb-3 btn-hov1" style="width: 250px ; height: 400px; ">
            <img style="height: 200px" src="<%=request.getContextPath()%>/post_pics/<%= post.getpPic()%>" class="card-img-top" alt="post"  />
            <div class="card-body">
              <h5 class="card-title"> <%= post.getpTitle()%></h5>
              <p class="card-text">
             <%= post.getpContent()%>
            </p>
            <a href="#" class="btn btn-primary">MORE...</a>
          </div>
        </div>
      </div>
      
      <% } %>
    </div>
  </div>
  
  <!-- posts div -->
  <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
